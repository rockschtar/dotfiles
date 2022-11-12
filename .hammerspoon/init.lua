function table.indexOf(t, object)
  if type(t) ~= "table" then error("table expected, got " .. type(t), 2) end

  for i, v in pairs(t) do
      if object == v then
          return i
      end
  end
end

hs.hotkey.bind({'ctrl', 'shift'}, 'return', function() 
  hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind({'ctrl', 'shift'}, 'left', function()  
  local spaces = hs.spaces.spacesForScreen()
  local currentSpace = hs.spaces.focusedSpace();
  local currentSpaceIndex = table.indexOf(spaces, currentSpace);
  
  if currentSpaceIndex == nil or currentSpaceIndex == nil then
    return
  end

  local focusedWindow = hs.window.focusedWindow() 
  local leftSpaceIndex = currentSpaceIndex - 1;
  local leftSpace = spaces[leftSpaceIndex];

  hs.spaces.moveWindowToSpace(focusedWindow, leftSpace);
  hs.spaces.gotoSpace(leftSpace)
end)

hs.hotkey.bind({'ctrl', 'shift'}, 'right', function() 
 
  local spaces = hs.spaces.spacesForScreen()
  local currentSpace = hs.spaces.focusedSpace();
  local currentSpaceIndex = table.indexOf(spaces, currentSpace);
    
  local countSpaces = 0
  
  for _ in pairs(spaces) do countSpaces = countSpaces + 1 end

  if currentSpaceIndex >= countSpaces or currentSpaceIndex == nil then
    return
  end

  local focusedWindow = hs.window.focusedWindow() 
  local rightSpaceIndex = currentSpaceIndex + 1;
  local rightSpace = spaces[rightSpaceIndex];

  hs.spaces.moveWindowToSpace(focusedWindow, rightSpace);
  hs.spaces.gotoSpace(rightSpace)
end)
