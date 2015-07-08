if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

alias kobito='electron ~/Downloads/kobito/resources/app/'
alias ll='ls -l'
#rbenv
export PATH=$HOME/.rbenv/bin:$PATH
alias l='ls -la'
export DOCKER_CERT_PATH=/Users/suzuki/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
