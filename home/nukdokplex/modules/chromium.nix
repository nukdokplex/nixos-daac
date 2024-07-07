{ ... }: {
  programs.chromium = {
    enable = true;
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
    ];
  };
}