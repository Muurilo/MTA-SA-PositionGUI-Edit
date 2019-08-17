GUIEditor_Window = {}
GUIEditor_Label = {}

function panel()
  GUIEditor_Window[1] = guiCreateWindow(538,176,246,229,"Position",false)
  -- Hide Panel
  guiSetVisible ( GUIEditor_Window[1], false )
  
  -- Properties
  guiSetAlpha(GUIEditor_Window[1],1)
  guiWindowSetSizable(GUIEditor_Window[1],false)
  
  -- Get Position
  get =  guiCreateButton(64,33,111,28,"Get My Position",false,GUIEditor_Window[1])
  
  -- X
  GUIEditor_Label[1] = guiCreateLabel(24,68,9,16,"X",false,GUIEditor_Window[1])
  xp = guiCreateEdit(39,68,183,18,"",false,GUIEditor_Window[1])

  -- Y
  GUIEditor_Label[2] = guiCreateLabel(24,97,9,16,"Y",false,GUIEditor_Window[1])
  yp = guiCreateEdit(38,96,183,18,"",false,GUIEditor_Window[1])

  -- Z
  GUIEditor_Label[3] = guiCreateLabel(24,122,9,16,"Z",false,GUIEditor_Window[1])
  zp = guiCreateEdit(37,123,183,18,"",false,GUIEditor_Window[1])
  
  -- Check Box
  chat = guiCreateCheckBox(24,145,150,20,"Show On Chat",true,false,GUIEditor_Window[1])
  round = guiCreateCheckBox(24,165,150,20,"Round",false,false,GUIEditor_Window[1])
  clip = guiCreateCheckBox(24,185,150,20,"Copy to Clipboard",false,false,GUIEditor_Window[1])


end

-- Draw the Panel
panel()


function onGuiClick (button, state, absoluteX, absoluteY)
	if (source == get) then
  local x,y,z = getElementPosition (getLocalPlayer())
  
  -- Round Position
  if guiCheckBoxGetSelected(round) == true then 
    x = math.floor(x)
    y = math.floor(y)
    z = math.floor(z)
  end

  -- Show on chat
  if guiCheckBoxGetSelected(chat) == true then 
    outputChatBox("Your Position : "..x..", "..y..", "..z.."")
  end

  -- Copy to clipboard
  if guiCheckBoxGetSelected(clip) == true then 
    setClipboard(x..", "..y..", "..z.."")
    outputChatBox("Position Copied to Clipboard")
  end
  
  -- Show the position on panel
  guiSetText (xp, x)
  guiSetText (yp, y)
  guiSetText (zp, z)

  end

end
addEventHandler("onClientGUIClick", getRootElement(), onGuiClick)

function pos()
  if guiGetVisible(GUIEditor_Window[1]) then
        guiSetVisible(GUIEditor_Window[1], false)
	showCursor(false)
        else
        guiSetVisible(GUIEditor_Window[1], true)
	showCursor(true)
  end
end

addCommandHandler("pos", pos)
