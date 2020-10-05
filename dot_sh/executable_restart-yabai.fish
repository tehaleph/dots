#!fish

sudo yabai --uninstall-sa
sudo yabai --install-sa

brew services restart yabai

# load the scripting addition
killall Dock
