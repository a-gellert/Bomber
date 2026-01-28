-- main/game_config.lua

local M = {}

-- ГЕОМЕТРИЯ
M.GRID_SIZE = 16
M.HALF_GRID = 8

-- ТАЙМИНГИ
M.BOMB_TIMER = 2.0
M.CHAIN_REACTION_DELAY = 0.3
M.EXPLOSION_LIFETIME = 0.4

-- СЛОИ (Z-index)
M.Z_FLOOR = 0.0
M.Z_EXPLOSION = 0.4
M.Z_ITEM = 0.5
M.Z_ENEMY = 0.8
M.Z_PLAYER = 1.0

-- ХЕШИ (чтобы не вызывать hash() каждый раз, это быстрее)
M.GROUP_EXPLOSIVE = hash("explosive")
M.GROUP_PLAYER = hash("player")
M.GROUP_ENEMY = hash("enemy")

M.EVENT_COLLISION = hash("collision_response")

M.TILE_WALLS = hash("walls")
M.TILE_BRICKS = hash("bricks")

-- ЦВЕТА (vmath объекты тоже можно хранить здесь)
M.COLOR_WHITE = vmath.vector4(1, 1, 1, 1)
M.COLOR_TRANSPARENT = vmath.vector4(1, 1, 1, 0)

-- В game_config.lua добавим функцию:
function M.snap_to_grid(x, y)
	local cx = math.floor(x / M.GRID_SIZE) * M.GRID_SIZE + M.HALF_GRID
	local cy = math.floor(y / M.GRID_SIZE) * M.GRID_SIZE + M.HALF_GRID
	return vmath.vector3(cx, cy, 0)
end

return M