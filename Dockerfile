# Dockerfile for multiqc
# https://multiqc.info/
FROM continuumio/miniconda3

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet -f /environment.yml && conda clean -a

# The conda bug with tbb - salmon: error while loading shared libraries: libtbb.so.2
# pandoc via conda was not working
RUN apt-get update && apt-get install -y libtbb2 pandoc-citeproc

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/multiqc-1.8/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name multiqc-1.8> multiqc-1.8.yml
