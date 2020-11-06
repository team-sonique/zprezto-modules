alias mi='mvn clean install'
alias mist='mvn clean install -DskipTests'
alias mih2='mvn clean install -DuseH2=true'
alias mio='mvn clean install -PuseOracle'
alias mior='mvn clean install -PuseOracle,rebuildDatabase'
alias mistor='mvn package -PuseOracle,rebuildDatabase -pl ${PWD##*/}-sql'

alias mb='buildMe'

alias update-bundle='brew tap homebrew/bundle && brew bundle --file=${ZDOTDIR}/Brewfile'
alias removeKnownHostBuildAgents='sed -i "" "/^ba*/d" ~/.ssh/known_hosts'

alias stopoas='sudo /usr/local/McAfee/AntiMalware/VSControl stopoas'
alias startoas='sudo /usr/local/McAfee/AntiMalware/VSControl startoas'
alias resetVpn='sudo killall vpnagentd'
alias amqbrowse='activemq browse --amqurl tcp://localhost:61616'

alias kick='pbcopy < ~/Dropbox/sonique\ shared/Jira/kickoff.txt'
alias demo='pbcopy < ~/Dropbox/sonique\ shared/Jira/demo.txt'