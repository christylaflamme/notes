#!/usr/bin/bash
###############
###############
###############

# formatted as generic bash loop on 11/2624
# Christy LaFlamme

###############
# load modules
module load <tool>
###############
###############
###############

# where sampleList is the name of the samples
# where fileList is the name of the files for those samples to perform a function/job on
# note: the sampleList and fileList must be the same size and be ordered the same for this to work properly

readarray -t names < ../sampleList.txt                 # load sample names as numerically indexed array
readarray -t files < ../fileList.txt                    # load bam paths as numerically indexed array

###############
###############
###############
# this is configured for HPCF running on the LSF job system; it will split out the task onto separate jobs for each sample

# loop over index
i=0;                                                                            
for sample in "${names[@]}"; do                                                

        # create objects for sample name and bam path
        sample_name=${names[$i]}
        file_path=${files[$i]}

        # correct end of line character for objects
        sample_name2=$(echo "$sample_name" | sed 's/\r//g')
        # sample_name2= `sed s/^M//g ${sample_name}` # in line replace new line characters with nothing globally
        file_path2=$(echo "$file_path" | sed 's/\r//g')

        # print the name of the sample
        echo ${sample_name2}
        echo ${file_path2}

        # submit each EH command as a separate job on the HPCF; ref genome used is for V4 processing pipeline
        bsub -q <queue> -P <project> -J ${sample_name2}_<project> -R "rusage[mem=10GB]" -eo ${sample_name2}.err -oo ${sample_name2}.out <tool> --reads ${bam_path2}  --argument <input> --output-prefix ${sample_name2};

        # increase index by 1 for next iteration of loop
        let i=i+1                                                          
done
