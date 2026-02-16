# --- Basic Settings ---
set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 1
set -gx TERM xterm-256color

# --- Colors & Theme ---
# set -gx LS_COLORS (vivid generate catppuccin-latte)
# set -gx LS_COLORS (vivid generate rose-pine-dawn)
set -gx LS_COLORS (vivid generate catppuccin-mocha)
fish_config theme choose "Catppuccin Frappe"

# --- Prompt Variables ---
set -l pink f5c2e7
set -l cyan 89dceb
set -l green a6e3a1
set -l yellow f9e2af
set -l red f38ba8
set -l lavender cba6f7

set -g last_cmd_status 0

function save_status --on-event fish_postexec
    set -g last_cmd_status $status
end

# --- Aliases ---
alias ls "eza -S -l --icons"
alias cz='uvx --from commitizen cz'

# --- Main Prompt ---
function fish_prompt
    set -l last_status $status
    set_color f5c2e7
    echo -n " 󰀵 "
    set_color 89dceb
    echo -n (prompt_pwd)

    # Execution Time (CMD_DURATION)
    if test "$CMD_DURATION" -gt 1000
        set_color f9e2af
        echo -n " 󱎫 "(math -s1 "$CMD_DURATION / 1000")"s"
    end

    # Git Status (Ahead, Behind, Staged, Unstaged, Untracked)
    if git rev-parse --is-inside-work-tree &>/dev/null
        set -l branch (git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        set_color a6e3a1
        echo -n "  $branch"

        # Upstream Diff
        set -l upstream (git rev-parse --abbrev-ref @{u} 2>/dev/null)
        if test -n "$upstream"
            set -l counts (git rev-list --left-right --count "$upstream...HEAD" 2>/dev/null | string split \t)
            test "$counts[2]" -gt 0; and echo -n " ↑$counts[2]"
            test "$counts[1]" -gt 0; and echo -n " ↓$counts[1]"
        end

        # File Status
        set -l gs (git status --porcelain 2>/dev/null)
        if test -n "$gs"
            set -l staged (string match -r '^[AMRCD]' -- $gs | count)
            set -l unstaged (string match -r '^.[MTD]' -- $gs | count)
            set -l untracked (string match -r '^\?\?' -- $gs | count)
            test "$staged" -gt 0; and begin; set_color a6e3a1; echo -n " +$staged"; end
            test "$unstaged" -gt 0; and begin; set_color f9e2af; echo -n " !$unstaged"; end
            test "$untracked" -gt 0; and begin; set_color f38ba8; echo -n " ?$untracked"; end
        end
    end

    set_color f5c2e7
    echo -n "  "

    # Node
    if test -e package.json
        if type -q node
            set_color 68A063; echo -n "  "(string replace -r '^v' '' -- (node -v)); end
    end
    # Python
    if test -e uv.lock -o -n "$VIRTUAL_ENV" -o -e pyproject.toml
        set -l py_ver ""
        if test -e uv.lock; and type -q uv
            set py_ver (uv run python -c "import platform; print(platform.python_version())" 2>/dev/null)
        else if type -q python3
            set py_ver (python3 -c "import platform; print(platform.python_version())" 2>/dev/null)
        end
        if test -n "$py_ver"
            set_color ffd43b; echo -n "  $py_ver"
        end
    end
    # Go
    if test -e go.mod
        if type -q go
            set_color 00add8; echo -n "  "(string replace -r '^go' '' -- (go version | string split ' ')[3]); end
    end
    # Rust
    if test -e Cargo.toml
        if type -q rustc
            set_color ce412b; echo -n "  "(rustc --version | string split ' ')[2]; end
    end

    if test "$last_cmd_status" -ne 0
        set_color f38ba8
        echo -n " ฅT⌂Tฅ $last_cmd_status" 
    end
    
    set_color f5c2e7
    echo -n " ❱ "
    set_color normal
end

# --- External Tools ---
test -f ~/.orbstack/shell/init2.fish; and source ~/.orbstack/shell/init2.fish
status is-interactive; and set -q SSH_CONNECTION; and neofetch

function catsay --description "Display a cat emoji"
    if string length --quiet $argv[1]
        set thoughts $argv[1]
    else
        set thoughts "Hello, World!"
    end
    if string length --quiet $argv[2]
        set eye $argv[2]
    else
        set eye (random choice x '$' O '*' '@' - o '^' ♥)
    end
    set length (string length $thoughts)
    set separator (string repeat -n $length '─')
    echo "\
 /\\_/\ ╭$separator╮
(>$eye.$eye<)│$thoughts│
/ つ  ╰$separator╯"

end

function check_terminal
    if set -q TERM_PROGRAM
        echo $TERM_PROGRAM
    else if set -q GHOSTTY_RESOURCES_DIR
        echo "Ghostty"
    else if set -q KITTY_PID
        echo "kitty"
    else if set -q ALACRITTY_WINDOW_ID
        echo "alacritty"
    else
        echo "Unknown Terminal ($TERM)"
    end
end

if status is-interactive; and not set -q SSH_CONNECTION
  set -l term_name (check_terminal)
  catsay "You are in $term_name"
  echo
end


