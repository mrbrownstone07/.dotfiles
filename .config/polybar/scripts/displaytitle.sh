#!/bin/bash

# clipboarder(){
#   echo "%{A3:echo '$1' | xclip -selection clipboard:}$1%{A}"
# }

# mode=$(i3var get pbtitlemode)

# if [[ $1 = switch ]]; then
  
#   if [[ $mode = advanced ]]; then
#     i3var set pbtitlemode normal
#     mode=normal
#   else
#     i3var set pbtitlemode advanced
#     mode=advanced
#   fi

# fi

# if [[ $mode = advanced ]]; then
#   awc=$(i3get -r c)
#   awi=$(i3get -r i)
#   output="$(clipboarder "$awc")   ---    $(clipboarder "$awi")"
# else
#   awt=$(i3get -r t)
#   output="$(clipboarder "$awt")"
# fi


awt=$(i3get -r c)


# echo "%{B#00FF00}%{F#FF00FF}string%{F-} anything%{B-}"

echo "$awt"

# polybar-msg hook MODULENAME HOOKNUMBER
# echo "%{A1:polybar-msg hook titlehook 3:}${output//\"/}%{A}"