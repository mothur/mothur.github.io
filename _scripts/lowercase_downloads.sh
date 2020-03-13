for file in _download_files/*
do
lc=`echo "$file" | tr '[:upper:]' '[:lower:]'`
mv $file $lc
done
