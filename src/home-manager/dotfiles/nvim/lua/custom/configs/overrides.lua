local M = {} M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "nix",
    "python",
    "rust",
    "zig",
    "dart",
    "cpp",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    -- "lua-language-server",
    -- "stylua",
    --
    -- -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "prettier",
    --
    -- -- c/cpp stuff
    -- "clangd",
    -- "clang-format",
    --
    -- -- rust-analyzer
    -- "rust-analyzer",
    --
    -- -- nixos language
    -- "rnix-lsp",
    --
    -- -- python
    -- "pylsp",
    --
    -- -- Go
    -- "gopls",
    -- "delve"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
