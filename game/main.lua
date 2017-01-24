font = love.graphics.newFont(15)
smallfont = love.graphics.newFont(9)

user = "Sam"
currentos = love.system.getOS()



function love.load()
	if currentos == "Windows" then
		love.window.setMode(400, 480)
		love.graphics.push()
		love.graphics.translate((400 - 320) / 2, 240)
	end
	drawtoTopScreen()
	love.graphics.setBackgroundColor(255, 255, 255, 255)
	drawtoBottomScreen()
	love.graphics.setBackgroundColor(255, 255, 255, 255)

end


function love.draw()
	--Draw stuff on the top screen --
	drawtoTopScreen()
	--Start Drawing the boxes--
	love.graphics.setColor(190,190,190,255)
	love.graphics.rectangle("fill", 0, 0, 400, 40)-- 1st grey box
	love.graphics.setColor(0,0,0,255)
	love.graphics.rectangle("fill",0, 40, 400, 5) --1st black bar
	love.graphics.rectangle("line", 5, 60, 301, 20) --Reminders box
	love.graphics.rectangle("line", 316, 60, 75, 150) -- Placeholder box
	love.graphics.rectangle("line", 5, 95, 301, 50) -- Day planner
	love.graphics.rectangle("line", 5, 160, 301, 50) --Todo
	love.graphics.rectangle("fill",0, 215, 400, 5) --2nd black bar
	love.graphics.setColor(190,190,190,255)
	love.graphics.rectangle("fill", 0, 220, 400, 20)-- 2nd grey box

	--Draw the text--

	--Top time and datre Text--
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(font)
	love.graphics.print(os.date("%A, %B %d, %Y"), 5, 2)
	love.graphics.print(os.date("%I:%M:%S %p"), 5, 20)
	love.graphics.print(currentos, 200, 20)

	--titles
	love.graphics.setFont(smallfont)
	love.graphics.print("Reminder", 5, 50)
	love.graphics.print("Placeholder", 316, 50)
	love.graphics.print("Day Planner", 5, 85)
	love.graphics.print("Todo List", 5, 150)

	-- Welcome message
	love.graphics.setFont(font)
	love.graphics.print("Welcome, "..user.."!", 5, 222)


	--Draw stuff on the bottom screen
	drawtoBottomScreen()

	--Green boxes to indicate icon and text position *placeholder*
	love.graphics.setColor(45, 69, 34, 255) -- Get some green
	love.graphics.rectangle("line", 35, 40, 70, 70)
	love.graphics.rectangle("line", 125, 40, 70, 70)
	love.graphics.rectangle("line", 215, 40, 70, 70)
	love.graphics.rectangle("line", 35, 130, 70, 70)
	love.graphics.rectangle("line", 125, 130, 70, 70)
	love.graphics.rectangle("line", 215, 130, 70, 70)

	--Text of app icons
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(smallfont)

	love.graphics.print("Calendar", 35, 95)
	love.graphics.printf("A B C D", 125, 95, 70, "justify")
	love.graphics.printf("Adress", 215, 95, 70, "center")
	love.graphics.printf("Todo List", 35, 190, 70, "center")
	love.graphics.printf("Scrib", 125, 190, 70, "center")
	love.graphics.printf("Browse", 215, 190, 70, "center")


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
