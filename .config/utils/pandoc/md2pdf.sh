#! /bin/sh
if [ "$1" == "-h" ] ; then
    echo "Usage: `basename $0` [input_file] [out_dir] [-h]"
fi

if [ -z "$1" ]
  then
    echo "No input file specified."
	exit 0
fi

if [ -z "$2" ];then
	out_dir=pdf
else
	out_dir=$2
fi
echo "Creating output dir if not exists : $out_dir"
mkdir -p "$out_dir"
echo "======== Markdown to PDF ================"
filename_full=$(basename -- "$1")
extension="${filename_full##*.}"
filename="${filename_full%.*}"
out_file=$out_dir/${filename}".pdf"
data_dir="$HOME/.config/utils/pandoc"
header_file="$data_dir/templates/head.tex"
user_metadata_file="$(dirname \"$1\")/metadata.yml"
metadata_file="~/.config/utils/templates/metadata.yml"
[ -f "$user_metadata_file" ] && metadata_file="$user_metadata_file"
echo "Source file": $filename_full
echo "Target file": $out_file
echo "Metadata file": $metadata_file

pandoc -N -s \
    --data-dir="$data_dir"\
    --template=eisvogel.tex \
    -H "$header_file" \
    --listings  $1 \
    --toc --toc-depth=4 \
    --metadata-file "$metadata_file" \
    -o $out_file


echo "========================================="
