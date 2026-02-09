local M = {}

M.TILE_SIZE = 16

-- W: Стена, B: Кирпич, 1-4: Враги, X: Выход, P: Игрок, M: Мина, D,F,G: Динамит
M.schemes = {
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P   B       W", "W     B   X   W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P   B   X   W", "W     M       W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P  BBB  X   W", "W     D       W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 2, layout = { "WWWWWWWWWWWWWWW", "W P   B   B X W", "W     B   B   W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P   B F B X W", "W     B   B   W", "WWWWWWWWWWWWWWW" } },
	-- Уровень 6: Введение врагов
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P   1   B X W", "W     B   B   W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P  BMB  X   W", "W    B1B      W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 2, layout = { "WWWWWWWWWWWWWWW", "W P B W B X   W", "W   B W B     W", "W   F W G     W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . . . B X W", "W B W B W B W W", "W 2 . . . M . W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P B B B B X W", "W B B 1 2 B B W", "W B B B D B B W", "WWWWWWWWWWWWWWW" } },
	-- Уровень 11: Сложные цепи
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . . . . . W", "W W W W W W W W", "W G . F . D . X", "W B B B B B B B", "WWWWWWWWWWWWWWW" } },
	{ bombs = 2, layout = { "WWWWWWWWWWWWWWW", "W P . . . 1 . W", "W B B B B B B W", "W . . . . . . W", "W B B B B B B W", "W X . . . 2 . W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . . . . . W", "W B B M B B B W", "W B 3 . 4 B B W", "W B B B B B X W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 2, layout = { "WWWWWWWWWWWWWWW", "W P . . B . . W", "W W B W B W B W", "W . . . F . . W", "W B W B W B W X", "W . . . . . . W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P B B B B B W", "W B W W W W B W", "W B W X . W B W", "W B W M . W B W", "W B B B G B B W", "WWWWWWWWWWWWWWW" } },
	-- Уровень 16-20: Мастер-пазлы
	{ bombs = 2, layout = { "WWWWWWWWWWWWWWW", "W P . 1 . 2 . W", "W B B B B B B W", "W . 3 . 4 . . W", "W B B B B B B W", "W . . . . . X W", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . B . B . W", "W W B W G W B W", "W . B . B . B W", "W B W F W B W X", "WWWWWWWWWWWWWWW" } },
	{ bombs = 3, layout = { "WWWWWWWWWWWWWWW", "W P . . . . . W", "W B W B W B W B", "W B B B B B B B", "W 1 2 3 4 . . X", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . . . . . W", "W B B B B B B B", "W B M G M B B B", "W B B B B B B X", "WWWWWWWWWWWWWWW" } },
	{ bombs = 1, layout = { "WWWWWWWWWWWWWWW", "W P . . . . . W", "W W W W W W W W", "W B B B B B B B", "W 1 2 3 4 B B B", "W D F G M B X W", "WWWWWWWWWWWWWWW" } },
}

return M