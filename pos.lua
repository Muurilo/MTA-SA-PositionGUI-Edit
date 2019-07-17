--[[
Simple Script To Get Position
Made By |S.s|SoRa
--]]
GUIEditor_Window = {}
GUIEditor_Label = {}

GUIEditor_Window[1] = guiCreateWindow(538,176,246,229,"Position",false)
guiSetVisible ( GUIEditor_Window[1], false )
guiSetAlpha(GUIEditor_Window[1],1)
guiWindowSetSizable(GUIEditor_Window[1],false)
xp = guiCreateEdit(39,68,183,18,"",false,GUIEditor_Window[1])
GUIEditor_Label[1] = guiCreateLabel(24,68,9,16,"X",false,GUIEditor_Window[1])
GUIEditor_Label[2] = guiCreateLabel(24,97,9,16,"Y",false,GUIEditor_Window[1])
yp = guiCreateEdit(38,96,183,18,"",false,GUIEditor_Window[1])
GUIEditor_Label[3] = guiCreateLabel(24,122,9,16,"Z",false,GUIEditor_Window[1])
zp = guiCreateEdit(37,123,183,18,"",false,GUIEditor_Window[1])
get =  guiCreateButton(64,33,111,28,"Get My Position",false,GUIEditor_Window[1])
clip = guiCreateCheckBox(24,145,150,20,"Copy to Clipboard",false,false,GUIEditor_Window[1])
chat = guiCreateCheckBox(24,165,150,20,"Show On Chat",true,false,GUIEditor_Window[1])
round = guiCreateCheckBox(24,185,150,20,"Round",false,false,GUIEditor_Window[1])
GUIEditor_Label[4] = guiCreateLabel(51,205,22,18,"By :",false,GUIEditor_Window[1])
GUIEditor_Label[5] = guiCreateLabel(72,205,58,16,"|S.s|SoRa",false,GUIEditor_Window[1])
GUIEditor_Label[6] = guiCreateLabel(131,205,35,18,"Edit :",false,GUIEditor_Window[1])
GUIEditor_Label[7] = guiCreateLabel(162,205,60,20,"Bolsonaro",false,GUIEditor_Window[1])
guiLabelSetColor(GUIEditor_Label[5],255,0,0)
guiLabelSetColor(GUIEditor_Label[7],255,0,0)
function onGuiClick (button, state, absoluteX, absoluteY)
	if (source == get) then
  local x,y,z = getElementPosition (getLocalPlayer())

  if guiCheckBoxGetSelected(round) == true then 
    x = math.floor(x)
    y = math.floor(y)
    z = math.floor(z)
  end

  if guiCheckBoxGetSelected(clip) == true then 
    setClipboard(x..", "..y..", "..z.."")
    outputChatBox("Position Copied to Clipboard")
  end

if guiCheckBoxGetSelected(chat) == true then 
    outputChatBox("Your Position : "..x..", "..y..", "..z.."")
end
  
  guiSetText (xp, x)
  guiSetText (yp, y)
  guiSetText (zp, z)

  end
end
addEventHandler ("onClientGUIClick", getRootElement(), onGuiClick)
function pos()
if guiGetVisible ( GUIEditor_Window[1] ) then

                guiSetVisible ( GUIEditor_Window[1], false )
				showCursor(false)
        else

                guiSetVisible ( GUIEditor_Window[1], true )
				showCursor(true)
        end
end
addCommandHandler ( "pos", pos )
