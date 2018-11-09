local computer = require("computer")
local robot = require("robot")
robot.forward()
for i=1,10 do computer.beep(math.random() * (1500 - 300) + 300) end
robot.back()
