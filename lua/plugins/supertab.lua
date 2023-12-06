-- Use TAB for snippets and autocompletion
return {
  -- Disable snippets keys
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- Configure TAB in cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        local unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- Set mapping
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true })
            -- to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      -- HACK: Cancel the snippet session when leaving insert mode.
      local unlink_group = vim.api.nvim_create_augroup("UnlinkSnippet", {})
      vim.api.nvim_create_autocmd("ModeChanged", {
        group = unlink_group,
        -- When going from select mode to normal and when leaving insert mode
        pattern = { "s:n", "i:*" },
        callback = function(event)
          if
            luasnip.session
            and luasnip.session.current_nodes[event.buf]
            and not luasnip.session.jump_active
          then
            luasnip.unlink_current()
          end
        end,
      })
    end,
  },
}
