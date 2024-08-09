do shell script "
if ! test -e /Volumes/\"ram disk\" ;  then
diskutil erasevolume HFS+ \"ram disk\" `hdiutil attach -nomount ram://4629672`
fi
"
