#include <bits/stdc++.h>
#include <util.h>
#include <i3ipc++/ipc.hpp>

void dump_tree_container(const i3ipc::container_t &c)
{
	if (c.type == "workspace")
	{
		std::cout << "type = \"" << c.type << "\"" << std::endl;
	}
	else if (c.type == "con")
	{
		std::cout << "ID: " << c.id << std::endl;
		std::cout << "X: " << c.xwindow_id << std::endl;
		std::cout << "name = \"" << c.name << "\"" << std::endl;
		std::cout << "type = \"" << c.type << "\"" << std::endl;
	}

	if (c.urgent)
	{
		std::cout << "urgent" << std::endl;
	}
	if (c.focused)
	{
		std::cout << "focused" << std::endl;
	}
	for (auto &n : c.nodes)
	{
		dump_tree_container(*n);
	}
}

void get_window_class_list()
{
}

void update_workspace_names()
{
}

int main()
{
	// Create a connection with i3wm
	i3ipc::connection conn;

	// Subscribed to both window an workspace events
	conn.subscribe(i3ipc::ET_WORKSPACE | i3ipc::ET_WINDOW);

	// handler of workspace event
	conn.signal_workspace_event.connect([&conn](const i3ipc::workspace_event_t &ev) {
		std::cout << "workspace_event: " << (char)ev.type << std::endl;

		// Then we dump the tree
		dump_tree_container(*conn.get_tree());
	});

	// handler of window event
	conn.signal_window_event.connect([&conn](const i3ipc::window_event_t &ev) {
		std::cout << "---------------- window_event: " << (char)ev.type << std::endl;

		// Then we dump the tree
		std::string prefix_buf;
		dump_tree_container(*conn.get_tree());

		for (auto &w : conn.get_workspaces())
		{
			std::cout << w->num << std::endl;
			std::cout << w->name << std::endl;
		}
	});

	// starting event handling loop
	while (true)
	{
		conn.handle_event();
	}

	std::cout << "Hello World";
	return 0;
}