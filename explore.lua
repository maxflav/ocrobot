robot = require("robot")
component = require("component")
computer = require("computer")
math = require("math")
navigation = component.navigation


function getCurrentDistance ()
    waypoints = navigation.findWaypoints(64)
    if #waypoints > 0 then
        _, home = next(waypoints)
        homePos = home.position -- relative to my pos
    else
        homePos = navigation.getPosition() -- should make it navigate to 0,0,0?
    end

    homeX, homeY, homeZ = homePos[1], homePos[2], homePos[3]
    return math.max(math.abs(homeX), math.abs(homeY), math.abs(homeZ))
end

function step ()
    originalDistance = getCurrentDistance()
    -- print(originalDistance)
    blocked, whatsThere = robot.detect()
    shouldTurn = false
    if not blocked then
        robot.forward()
        newDistance = getCurrentDistance()
        if newDistance > originalDistance and originalDistance > 1 then
            -- print("too far go back")
            robot.back()
            shouldTurn = true
        end
    else
        shouldTurn = true
    end

    if shouldTurn or math.random() < 0.1 then
        if math.random() < 0.5 then
            robot.turnLeft()
        else
            robot.turnRight()
        end
    end
end

while true do
    step()
    -- computer.beep(math.random() * (1500 - 300) + 300)
end
