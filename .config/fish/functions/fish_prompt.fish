function fish_prompt

  set_color $fish_color_autosuggestion
  printf (date "+$c2%H$c0:$c2%M$c0:$c2%S, ")
  echo -n (pwd)
  if gb >/dev/null ^/dev/null
    set_color $fish_color_normal
    echo -n ", "\((gb | awk '$0 ~ /^\*/ { print }' | sed -e 's/^\* //')\)" "
  end

  set_color $fish_color_cwd_root
  echo -n "> "
end
