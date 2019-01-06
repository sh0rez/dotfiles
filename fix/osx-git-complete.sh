#!/bin/bash
# brew installs bash completions which breaks zsh completions. Remove them:
rm /usr/local/share/zsh/site-functions/git-completion.bash
rm -rf /usr/local/share/zsh/site-functions/_git
