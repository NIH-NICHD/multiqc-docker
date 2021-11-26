# Dockerfile for multiqc
# https://multiqc.info/
FROM continuumio/miniconda3:4.8.2

RUN conda install -c bioconda multiqc=1.8
