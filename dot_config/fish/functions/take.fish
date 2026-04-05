function take
    if test (count $argv) -eq 0
        return
    end
    mkdir -p -- $argv[1] && cd -- $argv[1]
end
