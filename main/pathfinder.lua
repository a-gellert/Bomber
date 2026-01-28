local M = {}

-- Вспомогательная функция для получения ключа таблицы
local function node_key(x, y) return x .. "_" .. y end

function M.find_path(start_x, start_y, target_x, target_y, grid_ref)
	local open_set = {}
	local closed_set = {}
	local meta = {}

	local start_node = {x = start_x, y = start_y, g = 0, h = math.abs(start_x - target_x) + math.abs(start_y - target_y)}
	start_node.f = start_node.g + start_node.h

	open_set[node_key(start_x, start_y)] = start_node

	while next(open_set) do
		-- Ищем узел с минимальным f
		local current = nil
		local current_key = nil
		for key, node in pairs(open_set) do
			if not current or node.f < current.f then
				current = node
				current_key = key
			end
		end

		-- Если дошли до цели
		if current.x == target_x and current.y == target_y then
			local path = {}
			while current do
				table.insert(path, 1, {x = current.x, y = current.y})
				current = meta[node_key(current.x, current.y)]
			end
			return path
		end

		open_set[current_key] = nil
		closed_set[current_key] = true

		-- Соседи: Право, Лево, Верх, Низ
		local neighbors = {
			{x = current.x + 1, y = current.y}, {x = current.x - 1, y = current.y},
			{x = current.x, y = current.y + 1}, {x = current.x, y = current.y - 1}
		}

		-- Внутри цикла neighbors в pathfinder.lua
		for _, neighbor in ipairs(neighbors) do
			local n_key = node_key(neighbor.x, neighbor.y)

			-- Получаем значение из сетки (nil, "W", "B", "D", "M" и т.д.)
			local cell_type = grid_ref[neighbor.x] and grid_ref[neighbor.x][neighbor.y]

			-- Логика проходимости:
			-- Проходим, если в клетке НИЧЕГО НЕТ (nil) 
			-- ИЛИ если там МИНА ("M")
			local is_walkable = (cell_type == nil) or (cell_type == "M")

			if not closed_set[n_key] and is_walkable then
				-- ... (остальной код g_score и добавления в open_set без изменений)
				local g_score = current.g + 1
				local n_node = open_set[n_key]

				if not n_node or g_score < n_node.g then
					meta[n_key] = current
					open_set[n_key] = {
						x = neighbor.x, y = neighbor.y,
						g = g_score,
						h = math.abs(neighbor.x - target_x) + math.abs(neighbor.y - target_y),
						f = g_score + (math.abs(neighbor.x - target_x) + math.abs(neighbor.y - target_y))
					}
				end
			end
		end
	end
	return nil -- Путь не найден
end

return M