# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable"; # "stable-24.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.go
    pkgs.hugo
    pkgs.dart-sass
    pkgs.zsh
    pkgs.oh-my-zsh
    pkgs.gh
    pkgs.tree
    pkgs.bat
  ];

  # Sets environment variables in the workspace
  env = {
    ZSH = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
  };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "redhat.vscode-yaml"
      "eliostruyf.vscode-front-matter"
      "kofuk.hugo-utils"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "hugo" "server" "-D" "-p" "$PORT" "--bind" "0.0.0.0" ];
          manager = "web";
        };
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
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
