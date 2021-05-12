# Research Project (2018-2019)

This repository contains my research project from 2018 to 2019.

## Purpose

The upload of this project serves two purposes:

1.  To be an easy to browse location of my research project to share in the future, and
2.  To preserve my work, because I find myself always relearning the lesson of backing up my files when I don't have a complete backup.

## Description

This computational mathematical physics research project was completed between 2019-2019 and was done to fulfill a physics research project for credit.  This research project also satisfied the Honors Thesis requirement for the Honors College, which culimated with an in-person presentation.

The research project is titled, "Classification of Pseudo-cuspidal Points for Integrable Systems with Delta-Potential," and the abstract is as follows (with some loss of LaTeX math formatting):

> For exactly solvable quantum integrable systems with delta potential, we use the language of kaleidoscopes to classify the fully determined stable solutions, which we call pseudo-cupsidal points, for any finite Coxeter group *G*, using an algorithm. The algorithm is written in SageMath and the pseudo-cupsidal points for Coxeter group types *A<sub>1</sub>*, *C<sub>2</sub>*, and *F<sub>4</sub>* are classified as test cases for the algorithm.

### The Time Capsule Nature of This Project

This research project was completed at the end of May 2019.  Since then, many aspects of the software used have changed:

* Python 3 has been fully adopted and Python 2 has been deprecated (at least for "modern" scripting purposes).  (I've heard the transition from Python 3 to 4 won't be like the transition from 2 to 3, but I'll worry about that when I arrived to that bridge.)
* Due to this, SageMath has fully migrated to Python 3 during this time.

Therefore, I have created 2 versions of my undergraduate research project:

* the "Original" version is contained in the `Original` directory and contains all of my research project files in the exact state I turned in my project on May 24, 2019 (except for the original Sage Object `.sobj` for F4); and
* the "Current" version is located in the `Current` directory and has edited all of `print` statements written in Python 2 syntax so that now they read as Python 3 `print()` functions in the Sage script.  Ignoring all corresponding changes from Python 2 to 3 in the LaTeX writeup, the content of the project writeup is identical to the writeup from May 2019.  Hopefully, I won't have to make any more Sage/Python changes in the future.

### What I Learned (Not a Comprehensive List)

* SSH (to remotely execute the Sage script and leave it running with `screen`) 
* SSHFS (to transfer files between a remote server)
* Git version control (on Keybase)
* LaTeX (BibTeX and bibliography styles, custom commands, nonbreaking spaces with `~`, and more)
* how to read scientific papers

"How to read scientific papers" requires some elaboration: although it is more of an art than a scientific procedure or reproducible algorithm, I learned reading scientific papers is so much easier when you have a clear motive or purpose and actionable goals when weeding the important details from the unimportant details while reading.

* Most of all, I learned how to learn long-term physics - which is drastically different than taking semester-long physics classes.

## Requirements to Run the SageMath Script

I am explaining this as if I am talking about the research project to another STEM college friend, who doesn't know the literal research topic I have learned but is certainly capable of understanding the underlying mathematics.

* SageMath (readily available in nearly all Linux distros - just don't use the non-LTS latest point release of Ubuntu, since SageMath may not be available immediately after the most current point release date)
* Linux (makes installing and using SageMath a breeze, just like LaTeX - you can stll use Windows or MacOS, but it's much more of a hassle)
* 1 instance of the Terminal emulator for executing 1 Sage script

## Instructions

For the small number of readers who are interested in executing the SageMath script yourself to see how it works (such as to rewrite the script in another language like Haskell or Lisp, among other motives), here are the instructions:

1.  To run the script, edit Line 1 of the script to input the desired finite Coxeter group and the last line to change the name of the result Sage Object file as the output.
2.  Run the script with:
```
$ sage <coxeter-group>.sage
```
3.  The Sage script will generate a Sage object (of the `.sobj` format) of your choosing, corresponding `<coxeter-group.sage.py>` Python file.

### Comment for Instructions

Don't try to run the `<coxeter-group>.sage.py` script with Python!  Unless you've done prior set up to do so, that way will be a little more involved.  For example:
```
$ python <coxeter-group>.sage.py
```

This is because Python requires the SageMath library to be imported and thus doesn't "know" SageMath by default.  I believe it would require prefixing the Sage script with 1-line to run the Sage script in plain Python (back in 2019), but it can be avoided by simply using `sage` to execute the script.

Since the SageMath migration to Python 3, I think Sage's default behavior is to add this import preamble to the corresponding `.py` file that is automatically generated, but that seems to be an improvement added to Sage since May 2019 - using `sage` to execute `.sage` scripts will always work.

### Note for Windows Users and WSL

For Windows 10 users who can't realistically install Linux on another machine and truly need to get work as done as fast as possible, the most economical way to use SageMath on Windows is to simply install the WSL (Windows Subsystem for Linux).  With your favorite search engine, you may find plenty of guides on how to do this online.

As a suggestion, the Debian Stable WSL should suffice and feels snappier than the Ubuntu LTS WSL.  Anyways, the Debian Stable WSL should have a version of SageMath, though not the latest, that will be more than sufficient to run this SageMath script.  The latest version is not required to do mathematics with Coxeter groups.

I only realized this after the research project was done.  However, there also must have been some sort of WSL availability aspect at the time, since I do not recall being able to install the WSL until later in the summer of 2019.

### Ballpark Benchmarks for Script Runtime

(To be added...)

## Other Remarks for the Future

* I would not use `algorithm2e` as a pseudocode environment in LaTeX again if I had to do another research project for long pseudocode sections that spill onto new pages.  This is because I found myself manually breaking pseudo sections by hand in order to avoid running pseudocode off the page in LaTeX - this is not a very extensible manner of doing things.  I invest time in the future to learn how to use pseudocode environment that can handle page breaks much better.
* I would use a LaTeX package, such as TikZ, to draw high quality figures for future research projects in the future.  (However, my advisor was quite pleased with how the hand-drawn figures turned out.)
* Lastly, I would probably learn how to use Beamer to make presentation slides in LaTeX for the future.  I found out that I didn't need to for my research project presentation, but I know learning Beamer is inevitable down the road.

## License

(The SageMath scripts are licensed under GPLv3, but I'll write the rest later...)
