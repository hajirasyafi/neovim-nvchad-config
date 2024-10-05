-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
M.base46 = {
  theme = "bearded-arc",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}
-- M.lsp = { signature = false }
M.ui = {
  statusline = {
    theme = "default",
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())
        if path == "" then
          return ""
        end
        return "%#St_relativepath# " .. vim.fn.expand "%:.:h" .. " /"
      end,
    },
    order = {
      "mode",
      "relativepath",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
  },
}
M.mason = {
  command = true,
  pkgs = {
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
}

return M
