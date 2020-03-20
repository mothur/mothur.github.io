> file_uses.tsv
for path in _download_files/*
do
file=`echo -n $path | sed -e "s/_download_files\///"`
echo -n $file >> file_uses.tsv
grep -i $file _wiki/* | wc -l >> file_uses.tsv
done
