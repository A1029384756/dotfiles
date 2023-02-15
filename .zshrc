export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
)

export LANG=en_US.UTF-8

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

export QSYS_ROOTDIR="/home/haydengray/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"

path+=('/home/haydengray/.local/bin')
export path

function gd () {
if [ -f "project.godot" ]; then
    NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim -S ./Session.vim
else
    echo "no godot project found"
fi
}
