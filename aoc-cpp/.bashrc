# Prompt
export PS1="\n\[\e[1;32m\][aoc-cpp](cpp) \w\n❯ \[\e[0m\]"

# Aliases
alias cpp-format-all='find . -path ./build -prune -o -name "*.cpp" -print -exec clang-format -i {} +'
alias cpp-lint-all='find src -name "*.cpp" -exec clang-tidy {} -header-filter=.* -system-headers=false -p build --checks=* \;'
alias cpp-lint-all-fix='find src -name "*.cpp" -exec clang-tidy {} -fix -header-filter=.* -system-headers=false -p build --checks=* \;'
alias nv="nvim"
alias glr="pretty_git_log"
