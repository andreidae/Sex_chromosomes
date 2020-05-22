# Sex_chromosomes


## 1. Use Satsuma to align sex chromosomes to the reference genome
Satsuma is a tool that reliably aligns large and complex DNA sequences providing maximum sensitivity (to find all there is to find), specificity (to only find real homology) and speed (to accommodate the billions of base pairs of vertebrate genomes). Satsuma addresses these three issues through novel strategies: (i) cross-correlation, implemented via fast Fourier transform; (ii) a match scoring scheme that eliminates almost all false hits; and (iii) an asynchronous ‘battleship’-like search that allows for aligning two entire fish genomes (470 and 217 Mb) in 120 CPU hours using 15 processors on a single machine. Satsuma is part of the Spines software package, implemented in C++ on Linux. The latest version of Spines can be freely downloaded under the LGPL license here.

Grabherr, MG et al. (2011) Genome-wide synteny through highly sensitive sequence alignment: Satsuma. Bioinformatics. 2010 May 1;26(9):1145-51.
Satsuma 

## 2. Read manual
http://satsuma.sourceforge.net/manual.html

## 3. Run SatsumaSynteny.sh. Some information to help you setting up your run:

##################################################################

 -q : query fasta sequence
 
 -t : target fasta sequence
 
 -o : output directory
 
 -l : minimum alignment length (def=0)
 
 -t_chunk : target chunk size (def=4096)
 
 -q_chunk : query chunk size (def=4096)
 
 -t_chunk_seed : target chunk size (seed) (def=8192)
 
 -q_chunk_seed : query chunk size (seed) (def=8192)
 
 -n : number of CPUs (def=1)
 
 -ni : number of initial search blocks (def=-1)
 
 -lsf : submit jobs to LSF (def=0)
 
 -nosubmit : do not run jobs (def=0)
 
 -nowait : do not wait for jobs (def=0)
 
 -chain_only : only chain the matches (def=0)
 
 -refine_only : only refine the matches (def=0)
 
 -min_prob : minimum probability to keep match (def=0.99999)
 
 -proteins : align in protein space (def=0)
 
 -cutoff : signal cutoff (def=1.8)
 
 -cutoff : signal cutoff (seed) (def=3)
 
 -m : number of jobs per block (def=8)
 
 -resume : resumes w/ the output of a previous run (xcorr*data) (def=)
 
 -seed : loads seeds and runs from there (xcorr*data) (def=)
 
 -pixel : number of blocks per pixel (def=24)
 
 -nofilter : do not pre-filter seeds (slower runtime) (def=0)
 
 –dups : allow for duplications in the query sequence (def=0)
 
########################################################################

SatsumaSynteny.sh script only uses 

-- 1 - Threads or number of CPUs

-- 2 - Query sequence (genome of interest)

-- 3 - Target sequence (Chromosomes)

-- 4 - Output_directory

-m 1 -n $1 -q $2 -t $3 -o $4



## 4. To analyze and visualize final results
File output_directory/satsuma_summary.chained.out contains the final coordinates:

<outdir>/satsuma_summary.out: all alignment coordinates (Satsuma only)
<outdir>/satsuma_summary.refined.out: final coordinates (Satsuma and SatsumaSynteny)


Contents:

*Target sequence name (provided by fasta)

*First target base

*Last target base

*Query sequence name (provided by fasta)

*First query base

*Last query base

*Identity

*Orientation


EXAMPLE:

chrX 5947 6164 chrX 9153 9360 0.626728 +

chrX 6270 6452 chrX 9472 9654 0.576923 +



## 5. Visualization

Use ./MicroSyntenyPlot –i <satsuma_summary.txt> to create a postscript dot plot (color coded by target chromosomes).

Use ./ChromosomePaint to create a postscript file that colors chromosomes by color.

Use ./BlockDisplaySatsuma to create a file that can be shown in the interactive multi-level synteny browser MizBee.

