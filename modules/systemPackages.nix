{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      tree
      wget
      xclip
      fzf
      pavucontrol
      docker-compose
      autorandr

      # External HDD compatibility
      ntfs3g
      exfat
      docker-compose
    ];
  };
}
