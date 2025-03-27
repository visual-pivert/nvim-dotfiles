require("nvim-tree").setup({
	view = {
		side = "right"
	},
	filters = {
		-- Ignorer les dossiers spécifiques
		custom = {".git", "node_modules", "dist"}  -- Liste des dossiers à ignorer
	}
})


