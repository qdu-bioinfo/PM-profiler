# PM-profiler

## Introduction
PM-profiler is a sequence annotation tool for amplicon metagenomic short reads. It implements an extremely rapid taxonomy annotation algorithm, swiftly searching the database for all the most similar sequences, and annotating the results with the Highest Weight Leaf (HWL) and the Lowest Common Ancestor (LCA). PM-profiler is optimized through parallel computing, enabling it to rapidly process large datasets. 
We recommend that you read the following before using it.
## System Requirement and Dependency
### Hardware Requirements
PMS only requires a standard computer with sufficient RAM to support the operations defined by a user. For typical users, this would be a computer with about 8 GB of RAM. For optimal performance, we recommend a computer with the following specs:
```	
	RAM: 8+ GB
	CPU: 4+ cores, 3.3+ GHz/core
```    
### Software Requirements

OpenMP library is the C/C++ parallel computing library. Most Linux releases have OpenMP already been installed in the system. In Mac OS X, to install the compiler that supports OpenMP, we recommend using the Homebrew package manager:
```
	brew install gcc
```
To ensure software compatibility, the compiler must support the C++11 standard. Please make sure the version of GCC installed supports C++11 (GCC version 4.8.1 and above). Installing GCC via the above Homebrew command typically provides the latest version of GCC, which meets the support requirement for C++11.
### Automatic installation (recommended)

PM-profiler provides a fully automatic installer for easy installation.

#### **a. Download the package**
```
	wget https://github.com/qdu-bioinfo/PM-profiler/releases/download/v1.0.0/PM-profiler.tar.gz
	tar -xzvf PM-profiler.tar.gz
```
#### **b. Install by installer**
```
	cd PM-profiler
	source install.sh
```
#### Tips for the Automatic installation

1. Please **“cd PM-profiler”** before run the automatic installer.
2. If the automatic installer failed, PM-profiler can still be installed manually by the following steps.

### Manual installation

If the automatic installer failed, PM-profiler can still be installed manually.

a. Extract the package:
```
	tar –xzvf PM-profiler.tar.gz
```
b. Compile the source code:
```
	cd PM-profiler
	make
	tar -xzvf ./database/Greengenes2.tar.gz -C ./database
	tar -xzvf ./database/Refseq.tar.gz -C ./database
```
## Typical Usages
PM-profiler is available via terminal either locally or remotely. Please run
```
	PM-profiler -h
```
to check the parameters of PM-profiler.
### Example Command
In the example below,PM-profiler will annotate the sequences in query.fasta based on database.fa and taxonomy.txt, writing the results into output.hwl.txt.
```
	PM-profiler -i query.fasta -d database.fa -m taxonomy.txt -o output
```
 Additionally, PM-profiler offers several parameters for more detailed sequence annotation. You can use the ```-M 1``` parameter to output files annotated with LCA. Adjust the sequence similarity threshold and HWL's Taxonomy Consistency threshold using the ```-c``` and ```-s``` commands. If you need the unprocessed annotation results, you can also output the raw annotation files using the hidden parameter ```-R t```.
### Example data in the package
The PM-profiler package includes a demo dataset of human gut microbiomes with 16S rRNA V4 amplicon-based microbiomes. To run the demo, you can
```
	cd example
	bash Readme
```
then the results will be saved in the PM-profiler/example folder under output.hwl.txt and output.lca.txt, where the results for the highest weight leaf node (hwl) will be saved in output.hwl.txt, and the results for the lowest common ancestor will be saved in output.lca.txt.
### Output
PM-profiler supports outputting both HWL and LCA annotations simultaneously, with the results of the two annotations as follows:
```
HWL output
Query sequence id	Database sequence id 	Taxonomy	Consistency
GCF_008572145.1_ASM857214v1_genomic_64_0_2086_site:_3156_10	GCF_003464725.1_1	k__Bacteria; p__Bacteroidetes; c__Bacteroidia; o__Bacteroidales; f__Bacteroidaceae; g__Phocaeicola; s__Phocaeicola_dorei;	0.733333
```
```
LCA output
Query sequence id	Consistency
GCF_004347525.1_ASM434752v1_genomic_10_0_2016_site:_4430_58	k__Bacteria;	p__Bacteroidetes;	c__Bacteroidia;	o__Bacteroidales;	f__Bacteroidaceae;	g__Phocaeicola;	s__Phocaeicola_dorei;
```
For HWL output, PM-profiler outputs the annotation with the highest Consistency and a database sequence that possesses this annotation.
For LCA, PM-profiler only outputs the annotation and does not output the consistency (all are 1).
## Contact

Any problem please contact QDU_bioinfo team
```
	QDU_bioinfo	qdu_bioinfo@163.com
	Shi Haobo	18339183978@163.com
```
