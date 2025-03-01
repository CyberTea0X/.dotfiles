vim.api.nvim_create_user_command('IndentWithTabs', function()
    vim.cmd(":set autoindent noexpandtab tabstop=4 shiftwidth=4")
end, {})
