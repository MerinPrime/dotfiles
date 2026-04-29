function take
    if test (count $argv) -eq 0
        return
    end
    mkdir -p -- $argv[1] && cd -- $argv[1]
end

alias lg="lazygit"

alias v="nvim"
alias vd="nvim ."

alias cr="cargo run --release"
alias crd="cargo build"
alias cbr="cargo build --release"

