{ stdenv, writeText }:

let
  vimAleLinters = builtins.readFile /etc/nixos/vim/src/ale_config.vim;
  vimAutoCompletion = builtins.readFile /etc/nixos/vim/src/auto-completion.vim;
  vimBufferTabLine = builtins.readFile /etc/nixos/vim/src/buffer_tab_line.vim;
  vimClipboard = builtins.readFile /etc/nixos/vim/src/clipboard.vim;
  vimCursorAndLineNumber = builtins.readFile /etc/nixos/vim/src/cursor_and_line_number.vim;
  vimFileSaving = builtins.readFile /etc/nixos/vim/src/file_saving.vim;
  vimFileTypes = builtins.readFile /etc/nixos/vim/src/file_types.vim;
  vimFolding = builtins.readFile /etc/nixos/vim/src/folding.vim;
  vimGeneral = builtins.readFile /etc/nixos/vim/src/general.vim;
  vimIndentation = builtins.readFile /etc/nixos/vim/src/indentation.vim;
  vimKeyMapping = builtins.readFile /etc/nixos/vim/src/key_mapping.vim;
  vimLayout = builtins.readFile /etc/nixos/vim/src/layout.vim;
  vimPluginsConfig = builtins.readFile /etc/nixos/vim/src/plugins_config.vim;
  vimSyntaxHighlighting = builtins.readFile /etc/nixos/vim/src/syntax_highlighting.vim;
  vimTextBehavior = builtins.readFile /etc/nixos/vim/src/text_behavior.vim;
  vimConfig = builtins.readFile /etc/nixos/vim/src/vim_config.vim;
  vimrc = ''
    ${vimAleLinters}
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
