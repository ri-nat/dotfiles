if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -g ls exa
    abbr -a -g be bundle exec
    abbr -a -g k kubectl
    abbr -a -g tf terraform
    abbr -a -g shame "git commit --amend && git push -f"

    fish_add_path /opt/homebrew/opt/ruby/bin
    fish_add_path -g ~/go/bin
    fish_add_path -g ~/bin

    set -gx EDITOR nvim
    set -x GPG_TTY (tty)
end

