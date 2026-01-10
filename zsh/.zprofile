export PATH="${PATH}:${HOME}/scripts:${HOME}/.local/bin"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export ANDROID_USER_HOME="${XDG_DATA_HOME}/android"
export ANSIBLE_HOME="${XDG_DATA_HOME}/ansible"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export DOTNET_CLI_HOME="${XDG_DATA_HOME}/dotnet"
export __GL_SHADER_DISK_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export LESSHISTFILE="${XDG_DATA_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export PSQL_HISTORY="${XDG_DATA_HOME}/psql_history"
export XCURSOR_PATH="${XDG_DATA_HOME}/icons"

export EDITOR=nvim
export LANG=en_US.UTF-8
export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent"
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt # for python

# zsh
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export SAVEHIST=1000


# openssl
export RANDFILE="${XDG_DATA_HOME}/openssl/rnd"

# terraform
export AWS_REQUEST_CHECKSUM_CALCULATION=when_required
export AWS_RESPONSE_CHECKSUM_VALIDATION=when_required

