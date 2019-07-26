#include <iostream>
#include <fstream>
#include <yaml-cpp/yaml.h>

int main(int argc, char **argv) {
  YAML::Emitter emitter;
  emitter << YAML::BeginMap;
  emitter << YAML::Key << "michael";
  emitter << YAML::Value << YAML::BeginMap;
  emitter << YAML::Key << "name";
  emitter << YAML::Value << "Michael Scott";
  emitter << YAML::Key << "job";
  emitter << YAML::Value << "Regional manager";
  emitter << YAML::EndMap;
  emitter << YAML::Key << "dwight";
  emitter << YAML::Value << YAML::BeginMap;
  emitter << YAML::Key << "name";
  emitter << YAML::Value << "Dwight Schrute";
  emitter << YAML::Key << "job";
  emitter << YAML::Value << "Assitant to the regional manager";
  emitter << YAML::EndMap;
  emitter << YAML::EndMap;

  std::ofstream fout("config_test_example.yaml");
  fout << emitter.c_str();
  fout.close();
  auto conf = YAML::LoadFile("config_test_example.yaml");

  std::cout << "name: " << conf["michael"]["name"] << std::endl;
  std::cout << "job: " << conf["michael"]["job"] << std::endl;

  std::cout << "name: " << conf["dwight"]["name"] << std::endl;
  std::cout << "job: " << conf["dwight"]["job"] << std::endl;
  return 0;
}
