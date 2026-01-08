return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install({
			'odin', 'c', 'cpp', 'dockerfile', 'fish', 'javascript', 'lua', 'python', 'rust', 'go', 'terraform',
		})

		vim.api.nvim_create_autocmd('FileType', {
			callback = function(args)
				local ts = require('nvim-treesitter')
				local lang = vim.treesitter.language.get_lang(args.match) or args.match
				local installed = ts.get_installed('parsers')
				if not vim.tbl_contains(installed, lang) then
					local available = ts.get_available()
					if not vim.tbl_contains(available, lang) then
						return
					end
					ts.install({ lang }):wait(300000)
				end
				vim.treesitter.start(args.buf)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		})
	end
}
