-- Команда для шифрования текущего буфера
vim.api.nvim_create_user_command('EncryptFile', function()
    local file = vim.fn.expand('%:p')
    vim.cmd('w')                    -- Сохранить файл перед шифрованием
    os.execute('openssl enc -aes-256-cbc -salt -in ' .. file .. ' -out ' .. file .. '.enc')
    vim.cmd('e ' .. file .. '.enc') -- Открыть зашифрованный файл
end, {})

-- Команда для дешифрования текущего буфера
vim.api.nvim_create_user_command('DecryptFile', function()
    local file = vim.fn.expand('%:p')
    os.execute('openssl enc -d -aes-256-cbc -in ' .. file .. ' -out ' .. file:gsub('.enc$', ''))
    vim.cmd('e ' .. file:gsub('.enc$', '')) -- Открыть дешифрованный файл
end, {})
