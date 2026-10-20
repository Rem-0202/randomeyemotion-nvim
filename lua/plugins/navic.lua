return {
    {
        "SmiteshP/nvim-navic",
        config = function()
            -- Attach navic (if installed) when an LSP attaches
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    -- only attach navic if the server supports symbols
                    if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
                        local ok, navic = pcall(require, "nvim-navic")
                        if ok then
                            navic.attach(client, args.buf)
                        end
                    end
                end,
            })
        end,
    },
}
