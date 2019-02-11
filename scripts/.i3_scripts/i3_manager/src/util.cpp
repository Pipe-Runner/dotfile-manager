#include <util.h>
#include <vector>
#include <string>

std::vector<std::string> Window_information::get_list(int workspace_number)
{
	return Window_information::workspaces[workspace_number];
}

void Window_information::set_list(int workspace_number, std::vector<std::string> class_names)
{
	Window_information::workspaces[workspace_number] = class_names;
}