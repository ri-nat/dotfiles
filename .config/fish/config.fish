if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -g ls eza
    abbr -a -g be bundle exec
    abbr -a -g k kubectl
    abbr -a -g tf terraform
    abbr -a -g shame "git commit --amend && git push -f"
    abbr -a -g f foundation

    fish_add_path ~/go/bin
    fish_add_path ~/bin
    fish_add_path /opt/homebrew/opt/binutils/bin

    set -gx EDITOR nvim
    set -x GPG_TTY (tty)

    fzf_configure_bindings --directory=\cp
    # set fzf_preview_dir_cmd exa --color=auto --icons --all
    set -gx $EDITOR "nvim"
    set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

    eval "$(/opt/homebrew/bin/brew shellenv)"
end


# Created by `pipx` on 2023-12-17 18:41:46
set PATH $PATH /Users/rinat/.local/bin

# pnpm
set -gx PNPM_HOME "/Users/rinat/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Load `ssh-agent`
eval (ssh-agent -c) > /dev/null
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID

# Load `~/.env` file
if test -f ~/.env
    source ~/.env
end
