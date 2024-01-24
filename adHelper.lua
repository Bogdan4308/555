script_author('Budanov for Banderas Family')
script_name("adHelper")
local script__version = '1.2'
script_version(script__version)
local keys = require "vkeys"
script_description('Підрахунок к-ті оголошень в ЗМІ та інвайтів')
require("lib.moonloader")
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8= encoding.UTF8
local secondary_window_state = imgui.ImBool(false)
local main_window_state = imgui.ImBool(false)
local third_window_state = imgui.ImBool(false)
local fourth_window_state = imgui.ImBool(false)
local fifth_window_state = imgui.ImBool(false)
local sixth_window_state = imgui.ImBool(false)
local seventh_window_state = imgui.ImBool(false)
local text_buffer = imgui.ImBuffer(256)
local text_buffer1 = imgui.ImBuffer(256)
local text_buffer2 = imgui.ImBuffer(256)
local text_buffer3 = imgui.ImBuffer(256)
local text_buffer4 = imgui.ImBuffer(256)
local text_buffer5 = imgui.ImBuffer(256)
local text_buffer6 = imgui.ImBuffer(256)
local text_buffer7 = imgui.ImBuffer(256)
local text_buffer8 = imgui.ImBuffer(2048)
local text_buffer9 = imgui.ImBuffer(256)
local text_buffer10 = imgui.ImBuffer(256)
local text_buffer11 = imgui.ImBuffer(2048)
local text_buffer12 = imgui.ImBuffer(256)
local text_buffer13 = imgui.ImBuffer(256)
local text_buffer_name = imgui.ImBuffer(256)
local slider = imgui.ImInt(0)
local checked_piar = imgui.ImBool(false)
local checked_spc = imgui.ImBool(false)
local checked_not = imgui.ImBool(false)

local checked_giv = imgui.ImBool(false)
local checked_time = imgui.ImBool(false)
local checked_kick = imgui.ImBool(true)
local checked_clean = imgui.ImBool()
local invstat = false
local state7 = false
local testY = 30
local stepTime = 0
local state_not = false
local state_not1 = false
local bls = "_"
local state_kick = false
local state_noti = false
local chat = {'/fam','/n'}
local givinfo = "+"
local sw, sh = getScreenResolution()
local ffi = require "ffi"
ffi.cdef[[
     void keybd_event(int keycode, int scancode, int flags, int extra);
]]
local font = renderCreateFont("Arial", 10, 13)
local posX = 1670
local posY = 240
local pos1X = 1770
local pos1Y = 240
local state_inp = false
local pos2X = 1745
local pos2Y = 240
local postimeX = 0 
local postime1X = 0
local postime2X = 0
local posnotiX = 1670
local posnotiY = 270
local posnoti1X = 1770
local posnoti1Y = 270
local posnoti2X = 1745
local flag666 = true
local posnoti2Y = 270
require 'sampfuncs' 
local password = "4308"
local dsandtg = '/fam Добавляйтесь в дс фами wmhan' 
local label = 1
local sampev = require 'lib.samp.events' 
local StepAD = 0
local StepInv = 0
local pausedtime = 0
local StepNot = 0
local Sum = 0
local TimeInfo1 = false
local timerinfo = 0
local tt3 = 0
local mainTime = 0
local colors = 0xFF0000
local colors1= 0xFF0000
local active = false
local streamed = false
local slider1 = imgui.ImInt(0)
local piar = false
local piar1 = false
local startTime
local running = false
local running1 = false
local running2 = false
local timerinfo = false
local timestateinfo = false
local statetime = true
local statetime1 = false
local InputText_state = true
local delay = 0
local warn = 0
local hour = 0
local minutes = 0
local minutescounter = 0
local seconds = 0
local state_w = false
local info = u8"Введіть пароль"
local info2 = 5
local elapsedSeconds = 0
local elapsedSeconds1 = 0
local elapsedSeconds2 = 0
local elapsedSeconds3 = 0
local notelapsedtime = 0
local piarelapsedtime = 0
local slidertime = 0
local slidertime1 = 0
local info_flag = false
local render_state = true


function startTimer()
    if statetime then
        startTime = os.time()
        running = true
		statetime = false
        
	end
end

function stoptTimer()
    running = false
end

function startTimer1()
        startTime1 = os.time()
        running = true
		statetime1 = false
       
end

function stoptTimer1()
    running1 = false

end

function startTimer2()
        startTime2 = os.time()
        running1 = true
       
end

function stoptTimer2()
    running1 = false
end

function startTimer3()
        startTime3 = os.time()
        running2 = true
       
end

function stoptTimer3()
    running2 = false
end









function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
     style.WindowPadding = ImVec2(15, 15)
     style.WindowRounding = 8.0
     style.FramePadding = ImVec2(5, 5)
     style.ItemSpacing = ImVec2(12, 8)
     style.ItemInnerSpacing = ImVec2(8, 6)
     style.IndentSpacing = 25.0
     style.ScrollbarSize = 15.0
     style.ScrollbarRounding = 15.0
     style.GrabMinSize = 15.0
     style.GrabRounding = 7.0
     style.ChildWindowRounding = 8.0
     style.FrameRounding = 6.0
   
 
       colors[clr.Text]                 = ImVec4(1.00, 1.00, 1.00, 0.78)
            colors[clr.TextDisabled]         = ImVec4(0.36, 0.42, 0.47, 1.00)
            colors[clr.WindowBg]             = ImVec4(0.11, 0.15, 0.17, 1.00)
            colors[clr.ChildWindowBg]        = ImVec4(0.15, 0.18, 0.22, 1.00)
            colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
            colors[clr.Border]               = ImVec4(0.43, 0.43, 0.50, 0.50)
            colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
            colors[clr.FrameBg]              = ImVec4(0.25, 0.29, 0.20, 1.00)
            colors[clr.FrameBgHovered]       = ImVec4(0.12, 0.20, 0.28, 1.00)
            colors[clr.FrameBgActive]        = ImVec4(0.09, 0.12, 0.14, 1.00)
            colors[clr.TitleBg]              = ImVec4(0.09, 0.12, 0.14, 0.65)
            colors[clr.TitleBgActive]        = ImVec4(0.35, 0.58, 0.06, 1.00)
            colors[clr.TitleBgCollapsed]     = ImVec4(0.00, 0.00, 0.00, 0.51)
            colors[clr.MenuBarBg]            = ImVec4(0.15, 0.18, 0.22, 1.00)
            colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.39)
            colors[clr.ScrollbarGrab]        = ImVec4(0.20, 0.25, 0.29, 1.00)
            colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
            colors[clr.ScrollbarGrabActive]  = ImVec4(0.09, 0.21, 0.31, 1.00)
            colors[clr.ComboBg]              = ImVec4(0.20, 0.25, 0.29, 1.00)
            colors[clr.CheckMark]            = ImVec4(0.72, 1.00, 0.28, 1.00)
            colors[clr.SliderGrab]           = ImVec4(0.43, 0.57, 0.05, 1.00)
            colors[clr.SliderGrabActive]     = ImVec4(0.55, 0.67, 0.15, 1.00)
            colors[clr.Button]               = ImVec4(0.40, 0.57, 0.01, 1.00)
            colors[clr.ButtonHovered]        = ImVec4(0.45, 0.69, 0.07, 1.00)
            colors[clr.ButtonActive]         = ImVec4(0.27, 0.50, 0.00, 1.00)
            colors[clr.Header]               = ImVec4(0.20, 0.25, 0.29, 0.55)
            colors[clr.HeaderHovered]        = ImVec4(0.72, 0.98, 0.26, 0.80)
            colors[clr.HeaderActive]         = ImVec4(0.74, 0.98, 0.26, 1.00)
            colors[clr.Separator]            = ImVec4(0.50, 0.50, 0.50, 1.00)
            colors[clr.SeparatorHovered]     = ImVec4(0.60, 0.60, 0.70, 1.00)
            colors[clr.SeparatorActive]      = ImVec4(0.70, 0.70, 0.90, 1.00)
            colors[clr.ResizeGrip]           = ImVec4(0.68, 0.98, 0.26, 0.25)
            colors[clr.ResizeGripHovered]    = ImVec4(0.72, 0.98, 0.26, 0.67)
            colors[clr.ResizeGripActive]     = ImVec4(0.06, 0.05, 0.07, 1.00)
            colors[clr.CloseButton]          = ImVec4(0.40, 0.39, 0.38, 0.16)
            colors[clr.CloseButtonHovered]   = ImVec4(0.40, 0.39, 0.38, 0.39)
            colors[clr.CloseButtonActive]    = ImVec4(0.40, 0.39, 0.38, 1.00)
            colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
            colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
            colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
            colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
            colors[clr.TextSelectedBg]       = ImVec4(0.25, 1.00, 0.00, 0.43)
            colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

apply_custom_style()


function main()
    if not isSampLoaded() and not isSampfuncsLoaded() then return end 
    while not isSampAvailable() do wait(0) end
	
	sampRegisterChatCommand("adf", cmd_ad)
	sampRegisterChatCommand("ah", cmd_ah)
	sampRegisterChatCommand("famuninvite", cmd_kick)
	imgui.Process = false
	if label == 1 then
	   wait(500)
	   sampAddChatMessage('[AdHelper] Cкрипт успішно завантажено', 0x00FA9A) 
	   sampAddChatMessage('[AdHelper] Budanov for Banderas Family', 0x00FA9A)
	   sampAddChatMessage('[AdHelper] Команди - /ah', 0x00FA9A)
		
	end
	local timeinfo = os.date("%d")
	local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean.txt', 'r')
	if file then
	    cl = file:read()
        file:close()
    end
	local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean1.txt', 'r')
	if file then
	    c5 = file:read()
        file:close()
    end
	
	local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'r')
        if file then
			p = file:read()
		    file:close()
		end
	
	if c5 == "1" then
	    checked_clean.v = true
	end
	if c5 == "0" then
	    checked_clean.v = false
	end
	
	
	local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\timeinfo.txt', 'r')
	    if file then
	        hour = file:read()
			minutes2 = file:read()
			seconds2 = file:read()
			timescreen = file:read()
            file:close()
        end
	if tonumber(hour) == 0 or tonumber(minutes2) == 0 or tonumber(seconds2) == 0 or tonumber(timescreen) == 0 then
	    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\timeinfo.txt', 'w')
	    if file then
	        file:write(hour,'\n')
	        file:write(minutes, '\n')
			file:write(seconds, '\n')
			if timestateinfo then
			    file:write("1")
			else
			    file:write("0")
			end
            file:close()
        end
	
	end
	
	minutes = minutes + tonumber(minutes2)
	
	startTimer()
	startTimer1()
	
	local currentTime = os.time()
    elapsedSeconds = currentTime - startTime + tonumber(seconds2)
	
	if timescreen == "1" then
	    checked_time.v = true
		timestateinfo = true
	
	end
	
	if timescreen == "0" then
	    checked_time.v = false
	    timestateinfo = false
	end
	
		

	
	
	if cl ~= timeinfo and checked_clean.v then
	    StepAD = 0
		StepInv = 0
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	    if file then
	        file:write("0", '\n')
			file:write("0")
            file:close()
        end
		
	
	end
	

	
	
	while true do
	 
	    renderFontDrawText(font, 'ЗМІ: '.. StepAD, posX, posY, 0xFFFFFFFF, 0x90000000)
		renderFontDrawText(font, '|', pos2X, pos2Y, 0xFFFFFFFF, 0x90000000)
		renderFontDrawText(font, 'Інвайти: '.. StepInv, pos1X, pos1Y, 0xFFFFFFFF, 0x90000000)
		if timestateinfo and p == password then
		    renderFontDrawText(font, hour, posnotiX + postimeX - 10, posnotiY - 50, 0xFFFFFFFF, 0x90000000)
			renderFontDrawText(font, ":", posnotiX + 70 - 10, posnotiY - 50, 0xFFFFFFFF, 0x90000000)
			renderFontDrawText(font, minutes, posnoti2X + 3 - 10, posnoti2Y - 50, 0xFFFFFFFF, 0x90000000)
			renderFontDrawText(font, ":", posnoti2X + postime1X - 10, posnoti2Y - 50, 0xFFFFFFFF, 0x90000000)
		    renderFontDrawText(font, seconds, posnoti2X + postime2X - 10, posnoti2Y - 50, 0xFFFFFFFF, 0x90000000)
			
		
		end
		

		
		
		
		if tonumber(minutes) < 8 then
		    postime1X = 15
			postime2X = 25
		    
		else
		    postime1X = 23
			postime2X = 30
		
		
		end
		 
		
		if tonumber(hour) < 8 then
		    postimeX = 58
		else
		    postimeX = 50
			if tonumber(hour) > 99 then
			    postimeX = 43
			
			else
			    postimeX = 50
			    
			    
			end
	    
 		
	    end
		

	
		
		local timer = os.date("%d")
        local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean.txt', 'w')
	    if file then
	        file:write(timer)
			file:close()
	    end
		
		
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\timeinfo.txt', 'w')
	    if file then
	        file:write(hour,'\n')
	        file:write(minutes, '\n')
			file:write(seconds, '\n')
			if timestateinfo then
			    file:write("1")
			else
			    file:write("0")
			end
            file:close()
        end
	 
		
		if StepAD > 3 then
	    colors = 0xFF6347
        end
		if StepAD > 8 then
	    colors = 0xFFA500
        end
		if StepAD > 13 then
	    colors = 0xFFD700
        end
		if StepAD > 18 then
		colors = 0xFFFF00
		end
		if StepAD > 23 then
		colors = 0xADFF2F
		end
		if StepAD > 28 then
		colors = 0x7FFF00
		end
		if StepAD > 33 then
		colors = 0x7CFC00
		end
		if StepAD > 38 then
		colors = 0x00FF00
		end
		if StepInv > 0 then
	    colors1 = 0xFFFF00
        end
		if StepInv > 2 then
	    colors1 = 0x00FF00
		end
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\notifications.txt', 'r')
	    if file then
			not1 = file:read()
            not2 = file:read()
		    not3 = file:read()
			not4 = file:read()
		    file:close()
		end
        if flag666 then
		    slider1.v = not4
			flag666 = false
		
		end
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'r')
	    if file then
	        a = file:read()
			b = file:read()
            file:close()
        end
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Ad.txt', 'r')
	    if file then
		    dsandtg = file:read()
			file:close()
		end
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'r')
        if file then
			p = file:read()
		    file:close()
		end
		
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\state.txt', 'r')
        if file then
			state_s = file:read()
		    file:close()
		end
		if not alreadyExecuted then
		    StepAD= StepAD + a
			StepInv= StepInv + b
		    alreadyExecuted = true
	    end
		
	
		
		
		
	
		

		if piar1 and active then
			piarelapsedtime = 0
			stoptTimer3()
		    sampSendChat('/ad Семья Banderas ищет друзей')
		    wait(200)
		    EmulateKey(VK_RETURN, true)
		    wait(200)
            EmulateKey(VK_RETURN, false)
		    wait(200)
		    EmulateKey(VK_RETURN, true)
		    wait(200)
            EmulateKey(VK_RETURN, false)
		    wait(200)
		    EmulateKey(VK_RETURN, true)
		    wait(200)
            EmulateKey(VK_RETURN, false)
			piar1 = false
	
		
		end
		
		if running and not statetime then
            local currentTime = os.time()
            elapsedSeconds = currentTime - startTime 
   
		end
		
		if running1 then
	        local currentTime2 = os.time()
            elapsedSeconds2 = currentTime2 - startTime2 
			notelapsedtime = slidertime*60 - elapsedSeconds2
			if notelapsedtime < 0 then
			    notelapsedtime = 0
			
			end
	
	    end
		
		if running2 then
	        local currentTime3 = os.time()
            elapsedSeconds3 = currentTime3 - startTime3 
			piarelapsedtime = slidertime1*60 - elapsedSeconds3
			if piarelapsedtime < 0 then
			    piarelapsedtime = 0
			
			end
	
	    end
		

		seconds = elapsedSeconds
		if seconds > 59 then 
		    statetime = true
		    startTimer()
		    seconds = 0
		    minutes = minutes + 1
		
		end
		
		if minutes > 59 then
		    minutes = 0
		    hour = hour + 1
		
		end
		if running and not statetime1 then
            local currentTime1 = os.time()
            elapsedSeconds1 = currentTime1 - startTime1
			if elapsedSeconds1 > 60*20 then
			    statetime = true
				statetime1 = true
				pausedtime = os.time()
			else 
			    statetime = false
			end
   
		end
		Sum = StepAD*23400
		
		Earn= Sum*20/100 + Sum
	
	    InvSum = StepInv*500000
		if p == password then
		    timeSum = (10000000/168)*hour
	        allSum = Earn + InvSum + timeSum
		else
		    allSum = Earn + InvSum 
		end
		
			

     			
			
		if isKeyJustPressed(VK_W) or isKeyJustPressed(VK_A) or isKeyJustPressed(VK_S) or isKeyJustPressed(VK_D) or isKeyJustPressed(VK_LBUTTON) then
			startTimer1()
			if statetime then
			    local pauseDuration = os.time() - pausedtime
                startTime = startTime + pauseDuration
			
			end
			statetime = false
			statetime1 = false
	
			
	
		
		end
		

	
	
		
		
		
		if state_not1 and state_not then  
		    state_not = false
			stoptTimer2()
			notelapsedtime = 0
			lua_thread.create(function()
		    sampSendChat(u8:decode(not1))
		    wait(5000)
			sampSendChat(u8:decode(not2))
			wait(5000)
		    sampSendChat(u8:decode(not3))
			slidertime = tonumber(slider1.v)
			StepNot = StepNot + 1
			startTimer2()
		    wait(slider1.v*60000)
			if state_noti then
				state_not = true
			end
			end)
		
		end
		
		renderFontDrawText(font, "ЗП: "..formatNumberWithCommas(math.ceil(allSum)).."$", posnoti2X - 75 , posnoti2Y + 20 - testY, 0xFFFFFFFF, 0x90000000)

		
		if state_not1 then
		    testY = 0
		    renderFontDrawText(font, "{FFFF00}"..StepNot, posnotiX - 30, posnotiY, 0xFFFFFFFF, 0x90000000)
			renderFontDrawText(font, "{FFFF00}КД:", posnotiX + 10, posnotiY, 0xFFFFFFFF, 0x90000000)
		    renderFontDrawText(font, "{FFFF00}"..notelapsedtime, posnoti2X - 37, posnoti2Y, 0xFFFFFFFF, 0x90000000)		
		else
		    if not checked_piar.v then
		        testY = 30
			end
				

				

			
		
		end
		
		if checked_piar.v then
		    testY = 0
		    renderFontDrawText(font, "{228B22}КД: "..piarelapsedtime, posnoti2X + 40 , posnoti2Y, 0xFFFFFFFF, 0x90000000)
		
		
		    
	
				
		
		end
		
	
		local tt = os.date("%H:%M:%S")
		if tt == "00:00:00" and checked_clean.v then
		    StepAD = 0
		    StepInv = 0
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	        if file then
	            file:write("0", '\n')
			    file:write("0")
                file:close()
            end
		    
		end
		

		wait(0)
	end	
end

function sampev.onServerMessage(color, text)
    nick, id, input = string.match(text, '([a-zA-Z_]+)%[(%d+)%]:{B9C1B8} самостоятельно покинул семью!')
	if nick then
	    lua_thread.create(function()
		wait(100)
		sampAddChatMessage(nick.."["..id.."] добавлений у чорний список!", 0xFF0000)
		end)
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Blacklist.txt', 'r')
		if file then
	        b15 = file:read("*all")
            file:close()
		end
		fifth_window_state.v = true 
		text_buffer8.v = (b15..nick..u8"(лів)".."\n")
		fifth_window_state.v = false
		imgui.Process = fifth_window_state.v
	end
	nick1, id1, input1 = string.match(text, '([a-zA-Z_]+)%[(%d+)%]:{FFFFFF} Пополнил склад семьи на (.+)')
	if nick1 then
	    local timehs = os.time()
        local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Логи\\LogMoney.txt', 'a')
	    if file then
            file:write(os.date('%x [%X] ', timehs)..nick1.." поклав "..input1, '\n')
            file:close()
	    end
	
	end
	
	nick2, id2, input2 = string.match(text, '([a-zA-Z_]+)%[(%d+)%]:{FFFFFF} Взял (.+) со склада семьи!')
	if nick2 then
	    local timehs = os.time()
        local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Логи\\LogMoney.txt', 'a')
	    if file then
            file:write(os.date('%x [%X] ', timehs)..nick2.." взяв "..input2, '\n')
            file:close()
	    end
	
	end
	
	nick3, id3, input3 = string.match(text, "([a-zA-Z_]+)%[(%d+)%]:{B9C1B8} %+")
	if nick3 and id3 and checked_giv.v then
	    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'r')
	    if file then
            r666 = file:read("*all")
            file:close()
	    end
	    if not string.match(r666, nick3) then
		
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'a')
	        if file then
                file:write(nick3.."["..id3.."]", '\n')
                file:close()
			end
	    end
	
	end
	
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))) 
    if text:find("Объявление: (%D+)е(%D+)я (%D+)".. nick) then
	   StepAD=StepAD + 1
	   lua_thread.create(function()
	   wait(100)
       sampAddChatMessage('[AdHelper] Кількість оголошень: '.. StepAD, colors)
	   print('Оголошення: '.. StepAD)
	   end)
	   local timeh = os.time()
       local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Логи\\Log.txt', 'a')
	   if file then
            file:write(os.date('[%H:%M:%S] ', timeh)..'Оголошення: '.. StepAD, ' Інвайти: '.. StepInv, '\n')
            file:close()
	    end
		
		if checked_piar.v then
		startTimer3()
		    if active then       
			    lua_thread.create(function()
				slidertime1 = tonumber(slider.v)
			    wait(delay)
	            piar1 = true
	            end)
			end
        
        end	
           
        local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	    if file then
	        file:write(StepAD, '\n')
		    file:write(StepInv)
            file:close()
        end			   
	 
	end 
    	
     
    if text:find("принял ваше предложение вступить в семью!") then
       StepInv= StepInv + 1
	   lua_thread.create(function()
	   wait(100)
	   sampAddChatMessage('[AdHelper] Кількість інвайтів: '.. StepInv, colors1)
	   sampSendChat(u8:decode(dsandtg))
	   wait(200)
	   sampSendChat("Вітаємо у сім'ї")
	   print('Інвайти: '.. StepInv)
	   end)
	   local timeh = os.time()
       local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Логи\\Log.txt', 'a')
	   if file then
            file:write(os.date('[%H:%M:%S] ', timeh)..'Оголошення: '.. StepAD, ' Інвайти: '.. StepInv, '\n')
            file:close()
	   end
	    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	    if file then
	        file:write(StepAD, '\n')
		    file:write(StepInv)
            file:close()
        end	
	   
    end 
     
    if text:find("вступить в вашу семью!") then
	    lua_thread.create(function()
		wait(100)
	    sampSendChat('/b /acceptfam')
		wait(110)
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Blacklist.txt', 'r')
	    if file then
	        b5 = file:read("*all")
            file:close()
        end
        for k, v in ipairs(getAllChars()) do
            local res, id = sampGetPlayerIdByCharHandle(v)
            if res then
                if string.find(b5, sampGetPlayerNickname(id)) then
			        sampAddChatMessage("[AdHelper] УВАГА! "..sampGetPlayerNickname(id).." знаходиться у ЧС!", 0xFF0000)
			    end
            end
        end
		end)
    end	

    if text:find(nick) then	
	    invstat = false
	else 
	    invstat = true
	end
	
	if text:find("Вітаємо у сім'ї") then
	    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'w')
	    if file then
			z9 = file:read()
			z10 = file:read()
		    file:close()
		end
		if z10 == "1" then
	        if invstat then
		        lua_thread.create(function()
		        StepInv = StepInv + 1
			    wait(200)
		        sampAddChatMessage('[AdHelper] Кількість інвайтів: '.. StepInv, colors1)
			    end)
			    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	            if file then
	                file:write(StepAD, '\n')
		            file:write(StepInv)
                    file:close()
			    end
		    end
		end
	end
     	 
end


function cmd_ad(arg)
    sampSendChat('/ad Семья Banderas ищет друзей')
	    
	
end



function EmulateKey(key, isDown)
    if not isDown then
        ffi.C.keybd_event(key, 0, 2, 0)
    else
        ffi.C.keybd_event(key, 0, 0, 0)
    end
end

function cmd_ah(arg) 
    main_window_state.v = not main_window_state.v
	imgui.Process = true
end


function imgui.OnDrawFrame()
	if not main_window_state.v and not secondary_window_state.v and not third_window_state.v and not fourth_window_state.v and not seventh_window_state.v then
	    imgui.Process = false
	end
	local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
	if p == password then
	    main_window_state.v = false
		third_window_state.v = false
	    secondary_window_state.v = true
		secondary_window_state.v = imgui.Process
		state7 = false
    end
	 
	local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'r')
	    if file then
			p9 = file:read()
			p7 = file:read()
		    file:close()
		end
	
	if p7 == "1" then
	    main_window_state.v = false
		third_window_state.v = false
	    secondary_window_state.v = false
		fifth_window_state.v = false
		fourth_window_state.v  = true
		fourth_window_state.v = imgui.Process
	end
	
	
	if main_window_state.v then
	    imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/2, sh/2), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[AdHelper] | Привіт, "..nick.."| Banderas Family", main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		if imgui.Button(u8'Я 9 РАНГ',imgui.ImVec2(450, 490)) then
		    third_window_state.v = true
		    main_window_state.v = false
			if p == password then
			    secondary_window_state.v = true
		        main_window_state.v = false
				third_window_state.v = false
		    end
		end
		imgui.SetCursorPosX((sw/2)/1.94)
		imgui.SetCursorPosY((sw/2)/24.5)
		if imgui.Button(u8'Я 7 РАНГ',imgui.ImVec2(450, 490)) then
		    main_window_state.v = false
		    fourth_window_state.v = true
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'w')
	        if file then
			    p9 = file:write("0", "\n")
			    p7 = file:write("1")
		        file:close()
		    end
		    
		end
		imgui.End()
	end
	local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
	if third_window_state.v then
	    img = imgui.CreateTextureFromFile(getGameDirectory().."\\moonloader\\AdHelper\\Banderas.jpg")
	    imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/5, sh/4), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[AdHelper] | Привіт, "..nick..u8"| Авторизація", third_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		imgui.SetCursorPosX((sw/10)/3.1)
		imgui.Image(img, imgui.ImVec2(200,140))
		imgui.SetCursorPosX((sw/10)/3.1)
		if InputText_state then
		    imgui.PushItemWidth(200)
		    imgui.InputText(info, text_buffer1)
		end
		imgui.SetCursorPosX((sw/7)/2.8)
		if info_flag then
			imgui.TextColored(imgui.ImVec4(1.0, 0.0, 0.0, 1.0 ), u8"Залишилось спроб: "..info2)
	    end
		imgui.SetCursorPosX((sw/5.7)/2.5)
		if imgui.Button(u8'Увійти') then
		    if text_buffer1.v == password then
			    secondary_window_state.v = true
				third_window_state.v = false
				local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'w')
			    if file then
			        file:write(password)
				    file:close()
				end

			else 
			    if third_window_state.v then
				    info_flag = true
				end
			    lua_thread.create(function()
			    info = u8"Пароль невірний!"
				warn = warn + 1
				info2 = 5 - warn
				if info2 < 0 then
				    info2 = 0
				end
				wait(1000)
				info = u8"Введіть пароль"
				
				end)
			 
			end
			if  warn > 5 then
			    third_window_state.v = false
				imgui.Process = false
				InputText_state = false
			end
			
		end
		imgui.End()
	end
	local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))) 
	
	if secondary_window_state.v then
	    	Sum = StepAD*23400
	 
	        Earn= Sum*20/100 + Sum
	
	        InvSum = StepInv*500000
		    timeSum = (10000000/168)*hour
		    allSum = Earn + InvSum + timeSum
	    imgui.Process = secondary_window_state.v
	    imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/2, sh/2), imgui.Cond.FirstUseEver)
	    imgui.Begin(u8"[AdHelper] | Привіт, "..nick.."| Banderas Family", secondary_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		
		if imgui.Button(u8"Логи", imgui.ImVec2(220, 30)) then
		    secondary_window_state.v = false
		    seventh_window_state.v = true
			imgui.Process = seventh_window_state.v

	
	    end
		

		
		imgui.Separator()
		
		imgui.CenterText(u8"ІНВАЙТИ")
		
		imgui.Separator()
		
		
		imgui.Text(u8"Текст після інвайту:")
		imgui.PushItemWidth(120)
		imgui.InputText('', text_buffer)
       	
        if text_buffer.v == "" then
		    text_buffer.v = dsandtg
		
        end		
    
		if imgui.Button(u8'Зберегти') then
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Ad.txt', 'w')
			if file then
			    file:write(text_buffer.v)
				file:close()
		    end
		    sampAddChatMessage('Збережено текст: " {FFFFE0}'..u8:decode(text_buffer.v)..' {00FA9A}"',0x00FA9A)
	   
		end
		imgui.PushItemWidth(60)
		
		imgui.Separator()
		
		imgui.Separator()
		
		imgui.Checkbox(u8"Автопіар", checked_piar)
		if checked_piar.v then
		    

		    imgui.Text(u8"Затримка:")
		    imgui.PushItemWidth(120)
		    imgui.SliderInt(u8"хв  ", slider, 0, 30)
		    if imgui.Button(u8'Запустити') then
		        active = not active
				secondary_window_state.v = not secondary_window_state.v
                if active then
	                sampAddChatMessage('[AdHelper] Режим автопіару {00ff00}ввімкнено!', 0x00FA9A)
			        delay = slider.v*60000
		            sampSendChat('/ad Семья Banderas ищет друзей')
					render_state = false	
			    end
			
			end
		else
			delay = 0
			if not render_state then
			        sampAddChatMessage('[AdHelper] Режим автопіару {ff0000}вимкнено!', 0x00FA9A)
				    render_state = true
					active = false
			end
		end
		imgui.Separator()
		
		imgui.Separator()
		
		imgui.Checkbox(u8"Спавн транспорту", checked_spc)
		if checked_spc.v then
		   
		    if imgui.Button(u8'Заспавнити') then
			    lua_thread.create(function()
				wait(500)
				sampSendChat('/fam <3 Увага! Спавн фам карів через 1 хв!')
				wait((30)*1000)
				sampSendChat('/fam <3 Увага! Спавн фам карів через 30 сек')
				wait((20)*1000)
				sampSendChat('/fam <3 Увага! Спавн фам карів через 10 сек')
				wait((10)*1000)
				sampSendChat('/famspawn')
				wait(100)
				EmulateKey(VK_RETURN, true)
		        wait(100)
                EmulateKey(VK_RETURN, false)
				end)
			end
		end
		
		imgui.Separator()
		imgui.Separator()
		
		imgui.Checkbox(u8"Сповіщення", checked_not)
		
		
		if checked_not.v then
		    checked_giv.v = false
		    if state_not then
			   
			   state_not1 = true
			end
		   
		    imgui.PushItemWidth(250)
		    imgui.InputText(u8"1 рядок", text_buffer2)
			imgui.PushItemWidth(250)
			imgui.InputText(u8"2 рядок ", text_buffer3)
			imgui.PushItemWidth(250)
			imgui.InputText(u8"3 рядок ", text_buffer4)
			
			
			if imgui.Button(u8" Зберегти ") then
			    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\notifications.txt', 'w')
			    if file then
			        file:write(text_buffer2.v, "\n")
			        file:write(text_buffer3.v, "\n")
			        file:write(text_buffer4.v, "\n")
					file:write(slider1.v)
				    file:close()
				end
			end
			
			if text_buffer2.v == "" then
			    text_buffer2.v = not1
			
			end
			
			if text_buffer3.v == "" then
			    text_buffer3.v = not2
			
			end
			
			if  text_buffer4.v == "" then
			    text_buffer4.v = not3
			
			end
			 
			imgui.SameLine()
			
			if imgui.Button(u8"Старт") then
			    state_not = true
				state_noti = true
		    end
		    
			    
		
		    imgui.SameLine()
			imgui.Text(u8"Затримка: ")
			imgui.PushItemWidth(120)
			
			imgui.Text(u8"                                 ")
			imgui.SameLine()
		
			imgui.SliderInt(u8"хв", slider1, 1, 60)
			if slider1.v < 1 then
			    slider1.v = 1
			
			end
		else
            state_noti = false	
            state_not1 = false	
            state_not = false	
            StepNot = 0
            notelapsedtime = 0			
		
		end
		

		imgui.Separator()
		
		imgui.Separator()
		
		imgui.Checkbox(u8"Розіграш", checked_giv)
		if checked_giv.v then
		    checked_not.v = false
		    local count = sampGetPlayerCount(streamed)
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'r')
			if file then
			    r1 = file:read("*all")
				file:close()
			
			end
			 
			
		    
			
		    imgui.InputText(u8'Назва призу', text_buffer6)
			imgui.InputText(u8"ID учасника", text_buffer7)
            
            if imgui.BeginChild("ChildWindow", imgui.ImVec2(300,120), true) then
			    if r1 ~= "" then
			        imgui.Text(r1)
			    end
			    imgui.EndChild()
		    end			
			
			local numberValue = tonumber(text_buffer7.v)
		
			if imgui.Button(u8"Добавити") then
			    if text_buffer7.v == "" then
				    sampAddChatMessage("[AdHelper] Поля не можуть бути пустими", 0xFF0000)
				else
				    if numberValue > count then
				        sampAddChatMessage("[AdHelper] Такого гравця не існує!", 0xFF0000)
				    else
				        local nick5 = sampGetPlayerNickname(text_buffer7.v)
						if string.match(r1, nick5) then
						    sampAddChatMessage("[AdHelper] Цей гравець вже є", 0xFF0000)
						else
			                local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'a')
				            if file then
				                file:write(nick5.."["..text_buffer7.v.."]", "\n")
					            file:close()
						
					        end
						end
					end
				
				end
				    
			
			end
			imgui.SameLine()
			if imgui.Button(u8"Очистити") then
			    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'w')
				if file then
				    file:write("")
					file:close()
			    end
			
			end
			imgui.SameLine()
			if imgui.Button(u8"Розіграти") then
				if text_buffer6.v == "" or r1 == "" then
			        sampAddChatMessage("[AdHelper] Будь ласка, введіть назву призу або добавте хоча б двох учасників!", 0xFF0000)
		        else
				    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Giv.txt', 'r')
					if file then
					    local lines = {}
                        for line in file:lines() do
                            table.insert(lines, line)
						end
				        file:close()
					    local randomIndex = math.random(1, #lines)
                        local randomValue = lines[randomIndex]
						lua_thread.create(function()
						    wait(1000)
							sampSendChat("/fam <3 Увага! Результат розіграшу на ' "..u8:decode(text_buffer6.v).." ' через 15 сек ")
							wait(5000)
							sampSendChat("/fam <3 Увага! Результат розіграшу на ' "..u8:decode(text_buffer6.v).." ' через 10 сек ")
							wait(5000)
							sampSendChat("/fam <3 Увага! Результат розіграшу на ' "..u8:decode(text_buffer6.v).." ' через 5 сек ")
							wait(5500)
					        sampSendChat("/fam <3 У розіграші на ' "..u8:decode(text_buffer6.v).." ' переміг "..randomValue)
					    end)
					end
				    
				end   
			   
			    
			
			end
			if checked_giv.v then
			end

		
		end
		
		imgui.Separator()
		imgui.Separator()
		
		imgui.CenterText(u8"СТАТИСТИКА")
		imgui.Separator()
		
		imgui.Text(u8"Витрачено на оголошення: "..Sum.."$")
		imgui.Text(u8"Час в грі: "..hour..":"..minutes..":"..seconds)
		
		imgui.Separator()
		imgui.CenterText(u8"ЗАРОБЛЕНО")
		imgui.Separator()
		
		imgui.Text(u8"Зароблено з оголошень: "..Earn.."$")
		imgui.SameLine()
		imgui.Text(u8"Зароблено з інвайтів: "..InvSum.."$")
		imgui.Text(u8"Зароблено за години: "..math.ceil(timeSum).."$")
		imgui.SameLine()
		imgui.Text(u8"Зароблено всього: "..formatNumberWithCommas(math.ceil(allSum)).."$")
		
		 
		
		imgui.Separator()
		if imgui.Button(u8"Відкрити таблицю ЗП") then
		    os.execute('start www.docs.google.com/spreadsheets/d/13vJYyxZAMmR5dlbMRNa3Hv7ckR8aYoJfIBOZJdA1NVY/edit?usp=sharing')
		end
		
		imgui.SameLine()
	   
		if imgui.Button(u8"Відкрити таблицю ранги") then
		     os.execute('start www.docs.google.com/spreadsheets/d/1_fENCFvm71cAx5CD2pKjaCEjCxLLmh4bV8oJYOK_VOI/edit#gid=0')
		end
		
		imgui.SameLine()
		

		if imgui.Button(u8"Обнулити рахунок") then
		    StepAD = 0
	        StepInv = 0
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	        if file then
	            file:write(StepAD,'\n')
		        file:write(StepInv)
                file:close()
			end
        
	        lua_thread.create(function()
	        sampAddChatMessage('[AdHelper] Зачекайте, будь ласка...', 0x00FA9A)
		    wait(1500)
	        sampAddChatMessage('[AdHelper] Логи успішно очищено!', 0x00FA9A)
	        end)
		
		end
		
		imgui.SameLine()
		if imgui.Button(u8"Обнулити час") then
			minutes = 0
			hour = 0
			startTimer()
			startTimer1()
			
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\timeinfo.txt', 'w')
	        if file then
	            file:write(hour,'\n')
		        file:write(minutes, "\n")
				file:write(seconds)
                file:close()
			end
		end
		
		imgui.SameLine()

		if imgui.Button(u8"ЧС") then
		    fifth_window_state.v = true
			imgui.Process = fifth_window_state.v
		end
		
	
		imgui.Checkbox(u8"Час на екрані", checked_time)
		if checked_time.v then
		    timestateinfo = true
			
		
		else
		    timestateinfo = false
		    
		
		end
	
		imgui.Checkbox(u8"Автоочищення логів", checked_clean)
		if checked_clean.v then
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean1.txt', 'w')
	        if file then
				file:write("1")
                file:close()
	        end
		else
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean1.txt', 'w')
	        if file then
				file:write("0")
                file:close()
	        end
		    
		
		end
		
		imgui.Separator()
		
	
		imgui.Text("                                                                                                                                                                                                                                           ")
		imgui.SameLine()
		if imgui.Button(u8'Вийти') then
			secondary_window_state.v = false
			main_window_state.v = true
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'w')
			if file then
			    file:write("0")
				file:close()
		    end
		    
		    
		end
		
		imgui.Separator()
		
		imgui.Text("by Budanov | Version "..script__version..u8" | Слава Україні!")
		
		
		
		     
		imgui.End()
	
	end
	
	if seventh_window_state.v then
	    secondary_window_state.v = false
		imgui.Proccess = seventh_window_state.v
	    imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/2, sh/2), imgui.Cond.FirstUseEver)
	    imgui.Begin(u8"[AdHelper] | Логи | Banderas Family", seventh_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		if imgui.Button(u8"Основна", imgui.ImVec2(220, 30)) then
		    seventh_window_state.v = false
			secondary_window_state.v = true
		
		end
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Логи\\LogMoney.txt', 'r')
	    if file then
			logs = file:read("*all")
		    file:close()
		end
		if imgui.BeginChild("ChildWindow", imgui.ImVec2(sw/2.06, sh/2.35), true) then
			if logs ~= "" then
			    imgui.Text(u8(logs))
			end
			imgui.EndChild()
		end
		imgui.End()
	
	end
	
	if fourth_window_state.v then
	    imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/2, sh/2), imgui.Cond.FirstUseEver)
	    imgui.Begin(u8"[AdHelper] | Привіт, "..nick.."| Banderas Family", fourth_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		
		imgui.Separator()
		imgui.CenterText(u8"СТАТИСТИКА")
		
		imgui.Separator()
		
		Sum = StepAD*23400
	 
	    Earn= Sum*20/100 + Sum
		
		InvSum = StepInv*500000
		
		imgui.Text(u8"Витрачено на оголошення: "..Sum.."$")
		imgui.Text(u8"Зароблено з оголошень: "..Earn.."$")
		imgui.Text(u8"Зароблено з інвайтів: "..InvSum.."$")
		
		imgui.Separator()
		
		if imgui.Button(u8"Відкрити таблицю") then
		    os.execute('start www.docs.google.com/spreadsheets/d/1ObMLqx2UIyuvYlQToQNsSPnuf8eRu2Lwn00gutIKtJU/edit#gid=0')
		
		end
		
		if imgui.Button(u8"Обнулити рахунок") then
		    StepAD = 0
	        StepInv = 0
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Logs.txt', 'w')
	        if file then
	            file:write(StepAD,'\n')
		        file:write(StepInv)
                file:close()
			end
        
	        lua_thread.create(function()
	        sampAddChatMessage('[AdHelper] Зачекайте, будь ласка...', 0x00FA9A)
		    wait(1500)
	        sampAddChatMessage('[AdHelper] Логи успішно очищено!', 0x00FA9A)
	        end)
		
		end
		imgui.Checkbox(u8"Автоочищення", checked_clean)
		if checked_clean.v then
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean1.txt', 'w')
	        if file then
				file:write("1")
                file:close()
	        end
		else
            local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\clean1.txt', 'w')
	        if file then
				file:write("0")
                file:close()
	        end
		    
		
		end
		
		imgui.SetCursorPosY((sh/2)/1.13)
		imgui.SetCursorPosX((sw/2)/1.07)
		if imgui.Button(u8"Вийти") then
		    fourth_window_state.v = false
			main_window_state.v = true
		    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'w')
			if file then
			    file:write("0")
				file:write("0")
				file:close()
		    end
		
		end
		
		imgui.SetCursorPosY((sh/2)/1.06)
		imgui.Separator()
		
		imgui.Text("by Budanov | Version "..script__version..u8" | Слава Україні!")
		
		
	    imgui.End()
	end
	
	if fifth_window_state.v then
	    imgui.Process = fifth_window_state.v
		imgui.SetNextWindowPos(imgui.ImVec2(sw/ 6 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/5, sh/5), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[AdHelper] | Чорний список", fifth_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		imgui.InputText(u8"Введіть нік", text_buffer5)
		if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.Text(u8' Введіть нік гравця, \n щоб перевірити його на наявність у ЧС.')
            imgui.EndTooltip()
        end
		if state_inp then
		    imgui.PushItemWidth(50)
		    imgui.InputText(u8"Введіть id", text_buffer9)
			if imgui.IsItemHovered() then
                imgui.BeginTooltip()
                imgui.Text(u8' Введіть ID гравця, \n якщо він в грі, щоб \n перевірити його на наявність у ЧС.')
                imgui.EndTooltip()
            end
		end
		local find1 = string.match(text_buffer8.v, text_buffer10.v)
		if text_buffer5.v == "" then
			state_inp = true
		else
			state_inp = false
			text_buffer9.v = ""
		end
		nick2 = sampGetPlayerNickname(text_buffer9.v)
		if imgui.Button(u8"Перевірити") then
			    
		    if text_buffer9.v == "" and text_buffer5.v ~= "" then 
		        if string.find(text_buffer5.v, bls) then
				    if string.find(text_buffer8.v, text_buffer5.v) then
				        sampAddChatMessage("[AdHelper] Цей гравець є у списку!", 0xFF0000)
				    else
				        sampAddChatMessage("[AdHelper] Цього гравця немає у списку!", 0x00FF00)
				    end
			    else
			    sampAddChatMessage("[AdHelper] Нік повинен мати таку форму: 'Nick_Nick'!", 0x00FA9A)
			    end
			end
			if text_buffer9.v ~= "" and text_buffer5.v == "" then
			    if tonumber(text_buffer9.v) then
				    if string.find(text_buffer8.v, nick2) then
				        sampAddChatMessage("[AdHelper] "..nick2.." є у списку!", 0xFF0000)
				    else
				        sampAddChatMessage("[AdHelper] "..nick2.." немає у списку!", 0x00FF00)
				    end
			    else
			        sampAddChatMessage("[AdHelper] ID повинен бути в числовому вигляді!", 0x00FA9A)
			    end
			end
			if text_buffer9.v == "" and text_buffer5.v == "" then
			    sampAddChatMessage("[AdHelper] Будь ласка, введіть нік або ID", 0x00FA9A)
			
			end
		    
		
		end
		if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.Text(u8' Натисність, щоб перевірити \n наявність гравця у ЧС.')
            imgui.EndTooltip()
        end
		imgui.Separator()
		
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Blacklist.txt', 'r')
		if file then
	        b1 = file:read("*all")
            file:close()
		end
		imgui.PushItemWidth(200)
		imgui.InputTextMultiline("", text_buffer8)
		if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.Text(u8' Це поле активне. \n Сюди можна вписувати, \n а також видаляти ніки.')
            imgui.EndTooltip()
        end
		local find2 = string.match(text_buffer8.v, text_buffer8.v)
		if find2 then
		    text_buffer8.v = find2
		
		end
		if text_buffer8.v == "" then
		    text_buffer8.v = b1
		    
		end
		local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Blacklist.txt', 'w')
		if file then
	        file:write(text_buffer8.v)
            file:close()
		end
		imgui.Separator()
		imgui.InputTextWithHint(u8" ",u8"Введіть ID", text_buffer11)
		if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.Text(u8' Введіть ID гравця, \n який зараз онлайн \n щоб додати його нік.')
            imgui.EndTooltip()
        end
		if imgui.Button(u8" Додати ") then
		nick3 = sampGetPlayerNickname(text_buffer11.v)
		    if text_buffer11.v == "" then	
                sampAddChatMessage("[AdHelper] Будь ласка, введіть ID", 0x00FA9A)
            else				
			    if string.match(text_buffer8.v, nick3) then
		            sampAddChatMessage("[AdHelper] "..nick3.." вже є в списку!", 0xFF0000)
			
			    else
			        sampAddChatMessage("[AdHelper] "..nick3.." успішно доданий", 0x00FF00)
			        text_buffer8.v = (b1..nick3.."\n")
			    end
			end
			
			
		
		end
	    imgui.End()
	end
	if sixth_window_state.v then
	    imgui.Process = sixth_window_state.v
		imgui.SetNextWindowPos(imgui.ImVec2(sw/ 2 , sh / 2 ), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(sw/10, sh/5), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"[AdHelper] | Kick", sixth_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		imgui.Checkbox(u8"Добавити у ЧС", checked_kick)
	    imgui.Text(u8"ID гравця: ")
		imgui.PushItemWidth(50)
		imgui.InputText(" ",text_buffer12)
		if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.Text(u8' Введіть ID гравця, \n якого хочете кікнути.')
            imgui.EndTooltip()
        end
		imgui.Text(u8"Причина: ")
		imgui.PushItemWidth(120)
		imgui.InputTextWithHint("  ",u8"Введіть текст",text_buffer13)
		if imgui.Button(u8"Кікнути") then
		    if text_buffer12.v == "" or text_buffer13.v == "" then
			    sampAddChatMessage("[AdHelper] Поля не можуть бути пустими!", 0xFF0000)
				
			else
			    if checked_kick.v then
			        if tonumber(text_buffer12.v) then
			            sampSendChat("/famuninvite "..text_buffer12.v.." "..u8:decode(text_buffer13.v))
					    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\Blacklist.txt', 'r')
		                if file then
	                        b1 = file:read("*all")
                            file:close()
		                end
				        nick4 = sampGetPlayerNickname(text_buffer12.v) 					
					    fifth_window_state.v = true
					    text_buffer8.v = (b1..nick4.." ("..text_buffer13.v..") ".."\n")
					    fifth_window_state.v = false
					    imgui.Process = sixth_window_state.v
					    sixth_window_state.v = false
				    else
				        sampAddChatMessage("Поле ID повинно мати числовий вигляд!", -1)
				    end
				else 
				    sampSendChat("/famuninvite "..text_buffer12.v.." "..u8:decode(text_buffer13.v))
					imgui.Process = sixth_window_state.v
					sixth_window_state.v = false
				end
			end
		
		end
	    imgui.End()
	
	
	
	end
end

function imgui.InputTextWithHint(label, hint, buf, flags, callback, user_data)
    local l_pos = {imgui.GetCursorPos(), 0}
    local handle = imgui.InputText(label, buf, flags, callback, user_data)
    l_pos[2] = imgui.GetCursorPos()
    local t = (type(hint) == 'string' and buf.v:len() < 1) and hint or '\0'
    local t_size, l_size = imgui.CalcTextSize(t).x, imgui.CalcTextSize('A').x
    imgui.SetCursorPos(imgui.ImVec2(l_pos[1].x + 8, l_pos[1].y + 2))
    imgui.TextDisabled((imgui.CalcItemWidth() and t_size > imgui.CalcItemWidth()) and t:sub(1, math.floor(imgui.CalcItemWidth() / l_size)) or t)
    imgui.SetCursorPos(l_pos[2])
    return handle
end

function imgui.TextQuestion(label, description)
    imgui.TextDisabled(label)

    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
                imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function imgui.CenterText(text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end

function cmd_kick(arg)
    local file = io.open(getGameDirectory()..'\\moonloader\\AdHelper\\password.txt', 'r')
	if file then
	    z5 = file:read()
        file:close()
	end
	if z5 == password then
        sixth_window_state.v = true
	    imgui.Process = sixth_window_state.v
	end
    



end

function formatNumberWithCommas(allSum)
    local formattedNumber = tostring(allSum)
    local reverseFormatted = string.reverse(formattedNumber)
    local result = ""

    for i = 1, #reverseFormatted do
        result = result .. reverseFormatted:sub(i, i)
        if i % 3 == 0 and i ~= #reverseFormatted then
            result = result .. "."
        end
    end

    return string.reverse(result)
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end




