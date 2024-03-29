# PM-profiler

## Introduction

### System Requirement and Dependency
#### Hardware Requirements
PMS only requires a standard computer with sufficient RAM to support the operations defined by a user. For typical users, this would be a computer with about 2 GB of RAM. For optimal performance, we recommend a computer with the following specs:
	
	RAM: 8+ GB
	CPU: 4+ cores, 3.3+ GHz/core
    
#### Software Requirements

OpenMP library is the C/C++ parallel computing library. Most Linux releases have OpenMP already been installed in the system. In Mac OS X, to install the compiler that supports OpenMP, we recommend using the Homebrew package manager:
```
	brew install gcc
``` 
#### Automatic installation (recommended)

PM-profiler provides a fully automatic installer for easy installation.

##### **a. Download the package**
```
	git clone https://github.com/qdu-bioinfo/PM-profiler.git
```
##### **b. Install by installer**
```
	cd PM-profiler
	source install.sh
```
If you are unable to clone directly, try downloading and unzipping from the release directly.
##### **a. Download the package**
```
	wget https://github.com/qdu-bioinfo/PM-profiler/archive/v1.0.0/PM-profiler.tar.gz
	tar -xzvf PM-profiler.tar.gz
```
##### **b. Install by installer**
```
	cd PM-profiler
	source install.sh
```
##### Tips for the Automatic installation

1. Please **“cd PM-profiler”** before run the automatic installer.
2. The automatic installer only configures the environment variables to the default configuration files of “\~/.bashrc” or “\~/.bash_profile”. If you want to configure the environment variables to other configuration file please use the manual installation.
3. If the automatic installer failed, PM-profiler can still be installed manually by the following steps.

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
```
## Typical Usages
PM-profiler is available via terminal either locally or remotely. Please run
```
	PM-profiler -h
```
to check the parameters of the automatic pipeline.
### Example
In the example below,PM-profiler will annotate the sequences in query.fasta based on database.fa and taxonomy.txt, writing the results into output.hwl.txt.
```
	PM-profiler -i query.fasta -d database.fa  -m taxonomy.txt -o output
```
 Additionally, PM-profiler offers several parameters for more detailed sequence annotation. You can use the ```-M 1``` parameter to output files annotated with LCA. Adjust the sequence similarity threshold and HWL's Taxonomy Consistency threshold using the ```-c``` and ```-s``` commands. If you need the unprocessed annotation results, you can also output the raw annotation files using the hidden parameter ```-R t```.
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
