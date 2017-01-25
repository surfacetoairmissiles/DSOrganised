function rendericons()
	--Draw the icons
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(icons.calendar,35,40)
	love.graphics.draw(icons.planner,125,40)
	love.graphics.draw(icons.letter,215,40)
	love.graphics.draw(icons.todo,35,130)
	love.graphics.draw(icons.scribble,125,130)
	

	--icon labels
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(fonts.small)

	love.graphics.print("Calendar", 47, 95)
	love.graphics.printf("Day Planner", 125, 95, 70, "center")
	love.graphics.printf("Address", 215, 95, 70, "center")
	love.graphics.printf("Todo List", 35, 185, 70, "center")
	love.graphics.printf("Scribble Pad", 125, 185, 70, "center")
	love.graphics.printf("Browse", 215, 185, 70, "center")
	love.graphics.setFont(fonts.large)
	love.graphics.print("Configuration", 110, 213)
end

function rendertopscreen()
	drawtoTopScreen()
	--Start Drawing the boxes--
	love.graphics.setColor(190,190,190,255)
	drawrectangle("fill", 0, 0, 400, 40)-- 1st grey box
	love.graphics.setColor(0,0,0,255)
	drawrectangle("fill",0, 40, 400, 5) --1st black bar
	drawrectangle("line", 5, 60, 301, 20) --Reminders box
	drawrectangle("line", 316, 60, 75, 150) -- Placeholder box
	drawrectangle("line", 5, 95, 301, 50) -- Day planner
	drawrectangle("line", 5, 160, 301, 50) --Todo
	drawrectangle("fill",0, 215, 400, 5) --2nd black bar
	love.graphics.setColor(190,190,190,255)
	drawrectangle("fill", 0, 220, 400, 20)-- 2nd grey box

	--Draw the text--

	--Top time and datre Text--
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(fonts.large)
	love.graphics.print(os.date("%A, %B %d, %Y"), 5, 2)
	love.graphics.print(os.date("%I:%M:%S %p"), 5, 20)
	love.graphics.print(currentos, 200, 20)

	--titles
	love.graphics.setFont(fonts.small)
	love.graphics.print("Reminder", 5, 50)
	love.graphics.print("Placeholder", 316, 50)
	love.graphics.print("Day Planner", 5, 85)
	love.graphics.print("Todo List", 5, 150)

	-- Welcome message
	love.graphics.setFont(fonts.large)
	love.graphics.print("Welcome, "..user.."!", 5, 222)
end

function drawwindowsoutline()
	if currentos == "Windows" then -- This sets an outline so i can see the bounds of the screen
		love.graphics.setColor(0,0,0,255)
		love.graphics.rectangle("line", 0, 0, 320, 240)
	end
end

function boxhilight()
	love.graphics.setColor(45, 69, 34, 255) -- Get some green

	if selectedicon < 1 then
 		selectedicon = 1 --Overflow control
	end
	if selectedicon > 6 and selectedicon ~=9 then 
		selectedicon = 6
		--next/prev page code here
	end

 	--This assigns the selected icon a frame
	if selectedicon == 1 then
		drawrectangle("line", 35, 40, 70, 70)
	elseif selectedicon == 2 then
		drawrectangle("line", 125, 40, 70, 70)
	elseif selectedicon == 3 then
		drawrectangle("line", 215, 40, 70, 70)
	elseif selectedicon == 4 then
		drawrectangle("line", 35, 130, 70, 70)
	elseif selectedicon == 5 then
		drawrectangle("line", 125, 130, 70, 70)
	elseif selectedicon == 6 then
		drawrectangle("line", 215, 130, 70, 70)
	elseif selectedicon == 9 then
		drawrectangle("line", 70, 213, 180, 20)
	end

end