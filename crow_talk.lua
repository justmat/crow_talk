-- talk to crow

local my_string = ""


function init()
  screen.aa(0)
  print("caw!")
end


function keyboard.char(character)
  my_string = my_string .. character -- add characters to my string
  redraw()
end


function keyboard.code(code,value)
  if value == 1 or value == 2 then -- 1 is down, 2 is held, 0 is release
    if code == "BACKSPACE" then
      my_string = my_string:sub(1, -2) -- erase characters from my_string
    elseif code == "ENTER" then
      crow.send(my_string) -- send command to crow
      my_string = "" -- clear my_string
    end
    redraw()
  end
end


function redraw()
  screen.clear()
  screen.display_png("/home/we/dust/code/crow_talk/assets/crow.png",78, 8) -- put a bird on it
  screen.level(10)
  screen.rect(2, 50, 125, 14)
  screen.stroke()
  screen.move(5,59)
  screen.text("> " .. my_string)
  screen.update()
end
