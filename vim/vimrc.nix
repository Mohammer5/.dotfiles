{ stdenv, writeText }:

let
  vimAutoCompletion = builtins.readFile ~/.dotfiles/vim/src/auto-completion.vim;
  vimBufferTabLine = builtins.readFile ~/.dotfiles/vim/src/buffer_tab_line.vim;
  vimClipboard = builtins.readFile ~/.dotfiles/vim/src/clipboard.vim;
  vimCursorAndLineNumber = builtins.readFile ~/.dotfiles/vim/src/cursor_and_line_number.vim;
  vimFileSaving = builtins.readFile ~/.dotfiles/vim/src/file_saving.vim;
  vimFileTypes = builtins.readFile ~/.dotfiles/vim/src/file_types.vim;
  vimFolding = builtins.readFile ~/.dotfiles/vim/src/folding.vim;
  vimGeneral = builtins.readFile ~/.dotfiles/vim/src/general.vim;
  vimIndentation = builtins.readFile ~/.dotfiles/vim/src/indentation.vim;
  vimKeyMapping = builtins.readFile ~/.dotfiles/vim/src/key_mapping.vim;
  vimLayout = builtins.readFile ~/.dotfiles/vim/src/layout.vim;
  vimPluginsConfig = builtins.readFile ~/.dotfiles/vim/src/plugins_config.vim;
  vimSyntaxHighlighting = builtins.readFile ~/.dotfiles/vim/src/syntax_highlighting.vim;
  vimTextBehavior = builtins.readFile ~/.dotfiles/vim/src/text_behavior.vim;
  vimConfig = builtins.readFile ~/.dotfiles/vim/src/vim_config.vim;
  vimrc = ''
    ${vimAutoCompletion}
    ${vimBufferTabLine}
    ${vimCursorAndLineNumber}
    ${vimClipboard}
    ${vimFileSaving}
    ${vimFileTypes}
    ${vimFolding}
    ${vimGeneral}
    ${vimIndentation}
    ${vimKeyMapping}
    ${vimLayout}
    ${vimPluginsConfig}
    ${vimSyntaxHighlighting}
    ${vimTextBehavior}
    ${vimConfig}
  '';
in vimrc
