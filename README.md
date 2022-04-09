# Asthma

## Overview 

This repository describes the steps needed to reprodcue all the analysis in "Network Dynamics of the Immune System explains Asthma Heterogeneity", Vrushali D. Fangal *et al.*<br/>
For questions, please contact Vrushali Dipak Fangal - vrf214@g.harvard.edu

## Create conda environment
```
conda create --name rudra python=3.6.4
- conda install python=3.6.4
- conda install -c conda-forge xmltodict
- pip install bioservices
- conda install -c anaconda biopython
- conda install -c anaconda reportlab
```
OR
```
conda env create -f rudra_environment.yml
```
### Activate conda environment
conda activate rudra

## Install R libraries

1. Install Limma
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("limma")
```

2. Install BoolNet
```
install.packages("BoolNet") 
```
**Note: Please refer to BoolNet documentation here :https://sysbio.uni-ulm.de/?Software:BoolNet for simulations with demos and documentation.**

3. Install Biobase
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Biobase")
```

# Installation  
  
Clone the repo  
  
```  
cd $PATH  
https://github.com/CDNMBioinformatics/Asthma-Heterogeneity
```  
 
The source code will be in the directory `$PATH/Asthma-Heterogeneity`   

The source code is now installed. 
  

