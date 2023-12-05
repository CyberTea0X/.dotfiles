if vim.fn.executable('gpaste-client') == 1 then
    vim.g.clipboard = {
        name = 'gpaste',
        copy = {
                ["+"] = { 'gpaste-client' },
                ["*"] = { 'gpaste-client' },
        },
        paste = {
                ["+"] = { 'gpaste-client', '--use-index', 'get', '0' },
                ["*"] = { 'gpaste-client', '--use-index', 'get', '0' },
        },
        cache_enabled = true,
    }
end
