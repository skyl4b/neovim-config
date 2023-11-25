return {
  "neovim/nvim-lspconfig",
  init = function()
    -- Add border to LspInfo window
    vim.api.nvim_create_augroup("LspInfoCustomizations", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = "LspInfoCustomizations",
      pattern = "lspinfo",
      callback = function()
        -- Apply the rounded border to the current window
        vim.api.nvim_win_set_config(0, { border = "rounded" })
      end,
    })
    -- Add border to floating windows (hover)
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    ---@diagnostic disable-next-line: duplicate-set-field
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
  end,
  opts = {
    servers = {
      -- Python
      pyright = {},
      ruff_lsp = {
        -- Set options
        init_options = {
          settings = {
            args = {
              -- Set line length
              "--line-length",
              "79",

              -- Enable some ruff rules
              "--select",
              "F,W,E,I,N,D,UP,YTT,TRIO,ASYNC,B,A,COM,C4,DTZ,T10,DJ,EXE,FA,ISC,ICN001,G,INP,"
                .. "PIE,Q,RSE,RET,SLOT,SIM,TCH,INT,ARG,PTH,TD001,TD004,TD005,TD006,"
                .. "TD007,PD,PL,TRY004,TRY200,TRY201,TRY302,TRY400,TRY401,FLY,NPY,AIR,"
                .. "PERF,FURB,LOG,RUF",
            },
          },
        },
      },
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      -- Nix
      nil_ls = {},
      -- Bash
      bashls = {},
      -- Docker
      dockerls = {},
      docker_compose_language_service = {},
      -- JSON
      jsonls = {},
      -- HTML
      html = {},
      -- CSS
      cssls = {},
      -- Markdown
      marksman = {},
      -- YAML
      yamlls = {},
      -- TOML
      taplo = {},
      -- Grammar
      -- ltex = {},
      -- Typst
      typst_lsp = {},
      -- C / C++ / CUDA / Objective-C / Objective-C++
      clangd = {},
      -- Latex
      texlab = {},
      -- Rust
      -- TODO: Use rust-tools
      rust_analyzer = {},
    },
  },
}
