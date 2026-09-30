awk -F'\t' '$3=="G"{print FILENAME,$0}' *file.txt
# this awk command takes wildcard files and looks to see if column 3 is a perfect match for "G", then prints the lines along with the filename first
