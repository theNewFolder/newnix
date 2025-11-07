{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    NodeJS.url = "github:garnix-io/nodejs-module";
    Rust.url = "github:garnix-io/rust-module";
    User.url = "github:garnix-io/user-module";
  };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };

  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.NodeJS.garnixModules.default
      inputs.Rust.garnixModules.default
      inputs.User.garnixModules.default
    ];

    config = { pkgs, ... }: {
      nodejs = {
        nodejs-project = {
          buildDependencies = [ pkgs.bluetui pkgs.thinkpad-scripts pkgs.thinkfan pkgs.thinkingRock pkgs.neovim pkgs.emacs pkgs.emacs-all-the-icons-fonts pkgs.niri pkgs.ghostty pkgs.zsh pkgs.zsh-abbr pkgs.zsh-autocomplete pkgs.zsh-autoenv pkgs.zsh-autopair pkgs.zsh-autosuggestions pkgs.zsh-nix-shell pkgs.nix-bash-completions pkgs.git pkgs.linux-firmware pkgs.wirelesstools pkgs.minimal-grub-theme ];
          devTools = [  ];
          prettier = false;
          runtimeDependencies = [  ];
          src = ./.;
          testCommand = "npm run test";
          webServer = null;
        };
      };
      rust = {
        rust-project = {
          buildDependencies = [  ];
          devTools = [ pkgs.vscode pkgs.ripgrep pkgs.lua-language-server pkgs.lua pkgs.corefonts pkgs.coreutils-full pkgs.llm-ls pkgs.llm pkgs.llama-cpp ];
          runtimeDependencies = [ pkgs.iwd pkgs.bluez-tools pkgs.tlp ];
          src = ./.;
          webServer = null;
        };
      };
      user = {
        user-project = {
          authorizedSshKeys = [  ];
          groups = [  ];
          shell = "zsh";
          user = "o";
        };
      };

      garnix.deployBranch = "main";
    };
  };
}
