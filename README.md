How to create launcher for the script:


create a file with the .desktop extention



[Desktop Entry]
Version=1.0
Type=Application
Name=instalPost
Exec=sudo /home/name_of_user/fedora-post-install-script/fedora.sh
Terminal=true
Categories=Utility;




Move the launcher file to the appropriate directory for user or system-wide launchers:

For user-specific launchers, move the file to ~/.local/share/applications/.

For system-wide launchers, move the file to /usr/share/applications/.


exact command: sudo mv ~/post_install.desktop /usr/share/applications




chmod +x /path/to/your/launcher.desktop
