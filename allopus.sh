#! /bin/bash
OIFS="$IFS"
IFS=$'\n'

topus() {
	new="${file%.*}"
	echo "converting $file to $new.ogg"
	ffmpeg -i "$file" -vn -acodec libopus -compression_level 10 -vbr on -b:a 256k "$new.ogg"
	rm "$file"
}

for file in $(find . -type f); do
	if [[ "$file" =~ ^.*\.(flac|alac|m4a)$ ]]; then
		topus "$file"
	fi 
done

IFS="$OIFS"
