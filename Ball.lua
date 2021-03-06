Ball = Class{}

-- Initialize ball.
function Ball:init(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  
  self.dx = math.random(2) == 1 and -100 or 100
  self.dy = math.random(-50, 50)
end

function Ball:collides(box)
  if self.x > box.x + box.width or self.x + self.width < box.x then
    return false
  end

  if self.y > box.y + box.height or self.y + self.height < box.y then
    return false
  end

  return true
end

-- Reset ball to center of screen when function is called, with initial random velocity on both axes.
function Ball:reset()
  self.x = VIRTUAL_WIDTH / 2 - 2
  self.y = VIRTUAL_HEIGHT / 2 - 2
  self.dx = math.random(2) == 1 and -150 or 150
  self.dy = math.random(-50, 50)
end

-- Applies velocity to ball position, scaled by delta time.
function Ball:update(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt 
end

-- Render ball.
function Ball:render()
  love.graphics.rectangle('fill', self.x, self.y, 4, 4)
end