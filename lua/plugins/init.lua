return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
    cmd = { "ConformInfo" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "go",
        "jsdoc",
        "json",
        "php",
        "prisma",
        "python",
        "scss",
        "templ",
        "toml",
        "tsx",
        "typescript",
        "javascript",
        "xml",
        "yaml",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },
  {
    "williamboman/mason.nvim",

    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "goimports",
        "gofumpt",
        "gopls",
        "json-lsp",
        "luacheck",
        "prisma-language-server",
        "pyright",
        "python-lsp-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        "clang-format",
        "cmakelang",
        "clangd",
        "codelldb",
      },
      rocks = {
        hererocks = true,
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
  },
  {
    "echasnovski/mini.icons",
    opts = {
      file = {
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
        [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
        [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
        ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
        ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
      },
    },
  },
}
