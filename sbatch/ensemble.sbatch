#!/bin/bash

#SBATCH --job-name=short_densenet_ensemble_DarthJarJar

#SBATCH --output=/home/kmcgraw/%j.out
#SBATCH --error=/home/kmcgraw/%j.err

#SBATCH -A CS156b

# can set to 8 to 10 hours to start to test
#SBATCH -t 40:00:00

# change if we use multiple srun tasks
#SBATCH --ntasks=1

# tune this if we use matlab or mathematica or r
#SBATCH --cpus-per-task=28

# bump this up if we start running out of memory
#SBATCH --mem=128G

# definitely want to use GPU acceleration of whatever library we do
#SBATCH --gres=gpu:1

#SBATCH --mail-user=kmcgraw@caltech.edu

#SBATCH--mail-type=BEGIN
#SBATCH--mail-type=END
#SBATCH--mail-type=FAIL

module load cuda/10.2

source /home/kmcgraw/venv/bin/activate

python /home/kmcgraw/CS156b/scripts/ensemble.py densenet MSE 100
