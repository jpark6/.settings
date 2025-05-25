#!/bin/bash

case "$OSTYPE" in
  darwin*)
    WEZTERM_FILE="/Users/jakepark/Repos/.settings/.wezterm.lua"
    SCHEMES_FILE="/Users/jakepark/Repos/.settings/wezterm_color_scheme_list.txt"
    ;;
  *)
    WEZTERM_FILE="/mnt/d/Repos/.settings/.wezterm.lua"
    SCHEMES_FILE="/mnt/d/Repos/.settings/wezterm_color_scheme_list.txt"
    ;;
esac

THEMES=()
while IFS= read -r line; do
  THEMES+=("$line")
done < <(cat $SCHEMES_FILE)
THEME_CNT="${#THEMES[@]}"

RANDOM_THEME="${THEMES[RANDOM % $THEME_CNT ]}"

echo "🔀 Change WezTerm Random Theme 🎲"
echo "🎰 Theme Name : $RANDOM_THEME ♣️"

sed -i "" "s|config.color_scheme = '.*'|config.color_scheme = '$RANDOM_THEME'|" $WEZTERM_FILE
