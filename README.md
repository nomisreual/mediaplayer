# A media player application using Python and GObject

A nix package for Alexays `mediaplayer.py` script which can be found on
[GitHub](https://github.com/Alexays/Waybar).

I created the package for my own convenience, but you are welcome to use it yourself and tweak it to your liking.

## Usage

For development, just run `nix develop` (`nix-shell` works as well). For building the application, run `nix build` (`nix-build` works as well).

If you want to install the package and use flakes, simply add it to your flake inputs:

```nix
inputs = {
    ...
    mediaplayer = {
      url = "github:nomisreual/mediaplayer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ...
}
```

You can then add to your list of packages:

```nix
inputs.mediaplayer.packages.${pkgs.system}.default
```

This in conjunction with the following module in `waybar` already displays playing titles correctly:

```json
"custom/media": {
    "format": "{icon} {}",
    "escape": true,
    "return-type": "json",
    "max-length": 40,
    "on-click": "playerctl play-pause",
    "on-click-right": "playerctl stop",
    "smooth-scrolling-threshold": 10,
    "on-scroll-up": "playerctl next",
    "on-scroll-down": "playerctl previous",
    "exec": "mediaplayer 2> /dev/null",
}
```

If you want the `playerctl` functionality clicking on scrolling, you need to add the `playerctl` package as well.
