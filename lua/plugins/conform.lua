return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang_format" },
            python = { "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            java = { "clang_format" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
