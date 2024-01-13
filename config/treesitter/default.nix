{
  plugins.treesitter = {
    enable = true;
    indent = true;
    ensureInstalled = [
      "bash"
      "c"
      "css"
      "csv"
      "diff"
      "dockerfile"
      "dot"
      "git_config"
      "git_rebase"
      "gitattributes"
      "gitcommit"
      "gitignore"
      "go"
      "gomod"
      "gosum"
      "html"
      "javascript"
      "jsdoc"
      "json"
      "jsonc"
      "lua"
      "luadoc"
      "luap"
      "markdown"
      "markdown_inline"
      "nix"
      "python"
      "ssh_config"
      "query"
      "regex"
      "terraform"
      "toml"
      "tsx"
      "typescript"
      "vim"
      "vimdoc"
      "yaml"
    ];
    incrementalSelection = {
      enable = true;
      keymaps = {
        initSelection = "gnn";
        nodeIncremental = "grn";
        scopeIncremental = "grc";
        nodeDecremental = "grm";
      };
    };
    nixvimInjections = true;
  };
}