{
  description = "Ansible playbook to set up a k3s cluster.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ansible
            kubectl
            glibcLocales
          ];

          shellHook = ''
            export PS1="(nix-shell) $PS1" # NOTE: To communicate that a nix shell is active
          '';
        };
      };
    };
}

