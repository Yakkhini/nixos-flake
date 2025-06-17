{pkgs, ...}: {
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

      showmode = false; # We already have a statusline
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        styles = {
          conditionals = ["standout"];
        };
        flavour = "mocha";
        term_colors = true;
        default_integrations = true;
      };
    };
    plugins = {
      alpha = {
        enable = true;
        theme = "dashboard";
      };
      auto-session = {
        enable = true;
        settings.auto_restore_last_session = true;
      };
      avante = {
        enable = true;
        settings = {
          auto_suggestions_provider = "copilot";
          provider = "openrouter";
          providers = {
            openrouter = {
              __inherited_from = "openai";
              endpoint = "https://openrouter.ai/api/v1";
              api_key_name = "OPENROUTER_API_KEY";
              model = "anthropic/claude-sonnet-4";
            };
          };
          selector = {
            provider = "telescope";
            provider_opts = {};
          };
        };
      };
      blink-cmp = {
        enable = true;
        settings.keymap.preset = "enter";
        settings.sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "copilot"
          "avante_commands"
          "avante_mentions"
          "avante_files"
        ];
        settings.completion = {
          ghost_text.enabled = true;
          list.selection.auto_insert = false;
        };
        settings.signature.enabled = true;
        settings.sources.providers = {
          avante_commands = {
            name = "avante_commands";
            module = "blink.compat.source";
            score_offset = 90;
            opts = {};
          };
          avante_files = {
            name = "avante_files";
            module = "blink.compat.source";
            score_offset = 100;
            opts = {};
          };
          avante_mentions = {
            name = "avante_mentions";
            module = "blink.compat.source";
            score_offset = 1000;
            opts = {};
          };
          copilot = {
            async = true;
            module = "blink-copilot";
            name = "copilot";
            score_offset = 80;
            # Optional configurations
            opts = {
              max_completions = 3;
              max_attempts = 4;
              kind = "Copilot";
              debounce = 750;
              auto_refresh = {
                backward = true;
                forward = true;
              };
            };
          };
        };
      };
      blink-copilot.enable = true;
      blink-compat.enable = true;
      bufferline.enable = true;
      copilot-lua = {
        enable = true;
        settings = {
          panel.enabled = false;
          suggestion.enabled = false;
        };
      };
      comment.enable = true;
      conform-nvim = {
        enable = true;
        settings.formatters_by_ft = {
          haskell = ["ormolu"];
          nix = ["alejandra"];
          c = ["clang-format"];
          scala = ["scalafmt"];
        };
      };
      direnv.enable = true;
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
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
      lualine = {
        enable = true;
        settings.options.theme = "catppuccin";
      };
      lsp = {
        enable = true;
        servers.clangd.enable = true;
        servers.hls = {
          enable = true;
          installGhc = false;
        };
        servers.metals.enable = true;
        servers.nixd.enable = true;
        servers.pylsp.enable = true;
        servers.ruff.enable = true;
        servers.solargraph.enable = true;
        servers.tinymist = {
          enable = true;
          settings = {
            exportPdf = "onSave";
            compileStatus = "enable";
            formatterMode = "typstyle";
          };
        };
        servers.verible.enable = true;
      };
      lspsaga.enable = true;
      lspkind = {
        enable = true;
        symbolMap = {
          Copilot = "";
        };
      };
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      markdown-preview.enable = true;
      neo-tree = {
        enable = true;
        autoCleanAfterSessionRestore = true;
      };
      # neorg.enable = true;
      noice = {
        enable = true;
        settings.routes = [
          {
            view = "mini";
            filter = {event = "msg_showmode";};
          }
        ];
      };
      notify = {
        enable = true;
        settings = {
          max_height = 10;
          max_width = 50;
        };
      };
      nvim-autopairs.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          direction = "tab";
          open_mapping = "[[<C-t>]]";
        };
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
        };
      };
      wakatime.enable = true;
      web-devicons.enable = true;
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
        mode = "n";
        action = "<cmd>BufferLineCloseOthers<CR>";
        key = "<leader>bo";
        options.desc = "Close all other buffers";
      }
      {
        mode = "n";
        action = "<cmd>lua require('conform').format({lsp_fallback=true})<CR>";
        key = "<leader>cf";
        options.desc = "Format the current buffer";
      }
      {
        mode = "n";
        action = "<cmd>Lspsaga hover_doc<CR>";
        key = "<leader>k";
        options.desc = "Show hover documentation";
      }
      {
        mode = "n";
        action = "<cmd>Lspsaga peek_definition<CR>";
        key = "gd";
        options.desc = "Peek definition";
      }
      {
        mode = "n";
        action = "<cmd>Lspsaga code_action<CR>";
        key = "<leader>ca";
        options.desc = "Show code actions";
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
