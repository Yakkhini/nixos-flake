{...}: {
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";

      cursorline = true;
      smoothscroll = true;
      wrap = false;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;

      ignorecase = true;
      smartcase = true;

      termguicolors = true;
    };
    # colorschemes.base16 = {
    #   enable = true;
    #   colorscheme = "rose-pine";
    # };
    colorschemes.oxocarbon.enable = true;
    plugins = {
      alpha = {
        enable = true;
        theme = "dashboard";
      };
      auto-session = {
        enable = true;
        autoSession.enableLastSession = true;
        extraOptions = {
          pre_save_cmds = ["Neotree close"];
        };
      };
      bufferline.enable = true;
      clangd-extensions.enable = true;
      cmp = {
        enable = true;
        settings.sources = [
          {
            name = "copilot";
            priority = 1000;
          }
          {
            name = "nvim_lsp";
            priority = 800;
          }
          {
            name = "luasnip";
            priority = 500;
          }
          {
            name = "fuzzy_buffer";
            priority = 100;
          }
          {
            name = "fuzzy_path";
            priority = 100;
          }
        ];
        settings.mapping = {
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        settings.experimental = {
          ghost_text = true;
        };
      };
      copilot-lua = {
        enable = true;
        panel.enabled = false;
        suggestion.enabled = false;
      };
      comment.enable = true;
      direnv.enable = true;
      indent-blankline.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Telescope find files";
          };
          "<leader>fg" = {
            action = "live_grep";
            options.desc = "Telescope live grep";
          };
          "<leader>fb" = {
            action = "buffers";
            options.desc = "Telescope buffers";
          };
          "<leader>fh" = {
            action = "help_tags";
            options.desc = "Telescope help tags";
          };
        };
      };
      lazygit.enable = true;
      lualine.enable = true;
      lsp = {
        enable = true;
        servers.clangd.enable = true;
        servers.metals.enable = true;
        servers.nixd.enable = true;
      };
      lspsaga.enable = true;
      luasnip = {
        enable = true;
        extraConfig = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      neo-tree = {
        enable = true;
        addBlankLineAtTop = true;
      };
      nvim-autopairs.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            height = 30;
            width = 130;
          };
          open_mapping = "[[<C-t>]]";
        };
      };
      treesitter.enable = true;
      which-key.enable = true;
    };

    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        action = "<C-w>h";
        key = "<C-h>";
        options.desc = "Go to the left window";
      }
      {
        mode = "n";
        action = "<C-w>j";
        key = "<C-j>";
        options.desc = "Go to the bottom window";
      }
      {
        mode = "n";
        action = "<C-w>k";
        key = "<C-k>";
        options.desc = "Go to the top window";
      }
      {
        mode = "n";
        action = "<C-w>l";
        key = "<C-l>";
        options.desc = "Go to the right window";
      }
      {
        mode = "n";
        action = "<cmd>BufferLineCyclePrev<CR>";
        key = "<S-h>";
        options.desc = "Go to the previous buffer";
      }
      {
        mode = "n";
        action = "<cmd>BufferLineCycleNext<CR>";
        key = "<S-l>";
        options.desc = "Go to the next buffer";
      }
      {
        mode = "n";
        action = "<cmd>BufferLinePick<CR>";
        key = "<S-b>";
        options.desc = "Pick a buffer";
      }
      {
        mode = "n";
        action = "<cmd>bdelete<CR>";
        key = "<S-d>";
        options.desc = "Close the current buffer";
      }
      {
        mode = "t";
        action = "<C-\\><C-n>";
        key = "<Esc><Esc>";
        options.desc = "Exit terminal mode";
      }
      {
        mode = "n";
        action = "<cmd>Telescope session-lens<CR>";
        key = "<leader>fs";
        options.desc = "Search for a session";
      }
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-n>";
        options.desc = "Toggle the Neo file tree";
      }
      {
        action = "<cmd>LazyGit<CR>";
        key = "<leader>g";
        options.desc = "Open LazyGit";
      }
    ];
  };
}
