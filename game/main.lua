require "draw"

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
	rendertopscreen()


	--Draw stuff on the bottom screen
	drawtoBottomScreen()
	--Draw a window outline so that a windows user can see the outline of the window
	drawwindowsoutline()
	--Green boxes to indicate icon and text position *placeholder*
	love.graphics.setColor(45, 69, 34, 255) -- Get some green

	drawrectangle("line", 35, 40, 70, 70)
	drawrectangle("line", 125, 40, 70, 70)
	drawrectangle("line", 215, 40, 70, 70)
	drawrectangle("line", 35, 130, 70, 70)
	drawrectangle("line", 125, 130, 70, 70)
	drawrectangle("line", 215, 130, 70, 70)
	drawrectangle("line", 70, 213, 180, 20)

	rendericons()


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
