file_name=utf8CnFontCode.tbl
# conv to utf8 so sed can work
iconv -f utf-16 -t utf-8 CnFontCode.tbl > $file_name

# insert 9 empty codes to fill the gap between two font tile area
for (( i=0; i < 9; i++ ))
do 
    nl=$'\n'
    sed -i '' '232i\
    0'"\\${i}"'= '"\\${nl}"'' $file_name
done

# conv back to utf16 so CrstalTile can read
iconv -f utf-8 -t utf-16 $file_name > out.tbl 
rm $file_name