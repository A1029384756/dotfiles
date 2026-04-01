return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		local ts = require('nvim-treesitter')

		ts.install({
			'odin', 'c', 'cpp', 'dockerfile', 'fish', 'javascript', 'lua', 'python', 'rust', 'go', 'terraform',
		})

		local function activate_bufs(ft)
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == ft then
					vim.treesitter.start(buf)
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end
		end

		vim.api.nvim_create_autocmd('FileType', {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match) or args.match

				if vim.tbl_contains(ts.get_installed('parsers'), lang) then
					activate_bufs(args.match)
					return
				end

				if not vim.tbl_contains(ts.get_available(), lang) then
					return
				end

				ts.install({ lang })
				local timer = vim.uv.new_timer()
				timer:start(500, 500, vim.schedule_wrap(function()
					if vim.tbl_contains(ts.get_installed('parsers'), lang) then
						timer:stop()
						timer:close()
						activate_bufs(args.match)
					end
				end))
			end
		})
	end
}
