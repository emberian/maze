function love.load()
	maze = require 'maze'
	m = maze:new(30, 40)
	generator = m:generate()
end

function love.draw()
	m:draw()
end

dt_tot = 0

function love.update(dt)
	dt_tot = dt_tot + dt
	if dt_tot > 0.5 then
		coroutine.resume(generator)
		dt_tot = 0
	end
end