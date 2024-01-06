{
  ##
  #
  # Utilities & command improvement
  #
  ##

  # nixos config related
  c = "cd /nixos-config";
  nrsy = "sudo nixos-rebuild switch --flake /nixos-config#$hostname --impure --show-trace";
  
  ys = "env BROWSER=none yarn start";
  ns = "env BROWSER=none npm start";
  
  mkdir = "mkdir -p";
  ssh = "kitty +kitten ssh";
  
  # Dir info
  ll = "ls -Flh --group-directories-first";
  
  # System Info
  df = "df -h";                             # human-readable sizes;
  freem = "free -m";                        # show sizes in MB;
  
  # Applications
  torrent = "transmission-cli -w /shared/videos -u 0";
  g = "git";
  master = "g co master";
  chromium = "chromium --disable-features=SameSiteByDefaultCookies,CookiesWithoutSameSiteMustBeSecure,SameSiteDefaultChecksMethodRigorously";
  
  # Remove node_modules folder
  rmnm = "find ./ -iname node_modules -type d | xargs rm -r";
  
  # Shutdown / Reboot
  sn = "shutdown now";
  rb = "reboot";

  # dev shells
  js = "nix develop /nixos-config#js -c $SHELL";
  clj = "nix develop /nixos-config#clojure -c $SHELL";
  
  ##
  #
  # Dir navigation
  # ==============
  # ==============
  # ==============
  #
  ##
  
  # dir navigation
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  
  # Dot files
  "." = "cd ~/.dotfiles";
  dot = ". && nvim (find . -type f -not -path '*.git/*' | fzf)";
  
  # private development
  dev = "cd /development";
  
  #
  # DHIS 2
  # ------
  #
  d2docker = "sudo ln -s /run/current-system/sw/bin/bash /bin/bash; npx --package @dhis2/cli d2 cluster up master --channel dev --db-version dev --seed --update";
  dhis2 = "cd /development/dhis2";
  
  #
  # Compr
  # ------
  #
  compr = "cd /development/compr";
}
