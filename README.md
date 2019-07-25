# VariantProcessing

VariantProccessing 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Bedtools: 

For Fedroa 13, 14 and EPEL5/6 users, run the following command line command:
```
$ yum install BEDTools
```
For Debian/Ubuntu users:
```
$ apt-get install bedtools
```
For OSX users with Homebrew installed:
```
$ brew tap homebrew/science
$ brew install bedtools
```
Or alternatively wiht the MacPort system:
```
$ port install bedtools
```

BedOPS:
(For troubleshooting tips, refer to [BedOPS](https://bedops.readthedocs.io/en/latest/content/installation.html#via-source-code)
Linux systems:
BedOPS required GCC 4.8.2 which allows support of C++11 features that is used by BedOPS
You can check the version of your GCC with 
```
$ gcc --version
```
If you have a compiler older than 4.8.2, use your preferred package manager to upgrade/install 4.8.2
ie. (Ubuntu)
```
$ sudo apt-get install gcc-4.8
$ sudo apt-get install g++-4.8
$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
$ sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50
```
Some static libraries may also need to be installed:
ie. (CentOS or RH-like environment)
```
$ sudo yum install libstdc++-static
$ sudo yum install glibc-static
```
or Ubuntu:
```
$ sudo apt-get install libc6-dev
$ sudo apt-get install build-essentials
```
Next, install a git client of your choice if you do not already have one installed

Then, clone the BedOPS Git repository:
```
$ git clone https://github.com/bedops/bedops.git
```
Then go into the top-level of the local copy of the repository and run the following:
```
$ cd bedops
$ make
```
Then once it has been build, install the compiled binaries and scripts to a local bin directory:
```
$ make install
```

Finally, copy the extracted binaries to a location of your choice:
```$ cp bin/* /user/local/bin
```

Mac OSX:

Manual compilation:
Check if you have Clang/LLVM 3.5 or grater installed:
```
$ clang -v
```
It is also recommended to install Apple Xcode and Command Line Tools (Preferences->Downloads options in Xcode)

Install a git client of your choice if you do not have one installed

Clone the git repository in an appropriate local direcctory:
```
$ git clone https://github.com/bedops/bedops.git
```

Run make in the loccal copy of the repository:
```
$ cd bedops
$ make
```
Next, run:
```
$ make install
```
Then copy the extracted binaries to a location of your choice:
```
$ cp bin/* /usr/local/bin
```

Bioconda:

Install the Miniconda package from [Conda's website](http://conda.pydata.org/miniconda.html)

Add the Conda channels for Bioconda if you have not already:
```
$ (conda config --add channels r)
$ conda config --add channels defaults
$ conda config --add channels conda-forge
$ conda config --add channels bioconda
```

Install the BedOPS package:
```
$ conda install bedops
```

Homebrew:

Ensure you have Clang/LLVM 3.5 or greater installed:
```
$ clang -v
```
### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [RStudio](https://www.rstudio.com)- The IDE used

## Contributing

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Dr Anindya Dutta for providing the opportunity to work in his laboratory 
* Ajay Chatrath for his mentorship and providing all the data and any insight for this package
