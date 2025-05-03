return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
        borderchars = {
            prompt = { " ", " ", "─", "│", "│", " ", "─", "└" },
            results = { "─", " ", " ", "│", "┌", "─", " ", "│" },
            preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
        },
        prompt_prefix = " 🔍 ",
        selection_caret = "  ",
        entry_prefix = "  ",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
        },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
            i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["<C-n>"] = require("telescope.actions").cycle_history_next,
                ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            },
        },
    }
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}
