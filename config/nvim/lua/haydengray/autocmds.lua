local function enable_highlighting(languages)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = languages,
		callback = function()
			vim.treesitter.start()
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	})
end

enable_highlighting({
	'odin',
	'lua',
	'nix',
	'cpp',
	'c',
	'py',
	'terraform',
	'go'
})
