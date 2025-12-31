vim.filetype.add({
	pattern = {
		['Jenkinsfile'] = 'groovy'
	},
	extension = {
		tf = 'terraform',
		tpp = 'cpp',
		txx = 'cpp',
		slang = 'shaderslang',
		shaderslang = 'shaderslang',
		vert = 'glsl',
		frag = 'glsl',
		container = 'ini',
		pod = 'ini',
	}
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { 'en_us' }
	end
})
