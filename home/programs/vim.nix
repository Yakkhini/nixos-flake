{pkgs, ...}: {
  programs.vim = {
    enable = true;
    settings.undodir = ["$HOME/.vim/undo"];
    extraConfig = ''
      syntax on
      filetype on
      set number
      set relativenumber
      set cursorline
      set wrap
      set showcmd
      set wildmenu
      set undofile
      set nofoldenable

      set hlsearch
      set incsearch
      set ignorecase
      set smartcase
      set scrolloff=5
      set textwidth=80

      cmap w!! w !sudo tee %

      " wayland clipboard support
      xnoremap "+y y:call system("wl-copy", @")<cr>
      nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', ''', 'g')<cr>p
      nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', ''', 'g')<cr>p
    '';
  };
}
