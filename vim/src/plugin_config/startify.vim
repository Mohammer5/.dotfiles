let g:startify_lists = [
  \   { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \   { 'type': 'sessions',  'header': ['   Sessions']       },
  \   { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \   { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_bookmarks = [
  \   { 'c': '~/.dotfiles/vim/init.vim' },
  \ ]

let g:startify_commands = [
  \   { '--- ======= ---': '' },
  \   { '--- Private ---': '' },
  \   { '--- ======= ---': '' },
  \   { 'xm': ['   Market maker (bot)', 'cd ~/development/market-maker-bot | bd'] },
  \   { 'xmc': ['   Market maker (client)', 'cd ~/development/market-maker-client | bd'] },
  \   { 'xml': ['   Market maker (lib)', 'cd ~/development/market-maker-lib | bd'] },
  \   { '--- ===== ---': '' },
  \   { '--- DHIS2 ---': '' },
  \   { '--- ===== ---': '' },
  \   { 'xdn': ['   Notes', 'cd ~/development/dhis2/notes | bd'] },
  \   { 'xdm': ['   Maintenance app', 'cd ~/development/dhis2/maintenance-app | bd'] },
  \   { 'xdr': ['   Reports app', 'cd ~/development/dhis2/reports-app | bd'] },
  \   { 'xduc': ['  ui-core', 'cd ~/development/dhis2/ui-core | bd'] },
  \   { 'xduw': ['  ui-widgets', 'cd ~/development/dhis2/ui-widgets | bd'] },
  \   { 'xdpt': ['  prop-types', 'cd ~/development/dhis2/prop-types | bd'] },
  \   { 'xdoom': [' Project doom', 'cd ~/development/dhis2/project-doom | bd'] },
  \ ]
