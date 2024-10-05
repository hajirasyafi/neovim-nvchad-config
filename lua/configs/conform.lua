---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
  local conform = require "conform"
  for i = 1, select("#", ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

local slow_format_filetypes = {}

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    php = {},
    javascript = function(bufnr)
      return { first(bufnr, "eslint", "prettier") }
    end,
    typescript = function(bufnr)
      return { first(bufnr, "eslint", "prettier") }
    end,
    javascriptreact = function(bufnr)
      return { first(bufnr, "eslint", "prettier") }
    end,
    typescriptreact = function(bufnr)
      return { first(bufnr, "eslint", "prettier") }
    end,
    json = { "prettier" },
    go = function(bufnr)
      return { first(bufnr, "goimports", "gofumpt") }
    end,
    templ = { "prettier" },
    prisma = {},
    xml = {}
  },
  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match "timeout$" then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 1000, lsp_format = "fallback" }, on_format
  end,

  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { timeout_ms = 1000, lsp_format = "fallback" }
  end,
}

return options
