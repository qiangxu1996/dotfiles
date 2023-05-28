#!/usr/bin/env bash

# https://github.com/romkatv/zsh-bin/issues/6
echo 'unset FPATH' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
# https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html
echo '[ -z "$PS1" ] || exec zsh' >> ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"
