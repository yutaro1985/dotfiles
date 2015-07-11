if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

alias kobito='electron ~/Downloads/kobito/resources/app/'
#rbenv
export PATH=$HOME/.rbenv/bin:$PATH
export DOCKER_CERT_PATH=/Users/suzuki/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac
