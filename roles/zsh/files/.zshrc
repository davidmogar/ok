export ZSH=~/.config/zsh

#------------------------------
# Load config files
#------------------------------
for config_file ($ZSH/lib/*.zsh); do
  custom_config_file="${ZSH_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

#------------------------------
# Load theme (default should be a link to the chosen theme)
#------------------------------
if [ -L $ZSH/themes/default.zsh ]; then
  source $ZSH/themes/default.zsh
fi
