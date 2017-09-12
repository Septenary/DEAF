-- Created by Sevenfm on Baconetworks, for herself and anyone who can't figure out how the hell to automate infusion crafting

-- Hook injectors
local component = require("component")

local counter = 1
local injectors = {}
for address, componentType in component.list("inventory_controller") do
  print(tostring(address) .. "," .. componentType)
  injector[counter] = component.proxy(address)
  counter = counter + 1;
end

