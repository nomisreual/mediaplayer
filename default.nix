{pkgs ? import <nixpkgs> {}}:
pkgs.python313Packages.buildPythonApplication {
  pname = "mediaplayer";
  version = "0.1.0";

  pyproject = true;
  build-system = [pkgs.python313Packages.setuptools];

  propagatedBuildInputs = with pkgs.python3Packages; [
    pygobject3
  ];

  buildInputs = with pkgs; [
    gobject-introspection # Needed for GObject Introspection
    playerctl # Adds the Playerctl typelib
    glib # GNOME/GLib dependencies
    wrapGAppsHook3 # Automatically wraps and sets GNOME-related env vars
  ];

  src = ./.;

  dontWrapGApps = true;

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix GI_TYPELIB_PATH : "${pkgs.playerctl}/lib/girepository-1.0"
    )

    # Pass the gappsWrapperArgs to makeWrapperArgs
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';
}
