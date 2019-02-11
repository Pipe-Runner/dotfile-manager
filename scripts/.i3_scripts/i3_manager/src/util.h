#include <string>
#include <vector>

class Window_information
{
	std::vector<std::vector<std::string>> workspaces;

  public:
	Window_information();

	std::vector<std::string> get_list(int workspace_number);

	void set_list(int workspace_number, std::vector<std::string> class_names);
};