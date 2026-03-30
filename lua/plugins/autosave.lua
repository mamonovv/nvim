return {
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0", -- используем стабильную версию
    cmd = "ASToggle", -- команда для включения/выключения
    event = { "InsertLeave", "TextChanged" }, -- события для загрузки плагина
    opts = {
      enabled = true, -- включен ли плагин по умолчанию
      debounce_delay = 1000, -- задержка 1000 мс (не будет сохранять при каждом нажатии)
      trigger_events = {
        immediate_save = { "FocusLost" }, -- при потере фокуса сохраняем мгновенно
        -- остальные события обрабатываются с debounce_delay
      },
      -- Условия для сохранения
      condition = function(buf)
        local filetype = vim.bo[buf].filetype
        -- Не сохраняем автоматически для этих типов файлов
        local excluded_filetypes = { "sql", "gitcommit", "help" }
        if vim.tbl_contains(excluded_filetypes, filetype) then return false end
        return true
      end,
    },
    config = function(_, opts)
      local auto_save = require "auto-save"
      auto_save.setup(opts)

      -- Клавиша для включения/выключения автосохранения
      vim.keymap.set("n", "<leader>n", ":ASToggle<CR>", {
        desc = "Toggle auto-save",
        silent = true,
      })
    end,
  },
}
