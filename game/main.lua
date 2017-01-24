

user = "Sam"
currentos = love.system.getOS()
bgc = {}
bgc.r = 255
bgc.g = 255
bgc.b = 255
bgc.a = 255
icons = {}
fonts = {}


function love.load()
	if currentos == "Windows" then
		love.window.setMode(400, 480)
		love.graphics.push()
		love.graphics.translate((400 - 320) / 2, 240)
	end
	drawtoTopScreen()
	love.graphics.setBackgroundColor(bgc.r, bgc.g, bgc.b, bgc.a)
	drawtoBottomScreen()
	love.graphics.setBackgroundColor(bgc.r, bgc.g, bgc.b, bgc.a)

	icons.letter = love.graphics.newImage("/icons/letter.png")
	icons.planner = love.graphics.newImage("/icons/planner.png")
	icons.calendar = love.graphics.newImage("/icons/calendar.png")
	icons.scribble = love.graphics.newImage("/icons/scribble.png")
	icons.todo = love.graphics.newImage("/icons/todo.png")

	fonts.large = love.graphics.newFont(15)
	fonts.small = love.graphics.newFont(9)

end


function love.draw()
	--Draw stuff on the top screen --
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


	--Draw stuff on the bottom screen
	drawtoBottomScreen()
	
	if currentos == "Windows" then -- This sets an outline so i can see the bounds of the screen
		love.graphics.setColor(0,0,0,255)
		love.graphics.rectangle("line", 0, 0, 320, 240)
	end
	--Green boxes to indicate icon and text position *placeholder*
	love.graphics.setColor(45, 69, 34, 255) -- Get some green

	drawrectangle("line", 35, 40, 70, 70)
	drawrectangle("line", 125, 40, 70, 70)
	drawrectangle("line", 215, 40, 70, 70)
	drawrectangle("line", 35, 130, 70, 70)
	drawrectangle("line", 125, 130, 70, 70)
	drawrectangle("line", 215, 130, 70, 70)
	drawrectangle("line", 70, 213, 180, 20)

	--Draw the icons
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.draw(icons.calendar,35,40)
	love.graphics.draw(icons.planner,125,40)
	love.graphics.draw(icons.letter,215,40)
	love.graphics.draw(icons.todo,35,130)
	love.graphics.draw(icons.scribble,125,130)
	

	--Text of app icons
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(fonts.small)

	love.graphics.print("Calendar", 47, 95)
	love.graphics.printf("Day Planner", 125, 95, 70, "center")
	love.graphics.printf("Address", 215, 95, 70, "center")
	love.graphics.printf("Todo List", 35, 185, 70, "center")
	love.graphics.printf("Scribble Pad", 125, 185, 70, "center")
	love.graphics.printf("Browse", 215, 185, 70, "center")
	love.graphics.setFont(fonts.large)
	love.graphics.printf("Configuration", 70, 213,110, "center")


end

function love.update()

end

function drawtoTopScreen()
	if currentos == "Windows" then
		love.graphics.pop()
	elseif currentos == "3ds" then
		love.graphics.setScreen("top")
	end
end

function drawtoBottomScreen()
	if currentos == "Windows" then
		love.graphics.push()
		love.graphics.translate((400 - 320) / 2, 240)
	elseif currentos == "3ds" then
		love.graphics.setScreen("bottom")
	end
end

function drawrectangle(l, x, y, w, h)
		love.graphics.rectangle("fill", x, y, w, h)
		if l == "line" then
			r, g, b, a = love.graphics.getColor()
			linewidth = love.graphics.getLineWidth()
			love.graphics.setColor(bgc.r, bgc.g, bgc.b, bgc.a)
			love.graphics.rectangle("fill", x+linewidth, y+linewidth, w-(2*linewidth), h-(2*linewidth) )
			love.graphics.setColor(r, g, b, a)
		end
	end
