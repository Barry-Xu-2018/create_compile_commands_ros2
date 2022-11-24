# Overview
If you use clangd in VS code, it depends on compile_commands.json.  
You can use below command to create compile_commands.json in ROS2 build environment  
```bash
$ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```
After finish, you will find a file named compile_commands.json under `build` directory.  
In build directory of each module under `build` directory, you also can find compile_commands.json for current module.

If you don't want to build a lot of modules for ROS2 to create compile_commands.json, you can use this script to create one compile_commands.json.  
This script will scan all build directory of module and create one compile_commands.json.  

# How to use
After you build some modules with `-DCMAKE_EXPORT_COMPILE_COMMANDS=1`
do
```bash
$ cp create_compile_commands_json.sh /PATH/TO/ROS2/build
$ ./create_compile_commands_json.sh
```
And then you will find one compile_commands.json at current directory.  
