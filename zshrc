# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# echo "Loading zshrc"
# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# echo "zshrc 2"
# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done

      # echo "zshrc 2a"
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac

      # printf "zshrc 2b %s\n" $config
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
      # echo "zshrc 2c"
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"
# echo "zshrc 3"

# Local config
# echo "... Loading local config"
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# echo "... Loading aliases"
# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# echo "zshrc 5"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export DISABLE_SPRING=true
export LEFTHOOK_BIN=bin/lefthook
# echo "zshrc 6"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
