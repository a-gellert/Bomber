local M = {}

M.TILE_SIZE = 16 -- Размер вашей плитки

M.schemes = {
	[1] = {
		"WWWWWWWWWWWWWWW",
		"W P....BB.GF..W",
		"W.W1W.W.W.W.W.W",
		"W.B.M2..B..X..W",
		"W.W.W.W.W.W.W.W",
		"W..3.....D.4..W",
		"WWWWWWWWWWWWWWW",
	},
	[2] = {
		"WWWWWWWWWWWWWWW",
		"W P B B B B B W",
		"W BWBWBWBWBWB W",
		"W 2 . .B. . X W",
		"WWWWWWWWWWWWWWW",
	}
}

return M