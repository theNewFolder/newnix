{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib";
    User.url = "github:garnix-io/user-module";
    Rust.url = "github:garnix-io/rust-module";
    UptimeKuma.url = "github:garnix-io/uptime-kuma-module";
  };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };

  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.User.garnixModules.default
      inputs.Rust.garnixModules.default
      inputs.UptimeKuma.garnixModules.default
    ];

    config = { pkgs, ... }: {
      user = {
        user-project = {
          authorizedSshKeys = [  ];
          groups = [  ];
          shell = "zsh";
          user = "o";
        };
      };
      rust = {
        rust-project = {
          buildDependencies = [  ];
          devTools = [  ];
          runtimeDependencies = [  ];
          src = ./.;
          webServer = null;
        };
      };
      uptimeKuma = {
        uptimeKuma-project = {
          path = "/";
          port = 3001;
        };
      };

      garnix.deployBranch = "main";
    };
  };
}
