# Require

## USAGE

It's useful to place in _G environment
```lua
require = require(Require)

-- Initialize with domains
require{ReplicatedStorage.Modules, ServerScriptService.Modules}

-- Require our modules.
local moduleA, moduleB = require{"ModuleA", "ModuleB"}
```

When writing independent modules, it's easy to integrate the possibility of users using this module via :
```lua
local require = _G.require or require
```

## What is it doing ?

After initializing require, require will do the following until a module with a matching name is found :
1. Check its cached modules.
2. Check any registered domains set in initialization.
3. Check children of the CALLING script (via getfenv(0).script).
