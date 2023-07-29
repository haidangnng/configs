#!/bin/bash

export TRANSPARENT=0x00000000

pallete=(
  WHITE=#D9E0EE,
  DARKER_BLACK=#191828,
  BLACK=#1E1D2D, --  NVIM BG
  BLACK2=#252434,
  ONE_BG=#2D2C3C, -- REAL BG OF ONEDARK
  ONE_BG2=#363545,
  ONE_BG3=#3E3D4D,
  GREY=#474656,
  GREY_FG=#4E4D5D,
  GREY_FG2=#555464,
  LIGHT_GREY=#605F6F,
  RED=#F38BA8,
  BABY_PINK=#FFA5C3,
  PINK=#F5C2E7,
  LINE=#383747, -- FOR LINES LIKE VERTSPLIT
  GREEN=#ABE9B3,
  VIBRANT_GREEN=#B6F4BE,
  NORD_BLUE=#8BC2F0,
  BLUE=#89B4FA,
  YELLOW=#FAE3B0,
  SUN=#FFE9B6,
  PURPLE=#D0A9E5,
  DARK_PURPLE=#C7A0DC,
  TEAL=#B5E8E0,
  ORANGE=#F8BD96,
  CYAN = #89DCEB,
  STATUSLINE_BG=#232232,
  LIGHTBG=#2F2E3E,
  PMENU_BG=#ABE9B3,
  FOLDER_BG=#89B4FA,
  LAVENDER=#C7D1FF,
)

transparency=(
  [100]=FF
  [95]=F2
  [90]=E6
  [85]=D9
  [80]=CC
  [75]=BF
  [70]=B3
  [65]=A6
  [60]=99
  [55]=8C
  [50]=80
  [45]=73
  [40]=66
  [35]=59
  [30]=4D
  [25]=40
  [20]=33
  [15]=26
  [10]=1A
  [5]=0D
  [0]=00
)

# hex_to_argb () {
#   color=${1#*"=#"}
#   name=(${1//=/ })
#   echo $color $name
#   export $name="0xFF"$color
# }

function get_color () {
  name=$1
  transparent=$2
  for i in "${pallete[@]}";
  do
    key=(${i//=/ })
    value=${i#*"=#"}
    if [[ "$key" == "$name" ]]; then
        if [ -z "$transparent" ]; then 
          echo 0xFF${value}
        else 
          echo 0x${transparency[$transparent]}${value}
        fi 
    fi
  done
}

test=$(get_color BLUE 60)
echo $test

export -f get_color


# for i in "${pallete[@]}" 
# do
#   hex_to_argb $i
# done

