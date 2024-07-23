{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ]; 
    extensions = [
      { # stylus
        id = "clngdbkpkpeebahjckkjfobafhncgmne";
      }
      { # catppuccin theme
        id = "bkkmolkhemgaeaeggcmfbghljjjoofoh";
      }
      { # catppuccin github icons
        id = "lnjaiaapbakfhlbjenjkhffcdpoompki";
      }
      { # ublock origin
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      }
      { # sponsorblock
        id = "mnjggcdmjocbbbhaepdhchncahnbgone";
      }
      { # return yt dislikes
        id = "gebbhagfogifgggkldgodflihgfeippi";
      }
    ];
  };
}