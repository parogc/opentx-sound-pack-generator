
while IFS=, read -r id source trans context path filename
do
    
    first="result/$path/$filename"
    res=${first/wav/aiff}
    say $source -o $res
    wav=${first/aiff/wav}

    lame -m m $res $wav
    rm $res

done < input.csv
