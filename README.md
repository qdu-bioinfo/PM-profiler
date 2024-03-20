# PM-profiler

# Introduction

# System Requirement and Dependency
## Hardware Requirements
PMS only requires a standard computer with sufficient RAM to support the operations defined by a user. For typical users, this would be a computer with about 2 GB of RAM. For optimal performance, we recommend a computer with the following specs:
	
	RAM: 8+ GB
	CPU: 4+ cores, 3.3+ GHz/core
    
## Software Requirements

OpenMP library is the C/C++ parallel computing library. Most Linux releases have OpenMP already been installed in the system. In Mac OS X, to install the compiler that supports OpenMP, we recommend using the Homebrew package manager:

	brew install gcc
 
## Automatic installation (recommended)

PM-profiler provides a fully automatic installer for easy installation.

#### **a. Download the package**

git clone https://github.com/qdu-bioinfo/PM-profiler.git

#### **b. Install by installer**

	
	cd PM-profiler
	source install.sh

a. Extract the package:

	tar -xzvf PM-profiler.tar.gz

b. Install
	
	cd PM-profiler
	source install.sh

##### Tips for the Automatic installation

1. Please **“cd PM-profiler”** before run the automatic installer.
2. The automatic installer only configures the environment variables to the default configuration files of “\~/.bashrc” or “\~/.bash_profile”. If you want to configure the environment variables to other configuration file please use the manual installation.
3. If the automatic installer failed, PM-profiler can still be installed manually by the following steps.

# Manual installation

If the automatic installer failed, PM-profiler can still be installed manually.

a. Extract the package:

	tar –xzvf PM-profiler.tar.gz

b. Configure the environment variables (default environment variable configuration file is located at “\~/.bashrc” or “\~/.bash_profile”)

	export PMprofiler=Path to PM-profiler
	export PATH="$PATH:$PMprofiler/bin"
    
c. Then, active the environment variables

	source ~/.bashrc

d. Compile the source code:

	cd PM-profiler
	make

# Typical Usages
PM-profiler is available via terminal either locally or remotely. Please run

	PM-pipeline -h

to check the parameters of the automatic pipeline.


