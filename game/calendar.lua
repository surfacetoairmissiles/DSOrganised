calendar = {}

local monthlength = {[1] = 31, [2] = 28, [3] = 31,
			   [4] = 30, [5] = 31, [6] = 30,
			   [7] = 31, [8] = 31, [9] = 30,
			   [10] = 31, [11] = 30, [12] = 31}

local monthnames = {[1] = "January", [2] = "Febuary", [3] =  "March",
				   [4] =  "April", [5] = "May", [6] = "June",
				   [7] = "July", [8] = "August", [9] = "September",
				   [10] = "October", [11] = "November", [12] = "December"}


function calendar:enter()

end

function calendar:update(dt)
	calendar.firsttime = os.time{year=currentdate.year, month=currentdate.month	, day=1}
	calendar.firstdate = os.date("*t", calendar.firsttime)

end

function calendar:draw()
	calendar.drawtopscreen()

	drawtoBottomScreen()
	calendar.drawcontrols()
	calendar.drawcalendarheadings()
	calendar.drawhilight()
	calendar.drawcalendarnumbers()

	if calendar.selectedday > monthlength[currentdate.month] then
		calendar.selectedday = monthlength[currentdate.month]
		--changemonthcode goes here
	elseif calendar.selectedday < 1 then
		calendar.selectedday = 1
		--more month change code
	end
	drawwindowsoutline()

end

function calendar:keypressed(key)
	if key == "start" or key == "return" then
		Gamestate.switch(menu)
	end

	if key == 'left' then
		calendar.selectedday = calendar.selectedday-1
	end

	if key == 'right' then
		calendar.selectedday = calendar.selectedday+1
	end

	if key == 'down' then
		calendar.selectedday = calendar.selectedday+7
	end
	if key == 'up' then
		calendar.selectedday = calendar.selectedday-7
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
	--draw the top row buttons
	love.graphics.setFont(fonts.small)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Prev",17,2)
	love.graphics.print("Home", 160, 2)
	love.graphics.print("Next", 282, 2)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(icons.l,2,4)
	love.graphics.draw(icons.r,306,4)
	love.graphics.draw(icons.start,134,4)

	--Draw the bottom row buttons
	love.graphics.setColor(0, 0, 0, 255)
	drawrectangle("line",20, 210, 135, 20)
	drawrectangle("line",165, 210, 135, 20)

	love.graphics.setFont(fonts.large)
	love.graphics.print("Edit Reminder", 40, 211)
	love.graphics.print("View Day", 195, 211)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(icons.a, 28, 215)
	love.graphics.draw(icons.b, 183, 215)

end

function calendar.drawcalendarheadings()
	love.graphics.setFont(fonts.large)
	love.graphics.setColor(0, 0, 0, 255)
	--love.graphics.print(os.date("%B - %Y"), 35, 20)
	love.graphics.print(monthnames[currentdate.month] .. " - " .. currentdate.year, 35, 20)

	love.graphics.setFont(fonts.small)
	love.graphics.print("Sun", 35, 45)
	love.graphics.line(36, 55, 63, 55)
	love.graphics.print("Mon", 70, 45)
	love.graphics.line(71, 55, 98, 55)
	love.graphics.print("Tue", 105, 45)
	love.graphics.line(106, 55, 133, 55)
	love.graphics.print("Wed", 140, 45)
	love.graphics.line(141, 55, 168, 55)
	love.graphics.print("Thu", 175, 45)
	love.graphics.line(176, 55, 203, 55)
	love.graphics.print("Fri", 210, 45)
	love.graphics.line(211, 55, 238, 55)
	love.graphics.print("Sat", 245, 45)
	love.graphics.line(246, 55, 273, 55)

end

function calendar.drawcalendarnumbers()
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.setFont(fonts.small)

	--get the weekday of the first day of the month
	
	--draw the numbers
	n = 1
	for x = 1, 8 - calendar.firstdate.wday do
		love.graphics.print("0" .. ((9 - calendar.firstdate.wday) - x), 287-x*35, 68)
		n=n+1
	end
	for x = 1, 7 do
		if n < 10 then
			love.graphics.print("0" .. n, 7+x*35, 88)
		else
			love.graphics.print(n, 7+x*35, 88)
		end
		n=n+1
	end
	for x = 1, 7 do
		love.graphics.print(n, 7+x*35, 108)
		n=n+1
	end	
	for x = 1, 7 do
		love.graphics.print(n, 7+x*35, 128)
		n=n+1
	end	
	for x = 1, monthlength[currentdate.month] - (n-1) do
		love.graphics.print(n, 7+x*35, 148)
		n=n+1
	end	
	--]]
end

function calendar.drawhilight()
	
	love.graphics.print("Selected day: "..calendar.selectedday, 200, 200)
	love.graphics.print("first month:" ..calendar.firstdate.wday, 200, 190)

	love.graphics.setColor(0, 166, 81, 100)
	local m = 1
	for x = 1, (8-calendar.firstdate.wday) do
		if calendar.selectedday == m and calendar.firstdate.wday ~= 1 then
			drawrectangle("fill", 1+x*35 + 35*(calendar.firstdate.wday-1), 65, 25, 17)
		elseif calendar.selectedday == m and calendar.firstdate.wday == 1 then
			drawrectangle("fill", 1+x*35, 65, 25, 17)
		end
		m=m+1
	end
	for x = 1, 7 do
		if calendar.selectedday == m then
			drawrectangle("fill", 1+x*35, 85, 25, 17)
		end
		m=m+1
	end
	for x = 1, 7 do
		if calendar.selectedday == m then
			drawrectangle("fill", 1+x*35, 105, 25, 17)
		end
		m=m+1
	end
	for x = 1, 7 do
		if calendar.selectedday == m then
			drawrectangle("fill", 1+x*35, 125, 25, 17)
		end
		m=m+1
	end
	for x = 1, monthlength[currentdate.month] - (m-1) do
		if calendar.selectedday == m then
			drawrectangle("fill", 1+x*35, 145, 25, 17)
		end
		m=m+1
	end
end