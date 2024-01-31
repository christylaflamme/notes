#!/usr/bin/bash

# 01-31-24
# Christy LaFlamme
# Full run of ExpansionHunter on all samples from WGS DEE trios and SRP148723 (controls) with repeats from epilepsy and candidate gene list
# Created variant catalogue using STRipy catalogue creator

# load modules
module load expansionhunter/5.0.0

# The EH command:
# ExpansionHunter --reads /research_jude/rgs01_jude/groups/meffogrp/projects/meffogrp_auto/common/cab/WGS/MEFFO-DEE-w-Batch08-WGS/SRR7205174_Sample_1/164011857/SRR7205174_Sample_1.marked_dup.recal.bam --reference /research/rgs01/reference/public/genomes/Homo_sapiens/GRCh38/GRCh38_no_alt/GCA_000001405.15_GRCh38_no_alt_analysis_set.fa --variant-catalog variant_catalog_ATXN1.json --output-prefix sample1_ATXN1

readarray -t names < ../sampleList.txt                 # load sample names as numerically indexed array
readarray -t files < ../bamList.txt                    # load bam paths as numerically indexed array

# loop over index
i=0;                                                                            
for sample in "${names[@]}"; do                                                

        # create objects for sample name and bam path
        sample_name=${names[$i]}
        bam_path=${files[$i]}

        # correct end of line character for objects
        sample_name2=$(echo "$sample_name" | sed 's/\r//g')
        # sample_name2= `sed s/^M//g ${sample_name}` # in line replace new line characters with nothing globally
        bam_path2=$(echo "$bam_path" | sed 's/\r//g')

        # print the name of the sample
        echo ${sample_name2}
        echo ${bam_path2}

        # submit each EH command as a separate job on the HPCF
        bsub -q rhel8_standard -P EH -J ${sample_name2}_EH -R "rusage[mem=10GB]" -eo ${sample_name2}.err -oo ${sample_name2}.out ExpansionHunter --reads ${bam_path2} --reference /research/rgs01/reference/public/genomes/Homo_sapiens/GRCh38/GRCh38_no_alt/GCA_000001405.15_GRCh38_no_alt_analysis_set.fa --variant-catalog ../epilepsy_cand_gene_variant_catalog.json --output-prefix ${sample_name2};

        # increase index by 1 for next iteration of loop
        let i=i+1                                                          
done