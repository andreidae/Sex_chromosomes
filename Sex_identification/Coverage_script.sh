## $1 Autosomes.bed
## $2 Satsumaname
## $3 X_trim.bed
## $4 Output_folder

for file in *_1.bam
do
samtools depth -a -q 25 -Q 25 -b $1 $file  > $4/$file"_"$2_Autosomes.txt
samtools depth -a -q 25 -Q 25 -b $3 $file  > $4/$file"_"$2_X_trim.txt
for num in {1..10}
do
shuf -n10000000 $4/$file"_"$2_Autosomes.txt | awk '{sum=sum+$3}END{print sum/10000000}' >> $4/$file"_"$2_Autosomes_bootstrap.txt
shuf -n10000000 $4/$file"_"$2_X_trim.txt | awk '{sum=sum+$3}END{print sum/10000000}' >> $4/$file"_"$2_X_trim_bootstrap.txt
done
paste $4/$file"_"$2_Autosomes_bootstrap.txt $4/$file"_"$2_X_trim_bootstrap.txt | awk  '{print $2/$1}' > $4/$file"_"$2_ratios.txt
rm $4/$file"_"$2_Autosomes.txt $4/$file"_"$2_X_trim.txt
done

