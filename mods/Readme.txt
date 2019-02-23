The mods folder is a great new feature of CS2D v 1.0.0.2!
It allows you to easily create and manage custom files which are used instead of the original graphics/sounds, as well as Lua scripts and configs.
This new system makes mods possible without actually touching or replacing the original game files.

For this to work you just have to do the following:

- create a folder for your mod inside the "mods"-folder (name it whatever you want)
- create a "gfx" and/or "sfx" folder inside that folder
- put files with the same names as in the original "sfx" and "gfx" folders inside the folder
- this works also with files in subfolders of "gfx"/"sfx"! Just make sure the folder structure is the same
- Start CS2D with the launcher and enable your mod(s) OR start it with the parameter "-mods MODFOLDERS" - mod folders are comma-separated (mod1,mod2,...)
- (OPTIONAL) create a "lua" folder and create a file called "main.lua" - it will be executed on start! more info below
- (OPTIONAL) create a file called "config.cfg" in the mod folder to execute those commands on game start
- (OPTIONAL) create a file called "mod.txt" to give information about a mod. each line has one property (name=My Mod; description=My super mod; etc.). it is recommended to provide a name, description, author and version

Keep in mind:

- This really only works for the main skins/sounds of the game
- Custom sounds and sprites used in Lua scripts and maps will still be loaded from the original folder
- Maps are not read from mod folders

Lua information:

- as always, mod Lua files are only executed when you start a server with a mod
- main.lua has two special global variables:
    - MOD_DIR is a string containing the path to the current mod folder - not the lua folder! (includes trailing slash)
    - MOD_INFO is a table containing all the information from mod.txt - keys are the property names and values are their values

IMPORTANT!!! When installing mods on a server, you can add mod files to servertransfer.lst - simply add lines of the format "mods/MODNAME/..." for each mod file. These files will be transferred to clients and stored in a special mod cache. Depending on the clients' settings (Options -> Net), the cache may be cleared regularly or kept indefinitely.