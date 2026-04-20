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

      showmode = false; # We already have a statusline
    };
    clipboard = {
      register = "unnamedplus"; # Use the system clipboard
      providers.wl-copy.enable = true;
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
    colorscheme = "github_light";
    colorschemes.github-theme.enable = true;
    lsp = {
      inlayHints.enable = true;
      servers.clangd.enable = true;
      servers.hls = {
        enable = true;
        package = null;
      };
      servers.metals = {
        enable = true;
        config = {
          init_options.inlayHints.inferredTypes.enable = true;
          root_markers = [
            "build.sbt"
            "build.sc"
            "build.mill"
            "build.gradle"
            "pom.xml"
            "settings.gradle"
            "settings.gradle.kts"
          ];
        };
      };
      servers.nixd.enable = true;
      servers.pylsp.enable = true;
      servers.ruff.enable = true;
      servers.rust_analyzer.enable = true;
      servers.solargraph.enable = true;
      servers.tinymist = {
        enable = true;
        config = {
          exportPdf = "onSave";
          compileStatus = "enable";
          formatterMode = "typstyle";
        };
      };
      servers.ty.enable = true;
      servers.verible.enable = true;
      servers.zls.enable = true;
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
      blink-cmp = {
        enable = true;
        settings.keymap.preset = "enter";
        settings.sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "copilot"
          "minuet"
        ];
        settings.completion = {
          menu.auto_show = true;
          ghost_text.enabled = true;
          ghost_text.show_with_menu = true;
          list.selection.auto_insert = false;
        };
        settings.signature.enabled = true;
        settings.sources.providers = {
          minuet = {
            async = true;
            module = "minuet.blink";
            name = "minuet";
            score_offset = 50;
            timeout_ms = 3000;
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
      bufferline = {
        enable = true;
        settings.options = {
          always_show_bufferline = true;
          offsets = [
            {
              filetype = "neo-tree";
              text = "Explorer";
              highlight = "Directory";
              text_align = "left";
            }
            {
              filetype = "snacks_layout_box";
            }
            {
              filetype = "toggleterm";
            }
          ];
        };
      };
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
          markdown = ["autocorrect"];
        };
      };
      direnv.enable = true;
      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };
      indent-blankline.enable = true;
      lazygit.enable = true;
      lsp.servers.julials.enable = true;
      lspconfig.enable = true;
      lspsaga.enable = true;
      lualine.enable = true;
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      markdown-preview.enable = true;
      opencode = {
        enable = true;
        settings = {};
      };
      minuet = {
        enable = true;
        settings = {
          provider = "openai_compatible";
          request_timeout = 3;
          provider_options = {
            openai = {
              model = "gpt-5-mini";
              optional = {
                max_completion_tokens = 256;
                reasoning_effort = "minimal";
              };
            };
            openai_compatible = {
              api_key = "OPENROUTER_API_KEY";
              end_point = "https://openrouter.ai/api/v1/chat/completions";
              model = "mistralai/devstral-small";
              name = "OpenRouter";
              stream = true;
              optional = {
                max_tokens = 256;
                top_p = 0.9;
              };
            };
          };
        };
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
      snacks = {
        enable = true;
        settings = {
          explore.enable = true;
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Telescope find files";
          };
          "<leader>fF" = {
            action = "find_files no_ignore=true";
            options.desc = "Telescope find files without ignore";
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
      toggleterm = {
        enable = true;
        settings = {
          direction = "tab";
          open_mapping = "[[<C-/>]]";
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
        mode = "v";
        action = "\"*ygv";
        key = "<LeftRelease>";
        options.desc = "Yank selection to clipboard in visual mode with mouse";
      }
      {
        mode = "n";
        action = "<C-w>h";
        key = "<C-h>";
        options.desc = "Go to the left window";
      }
      {
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>lua if vim.g.neovide then vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end<CR>";
        key = "<C-=>";
        options.desc = "Increase Neovide scale";
      }
      {
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>lua if vim.g.neovide then vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end<CR>";
        key = "<C-->";
        options.desc = "Decrease Neovide scale";
      }
      {
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>lua if vim.g.neovide then vim.g.neovide_scale_factor = 1 end<CR>";
        key = "<C-0>";
        options.desc = "Reset Neovide scale";
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
        action = "<cmd>BufferLineTogglePin<CR>";
        key = "<leader>bp";
        options.desc = "Toggle pin the current buffer";
      }
      {
        mode = "n";
        action = "<cmd>BufferLineGroupClose ungrouped<CR>";
        key = "<leader>bP";
        options.desc = "Close all unpin buffers";
      }
      {
        mode = ["n" "v"];
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
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        key = "<leader>cd";
      }
      {
        mode = "n";
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        key = "]d";
      }
      {
        mode = "n";
        action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
        key = "[d";
      }
      {
        mode = "n";
        action = "<cmd>Gitsigns next_hunk<CR>";
        key = "]g";
      }
      {
        mode = "n";
        action = "<cmd>Gitsigns prev_hunk<CR>";
        key = "[g";
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
        action = "<cmd>lua Snacks.picker.explorer()<CR>";
        key = "<leader>e";
        options.desc = "File Explorer";
      }
      {
        action = "<cmd>LazyGit<CR>";
        key = "<leader>gg";
        options.desc = "Open LazyGit";
      }
      {
        action = "<cmd>Gitsigns preview_hunk_inline<CR>";
        key = "<leader>gp";
        options.desc = "Preview git hunk";
      }
      {
        mode = [
          "n"
          "x"
        ];
        action = "<cmd>lua require('opencode').ask('@this: ', { submit = true })<CR>";
        key = "<leader>oa";
        options.desc = "Ask OpenCode";
      }
      {
        mode = [
          "n"
          "x"
        ];
        action = "<cmd>lua require('opencode').select()<CR>";
        key = "<leader>ox";
        options.desc = "OpenCode action picker";
      }
      {
        mode = [
          "n"
          "t"
        ];
        action = "<cmd>lua require('opencode').toggle()<CR>";
        key = "<C-o>";
        options.desc = "Toggle OpenCode terminal";
      }
    ];
  };
}
