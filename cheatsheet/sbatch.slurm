#!/bin/bash

#SBATCH --job-name=<name>
#SBATCH --mail-type=<status>
#SBATCH --mail-user=<email>

#SBATCH --account=<lab>
#SBATCH --partition=<node_type>
#SBATCH --nodes=<num_nodes>
#SBATCH --ntasks-per-node=<cores_per_node>
#SBATCH --cpus-per-task=<cpus_per_task>
#SBATCH --mem=<size[unit]>
#SBATCH --gpus=<type:quantity> 
#SBATCH --time=<time> # Max runtime in DD-HH:MM:SS format.

#SBATCH --chdir=<working directory>
#SBATCH --export=all
#SBATCH --output=<file> # where STDOUT goes
#SBATCH --error=<file> # where STDERR goes

# Modules to use (optional).
<e.g., module load apptainer>

# Your programs to run.
<my_programs>
