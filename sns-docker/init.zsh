if [[ ! $commands[docker] ]]; then
  return 1;
fi

source "${0:h}/alias.zsh"
source "${0:h}/configureSharedDirs.zsh"
source "${0:h}/addDockerCompletion.zsh"
