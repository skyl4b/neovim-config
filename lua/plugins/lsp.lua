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
      basedpyright = {
        settings = {
          basedpyright = {
            -- Use ruff for organizing imports
            disableOrganizeImports = true,

            -- Diagnostic settings
            analysis = {
              -- Enable auto-import
              autoImportCompletions = false,
              -- Automatically add common search paths
              autoSearchPaths = true,
              -- Diagnostic only on open files
              diagnosticMode = "openFilesOnly",
              -- Attempt to determine the types of variables
              -- even without type stubs
              useLibraryCodeForTypes = true,
              -- Override some diagnostic rules
              diagnosticSeverityOverrides = {
                -- Allow missing type stubs, some libraries don't have them
                reportMissingTypeStubs = false,
                -- Allow explicit any
                reportAny = false,
                -- Allow unknown types
                reportUnknownParameterType = false,
                reportUnknownArgumentType = false,
                reportUnknownLambdaType = false,
                reportUnknownVariableType = false,
                reportUnknownMemberType = false,
                -- Allow unused returns
                reportUnusedCallResult = false,
              },
            },
          },
        },
      },
      ruff = {
        init_options = {
          settings = {
            -- Set line length (pep8)
            lineLength = 79,

            -- Enable some ruff rules
            lint = {
              -- stylua: ignore
              select = {
                "F", "W", "E", "I", "N", "D200", "D201", "D202", "D203", "D204", "D205",
                "D206", "D207", "D208", "D209", "D210", "D211", "D212", "D213", "D214",
                "D215", "D300", "D301", "D400", "D401", "D402", "D403", "D404", "D405",
                "D406", "D407", "D408", "D409", "D410", "D411", "D412", "D413", "D414",
                "D415", "D416", "D417", "D418", "D419", "UP", "YTT", "TRIO", "ASYNC",
                "B", "A", "COM", "C4", "DTZ", "T10", "DJ", "EXE", "FA", "ISC", "ICN001",
                "G010", "G101", "G201", "G202", "INP", "PIE", "Q", "RSE", "RET", "SLOT",
                "SIM", "TCH", "INT", "ARG", "PTH", "TD001", "TD004", "TD005", "TD006",
                "TD007", "PD", "PL", "TRY004", "TRY200", "TRY201", "TRY302", "TRY400",
                "TRY401", "FLY", "NPY", "AIR", "PERF", "FURB", "LOG", "RUF",
              },
            },
          },
        },
      },
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            hint = { enable = true },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
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
      tinymist = {},
      -- C / C++ / CUDA / Objective-C / Objective-C++
      clangd = {},
      -- Latex
      texlab = {},
      -- Gleam
      gleam = {},
      -- Rust
      -- Configured by rusttools
      -- XML
      lemminx = {},
      -- General
      typos_lsp = {},
    },
  },
}
