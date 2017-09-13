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
 
 
-- READ CORE
local coreinfo = core.getStackInSlot(1,1)
if coreinfo ~= nil then
  print("Core ".. coreinfo["size"].. "x "..coreinfo["label"])
else
  print("Core is empty")
end
 
-- READ INTERFACE
for counter=1,27 do
  local interfaceinfo = interface.getStackInSlot(4,counter)
  if interfaceinfo ~=nil then
    print("Interface slot ".. counter.. " "..interfaceinfo["size"].."x "..interfaceinfo["label"])
  else
    print("Interface slot ".. counter.. " is empty")
  end
end
 
 
-- READ INJECTORS
for counter=1, 9 do
  local injectorinfo = injector[counter].getStackInSlot(4,1)
  if injectorinfo ~= nil then
    print("Injector ".. counter .. ": "..injectorinfo["size"].."x "..injectorinfo["label"])
  else
    print("Injector ".. counter .." is empty")
  end
end
 
 
 
 
-- Initialize GUI
gpu.setDepth(4)
gpu.setForeground(colors.blue, true)
gpu.setBackground(colors.black, true)
 
gpu.setBackground(colors.red, true)
gpu.fill(w/2, 1, w, h/16, " ")
 
 
 
 
 
--Close GPU
gpu.setForeground(colors.blue, true)
gpu.setBackground(colors.black, true)
