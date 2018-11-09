local shell = require("shell")
local args = {...}
if #args < 1 then
  print("Include a file to download")
else
  shell.execute('wget -fq "https://raw.githubusercontent.com/maxflav/ocrobot/master/' .. args[1] .. '.lua"')
end
