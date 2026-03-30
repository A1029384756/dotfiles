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
					ts.install({ lang })
					local timer = vim.uv.new_timer()
					local ft = args.match
					timer:start(500, 500, vim.schedule_wrap(function()
						if vim.tbl_contains(ts.get_installed('parsers'), lang) then
							timer:stop()
							timer:close()
							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == ft then
									vim.treesitter.start(buf)
									vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
								end
							end
						end
					end))
				end
			end
		})
	end
}
