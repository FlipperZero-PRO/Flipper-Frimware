#!/bin/bash
folders_to_delete=("doom" "zombiez" "arkanoid" "tictactoe_game" "tetris_game" "minesweeper" "heap_defence_game" "game15" "solitaire" "blackjack" "game_2048" "bomberduck" "asteroids" "chess" "pong" "jetpack_joyride" "multi_dice" "reversi" "rubiks_cube_scrambler" "scorched_tanks" "snake_2" "t_rex_runner" "tama_p1" "tanksgame" "videopoker" "yatzee" "4inrow" "rootoflife" "simonsays" "game_of_life" "slots" )
deleted_folders=()
not_deleted_folders=()

# Deleting Folders
for folder in "${folders_to_delete[@]}"; do
  if [ -d "Xtreme-Firmware/applications/external/$folder" ]; then
    rm -rf "Xtreme-Firmware/applications/external/$folder"
    deleted_folders+=("$folder")
  else
    not_deleted_folders+=("$folder")
  fi
done

# Display deleted folders
if [ ${#deleted_folders[@]} -gt 0 ]; then
  deleted_folders_str=$(IFS=" "; echo "${deleted_folders[*]}")
  echo "Deleted Games: $deleted_folders_str"
else
  echo "No folders were deleted"
fi

# Display folders that were not deleted
if [ ${#not_deleted_folders[@]} -gt 0 ]; then
  not_deleted_folders_str=$(IFS=" "; echo "${not_deleted_folders[*]}")
  echo "Not deleted folders: $not_deleted_folders_str"
else
  echo "All folders were deleted"
fi
