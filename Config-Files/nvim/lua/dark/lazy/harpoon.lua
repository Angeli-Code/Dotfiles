return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>hH",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
    }

    local mappings = {
      { "<leader>ha", 1, "Harpoon to File 1" },
      { "<leader>hs", 2, "Harpoon to File 2" },
      { "<leader>hd", 3, "Harpoon to File 3" },
      { "<leader>hf", 4, "Harpoon to File 4" },
      { "<leader>hq", 5, "Harpoon to File 5" },
      { "<leader>hw", 6, "Harpoon to File 6" },
      { "<leader>he", 7, "Harpoon to File 7" },
      { "<leader>hr", 8, "Harpoon to File 8" },
    }

    for _, map in ipairs(mappings) do
      table.insert(keys, {
        map[1],
        function()
          require("harpoon"):list():select(map[2])
        end,
        desc = map[3],
      })
    end

    return keys
  end,
}

