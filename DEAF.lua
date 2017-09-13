-- Created by Sevenfm on Baconetworks, for herself and anyone who can't figure out how the hell to automate infusion crafting

-- Hook injectors
local component = require("component")

local counter = 1
local injectors = {}
for counter, componentType in component.list("inventory_controller") do
  print("Address for Injector" .. counter.. "?")
  local address = term.read()
  injectors[counter] = component.proxy(address)
  counter = counter + 1;
end

-- Read injectors for items
for count=1, 9 do
    injectorinfo = injectors[counter].getStackInSlot(4,1)
    if injectorinfo ~= nil then
      print("Injector ".. counter .. ": "..injectorinfo["size"].."x "..injectorinfo["label"])
      else
      print("Injector "..counter.." is empty")
    end
end
