require "calendar"
require "menu"
Gamestate = require("hump.gamestate")

user = "Sam"
currentos = love.system.getOS()
currentdate = {}
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

	icons.l = love.graphics.newImage("/icons/l.png")
	icons.r = love.graphics.newImage("/icons/r.png")
	icons.start = love.graphics.newImage("/icons/start.png")
	icons.a = love.graphics.newImage("/icons/a.png")
	icons.b = love.graphics.newImage("/icons/b.png")

	fonts.large = love.graphics.newFont(15)
	fonts.small = love.graphics.newFont(9)

	currentdate = os.date("*t")
	calendar.selectedday = currentdate.day

	-- Initialise Gamestates
    Gamestate.registerEvents()
    --Set the gamestate to Menu
    Gamestate.switch(calendar)

end


function love.draw()



end

function love.update()

end

function love.keypressed(key)


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


function drawwindowsoutline()
	if currentos == "Windows" then -- This sets an outline so i can see the bounds of the screen
		love.graphics.setColor(0,0,0,255)
		love.graphics.rectangle("line", 0, 0, 320, 240)
	end
end
