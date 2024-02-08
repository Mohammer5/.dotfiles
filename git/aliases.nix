{
  aa = "add -A";
  ahead = "!f() { \
    base=\${1-master}; \
    ahead=$( git rev-list --right-only --count $base...HEAD ); \
    behind=$( git rev-list --left-only --count $base...HEAD ); \
    echo $ahead | awk '{print $1\" commit(s) ahead of '$base'\"}'; \
    echo $behind | awk '{print $1\" commit(s) behind of '$base'\"}'; \
  }; f";
  amend = "commit --amend";
  amno = "commit --amend --no-edit";
  ap = "add -p";
  bD = "!f() { git branch -D $(git branch | fzf); }; f";
  bDm = "!f() { git branch -D $(git branch | fzf -m); }; f";
  c = "commit";
  cm = "commit -m";
  cl = "clone";
  cld = "!f() { git clone https://github.com/dhis2/\${1}; }; f";
  co = "checkout";
  cob = "checkout -b";
  cof = "!f() { git checkout $(git branch | fzf); }; f";
  commit = "commit -S";
  cp = "'cherry-pick'";
  cpc = "'cherry-pick --continue'";
  cpa = "'cherry-pick --abort'";
  csc = "cm 'chore: squash me'";
  csf = "cm 'feat: squash me'";
  csr = "cm 'refactor: squash me'";
  cst = "cm 'test: squash me'";
  d = "diff";
  dc = "diff --name-only --diff-filter=U";
  dn = "diff --name-only";
  ds = "diff --staged";
  dsn = "diff --staged --name-only";
  fo = "fetch origin";
  l1 = "log -n 1";
  l1s = "logs -n 1";
  la = "log --author=\"Gerke\"";
  las = "logs --author=\"Gerke\"";
  logs = "log --color --graph --pretty=format:'%Cred%h%Creset %C(bold blue)<%an> %Cgreen(%cr)%Creset%C(yellow)%d%Creset %s ' --abbrev-commit";
  lan = "la -n";
  mb = "merge-base";
  mo = "!f() { \
    branchName=$( git branch --show-current ); \
    git merge origin/$branchName; \
  }; f";
  poh = "push origin HEAD";
  pohf = "push origin HEAD --force-with-lease";
  unc = "reset HEAD~";
  um = "!f() { git fo && git checkout master && git merge origin/master && git co -; }; f";
  umc = "!f() { git um && git merge master --no-edit; }; f";
  umr = "!f() { git um && git rebase master; }; f";
  rao = "remote add origin";
  rba = "rebase --abort";
  rbc = "rebase --continue";
  ri = "rebase -i";
  rin =  "!f() { git ri HEAD~\${1}; }; f";
  s = "status";
}
