#/bin/bash
if [[ -z "$1" ]]; then
read -p "Enter filepath: " filepath
else
    filepath=$1
fi
if ! test -f "$filepath"; then
echo "File does not exist."
exit 1
fi
xpath=${filepath%/*} 
xbase=${filepath##*/}
extension=${xbase##*.}
filename=${xbase%.*}
appname=$filename
read -p "Custom application name? (default:$filename? (Y/N): " confirm 
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    read -p "Enter application name: " appname
fi
echo "\
[Desktop Entry]
Name=$appname
Exec=$(realpath $filepath)
Type=Application\
" > ~/.local/share/applications/${filename}.desktop
chmod +x ~/.local/share/applications/${filename}.desktop
