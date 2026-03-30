-- Файл: ~/.config/nvim/lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- Оставляем false, чтобы по умолчанию файлы были скрыты
        -- Добавляем .env* в исключения, чтобы они всегда отображались
        hide_dotfiles = false,
        hide_gitignored = false, -- Опционально: показывать файлы из .gitignore
        never_show = { -- Эти директории НИКОГДА не показываем
          ".git",
          ".DS_Store",
          ".history",
        },
      },
    },
  },
}
