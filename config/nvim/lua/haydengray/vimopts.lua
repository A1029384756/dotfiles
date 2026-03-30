local function get_preferred_shell()
	local preferred = { "fish", "zsh", "bash", "sh" }
	for _, shell in ipairs(preferred) do
		if vim.fn.executable(shell) == 1 then
			return shell
		end
	end
	error('No preferred shell found')
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.ch = 0
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 10
vim.opt.updatetime = 250
vim.o.winborder = 'rounded'

vim.o.shell = get_preferred_shell()
