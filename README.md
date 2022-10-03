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

## What is it doing ?

After initializing require, require will do the following until a module with a matching name is found :
1. Check its cached modules
2. Check children of the CALLING script (via getfenv(0).script)
3. Check any registered domains set in initialization.