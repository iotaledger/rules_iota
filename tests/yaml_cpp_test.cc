#include <iostream>
#include <yaml-cpp/yaml.h>

int main(int argc, char **argv) {

  auto conf = YAML::LoadFile("config_example.yaml");

  std::cout << "name: " << conf["michael"]["name"] << std::endl;
  std::cout << "job: " << conf["michael"]["job"] << std::endl;

  std::cout << "name: " << conf["dwight"]["name"] << std::endl;
  std::cout << "job: " << conf["dwight"]["job"] << std::endl;

  return 0;
}
