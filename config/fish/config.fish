
for config_file in $HOME/.dotfiles/config/fish/**/*.fish
    . $config_file
end

alias pw pws

set -x PWS "$HOME/Dropbox/.pws"
set -x NODE_PATH /usr/local/lib/node_modules

set PATH $HOME/.phpenv/shims $HOME/.phpenv/bin $HOME/local/bin /sbin /bin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin

set PATH $PATH "$HOME/Projects/php-project/bin"
set PATH $PATH /usr/local/go/bin:$PATH
set PATH $PATH /usr/local/Cellar/ruby/1.9.3-p0/bin
set PATH $PATH "$HOME/tools/bin"

set fish_complete_path $fish_complete_path "$HOME/.dotfiles/config/fish/completions/"

function git_prompt
    set head (git symbolic-ref HEAD 2> /dev/null)

    if test -z $head
        return
    end

    set branch (echo -n "$head" | sed -e "s/^refs\/heads\///")

    echo -n " ($branch)"
end

function fish_prompt
    printf '%s@%s %s%s%s%s %s⚡%s ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (git_prompt) (set_color $fish_color_operator) (set_color normal)
end

