{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
  github = "https://github.com";
in {
  # "vim-prettier" = buildVimPlugin {
  #   name = "vim-prettier";
  #   src = fetchgit {
  #     url = "${github}/prettier/vim-prettier";
  #     #rev = "master";
  #     sha256 = "197fy3g3fvqysaf5h4h865a432nbjy91k1g8b303c3y5whgwh1ff";
  #   };
  #   dependencies = [];
  # };

  "vim-kitty-navigator-custom" = buildVimPlugin {
    name = "vim-kitty-navigator";
    src = fetchgit {
      url = "${github}/knubie/vim-kitty-navigator";
      # sha256 = "03rf49w3x67aayfn6hl0jhf4gik1scq4khhnvicp1zabdn8cq175";
    };
    dependencies = [];
    postInstall = ''
      echo ""
      echo " !!!!! "
      echo ">>> REMEMBER TO RUN: cp $out/*.py ~/.config/kitty/"
      echo " !!!!! "
      echo ""
    '';
  };

  "cypher-vim-syntax" = buildVimPlugin {
    name = "cypher-vim-syntax";
    src = fetchgit {
      url = "${github}/neo4j-contrib/cypher-vim-syntax";
      sha256 = "1sjkjlnsp7kmv8rgd46pwc2k5xj90xfn3rn9b5zabr6c2gjfb4l8";
    };
    dependencies = [];
  };

  "vim-windowswap" = buildVimPlugin {
    name = "vim-windowswap";
    src = fetchgit {
      url = "${github}/wesQ3/vim-windowswap";
      sha256 = "1zzgwxv0a4i1qlig1c3n6n9ns2fqkkv6jqc2qxcipn6v6v88sl2b";
    };
    dependencies = [];
  };

  "nerdtree-clip" = buildVimPlugin {
    name = "nerdtree-clip";
    src = fetchgit {
      url = "${github}/mortonfox/nerdtree-clip";
      sha256 = "0wkqb6wy9zrx7vrkmickr6kv1vjx6hkh3d6zgkglv86hid360pkq";
    };
    dependencies = [];
  };

  # "nerdtree-git-plugin" = buildVimPlugin {
  #   name = "nerdtree-git-plugin";
  #   src = fetchgit {
  #     url = "${github}/Xuyuanp/nerdtree-git-plugin";
  #     sha256 = "108ziy0w8mhfhqw9z5s023fvx4bj0a1ip2phbg7320dg344z3hz3";
  #   };
  #   dependencies = [];
  # };

  "scss-syntax" = buildVimPlugin {
    name = "scss-syntax";
    src = fetchgit {
      url = "${github}/cakebaker/scss-syntax.vim";
      sha256 = "0p6yy6d7lwi87rvk4c6b2ggrvpddrfksrgdwz993gvxxxbnpwi8q";
    };
    dependencies = [];
  };

  "vim-jsx" = buildVimPlugin {
    name = "vim-jsx";
    src = fetchgit {
      url = "${github}/mxw/vim-jsx";
      sha256 = "0czjily7kjw7bwmkxd8lqn5ncrazqjsfhsy3sf2wl9ni0r45cgcd";
    };
    dependencies = [];
  };

  "vim-jest-snippets" = buildVimPlugin {
    name = "vim-jest-snippets";
    src = fetchgit {
      url = "${github}/jhkersul/vim-jest-snippets";
      sha256 = "1qmfizkfad2qmy0wwqd8fac329rwby419qbj48lsdfpgmmhskn2x";
    };
    dependencies = [];
  };

  # "vim-javascript" = buildVimPlugin {
  #   name = "vim-javascript";
  #   src = fetchgit {
  #     url = "${github}/pangloss/vim-javascript";
  #     sha256 = "16s3s883azfmwkr6hhnh8m7ibk6jm3vnvpmsagangxn0mz6ky533";
  #   };
  #   dependencies = [];
  # };

  "vim-styled-jsx" = buildVimPlugin {
    name = "vim-styled-jsx";
    src = fetchgit {
      url = "${github}/alampros/vim-styled-jsx";
      sha256 = "06d5xrdpr4rnzqmj1ri48d0p0a7hwdsyaqnnhl90npwjl0p5pknp";
    };
    dependencies = [];
  };

  "vim-import-js" = buildVimPlugin {
    name = "vim-import-js";
    src = fetchgit {
      url = "${github}/Galooshi/vim-import-js";
      sha256 = "0qmsssaj3g51yq78cri7052ahxn0m0y83284dqjlrkvw7yq3ijpl";
    };
    dependencies = [];
  };

  # "vim-graphql" = buildVimPlugin {
  #   name = "vim-graphql";
  #   src = fetchgit {
  #     url = "${github}/jparise/vim-graphql";
  #     sha256 = "0py0z33qhff671l80ika6zz8gd9zjh0c3x41v3gwjl9089j3if07";
  #   };
  #   dependencies = [];
  # };

  "php-vim" = buildVimPlugin {
    name = "php-vim";
    src = fetchgit {
      url = "${github}/StanAngeloff/php.vim";
      sha256 = "09nvmrijx55pb5lydcdd498y7wjaxyi9b2i36k4rggjd32gdw6mk";
    };
    dependencies = [];
  };

  "tern_for_vim" = buildVimPlugin {
    pname = "tern_for_vim";
    # version = "2019-01-23";
    src = fetchgit {
      url = "${github}ternjs/tern_for_vim";
      sha256 = "0vpi5lqlyf6kcc0ha8hf3ch2h8v3awidgpwbrv9f3bqvyg4yhdcd";
    };
  };
}
