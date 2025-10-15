# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable"; # or "stable-25.05"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.ruby
    pkgs.bundler
    pkgs.jekyll

    pkgs.gcc
    pkgs.gnumake

    pkgs.zulu
    pkgs.zsh
    
    pkgs.bat
    pkgs.tree
    pkgs.gh

    pkgs.chezmoi
    pkgs.util-linux
  ];

  # Sets environment variables in the workspace
  env = {
    
  };
  
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "github.vscode-github-actions"
      "github.vscode-pull-request-github"
      "EditorConfig.EditorConfig"
      "KnisterPeter.vscode-github"
      "redhat.vscode-yaml"
      "zjffun.snippetsmanager"
      "eliostruyf.vscode-front-matter"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["bundle" "exec" "jekyll" "serve" "--host" "0.0.0.0" "--port" "$PORT"];
          manager = "web";
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
