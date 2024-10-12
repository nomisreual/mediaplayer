{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pygobject3
    ]))
    pkgs.playerctl
    pkgs.gobject-introspection
  ];
}
