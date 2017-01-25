calendar = {}

function calendar:enter()

end

function calendar:update(dt)

end

function calendar:draw()
	calendar.drawtopscreen()

	drawtoBottomScreen()
	calendar.drawcontrols()
	drawwindowsoutline()

end

function calendar:keypressed(key)
	if key == "start" or key == "return" then
		Gamestate.switch(menu)
	end
end

function calendar.drawtopscreen()
	drawtoTopScreen()
	--Start Drawing the boxes--
	love.graphics.setColor(190,190,190,255)
	drawrectangle("fill", 0, 0, 400, 40)-- 1st grey box
	love.graphics.setColor(0,0,0,255)
	drawrectangle("fill",0, 40, 400, 5) --1st black bar

	drawrectangle("fill",0, 215, 400, 5) --2nd black bar
	love.graphics.setColor(190,190,190,255)
	drawrectangle("fill", 0, 220, 400, 20)-- 2nd grey box

	--Top time and datre Text--
	love.graphics.setColor(0,0,0,255)
	love.graphics.setFont(fonts.large)
	love.graphics.print(os.date("%A, %B %d, %Y"), 5, 2)
	love.graphics.print(os.date("%I:%M:%S %p"), 5, 20)

end

function calendar.drawcontrols()
	love.graphics.setFont(fonts.small)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Prev",17,2)
	love.graphics.print("Home", 160, 2)
	love.graphics.print("Next", 282, 2)
	--drawrectangle("line", 159, 0, 2, 240) -- a guide

	drawrectangle("line",20, 210, 135, 20)
	drawrectangle("line",165, 210, 135, 20)
	love.graphics.setFont(fonts.large)

	love.graphics.print("Edit Reminder", 40, 211)
	love.graphics.print("View Day", 195, 211)



	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(icons.l,2,4)
	love.graphics.draw(icons.r,306,4)
	love.graphics.draw(icons.start,134,4)

	love.graphics.draw(icons.a, 28, 215)
	love.graphics.draw(icons.b, 183, 215)

end