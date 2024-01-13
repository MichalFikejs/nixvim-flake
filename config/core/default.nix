{
  pkgsUnfree,
  ...
}: {
  imports = [
    ./colorscheme.nix
  ];
  config = {
    extraPackages = with pkgsUnfree; [lazygit gcc ripgrep fd stylua gopls gotools gofumpt shfmt terraform];
      
    options = {
      # autowrite = true;
      clipboard = "unnamedplus";
      completeopt = ["menu" "menuone" "noselect"];
      confirm = true;
      cursorline = true;
      expandtab = true;

      formatoptions = "jcroqlnt"; #-- tcqj
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";

      ignorecase = true; # -- Ignore case
      inccommand = "nosplit"; # -- preview incremental substitute
      laststatus = 3; # -- global statusline
      list = true; # -- Show some invisible characters (tabs...
      mouse = "a"; # -- Enable mouse mode
      pumblend = 10; # -- Popup blend
      pumheight = 10; # -- Maximum number of entries in a popup
      scrolloff = 4; # -- Lines of context
      sessionoptions = [ "buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds" ];
      shiftround = true; # -- Round indent
      shiftwidth = 2; # -- Size of an indent
      # opt.shortmess:append({ W = true, I = true, c = true, C = true })
      showmode = false; # -- Dont show mode since we have a statusline
      sidescrolloff = 8; # -- Columns of context
      signcolumn = "yes"; # -- Always show the signcolumn, otherwise it would shift the text each time
      smartcase = true; # -- Don't ignore case with capitals
      smartindent = true; # -- Insert indents automatically
      spelllang = [ "en" ];
      splitbelow = true; # -- Put new windows below current
      splitkeep = "screen";
      splitright = true; # -- Put new windows right of current
      tabstop = 2; # -- Number of spaces tabs count for
      termguicolors = true; # -- True color support
      timeoutlen = 300;
      undofile = true;
      undolevels = 10000;
      updatetime = 200; # -- Save swap file and trigger CursorHold
      virtualedit = "block"; # -- Allow cursor to move where there is no text in visual block mode
      # wildmode = "longest:full,full"; # -- Command-line completion mode
      winminwidth = 5; # -- Minimum window width
      wrap = false; # -- Disable line wrap

      fillchars = {
        foldopen = "";
        foldclose = "";
        # fold = "⸱";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };

      number = true;
      relativenumber = true;
    };

    globals = {
      mapleader = " ";
      markdown_recommended_style = 0;
    };

    plugins.nix.enable = true;
    plugins.nix-develop.enable = true;
  };
}
