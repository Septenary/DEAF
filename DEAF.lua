-- Created by Sevenfm on Baconetworks, for herself and anyone who can't figure out how the hell to automate infusion crafting nicely
 
-- DEPEDNANCIES
local component = require("component")
local term = require("term")
local gpu = component.gpu
local colors = require("colors")
local w, h = gpu.getResolution()
 
-- CONFIG
local injectorAddress = {"8f55", "e9ad", "d050", "7946", "caf2", "ea9d", "ca03", "7695", "ddf1"}
local interfaceAddress = "c3a8"
--local monitorAddress = "2fd9"
local coreAddress = "99fc"
 
-- HOOK INJECTORS
local injector = {}
for counter=1,9 do
injector[counter] = component.proxy(component.get(injectorAddress[counter]))
--print(injector[counter].address)
end
 
-- HOOK INTERFACES
local interface = component.proxy(component.get(interfaceAddress))
--print(interface.address)
 
-- HOOK CORE
local core = component.proxy(component.get(coreAddress))
--print(interface.address)
 
-- READINFO
readinfo = function(type, var, push)
var.getStackInSlot(4,push)
  if var ~= nil then
     print(type .. var["size"].."x "..var["label"])
  else
     print(type .. " is empty")
  end
end

-- READ CORE
readinfo(Core, core, 1)

-- READ INTERFACE
for counter=1,27 do
readinfo(Interface, interface, counter)
end
 
-- READ INJECTORS
readinfo(Injector, injector, 1)
 
 
 
-- Initialize GUI
gpu.setDepth(4)
gpu.setForeground(colors.blue, true)
gpu.setBackground(colors.black, true)
 
gpu.setBackground(colors.green, true)
gpu.fill(w/2, 1, w, h/32, " ")
 
 
 
 
--Close GPU
gpu.setForeground(colors.blue, true)
gpu.setBackground(colors.black, true)
