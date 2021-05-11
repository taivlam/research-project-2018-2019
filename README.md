# Research Project (2018-2019)

Research Project from 2018-2019.

(I will add a tiny bit more to describe the project and presentation...)

The upload of this project serves two purposes:

1.  To be an easy to browse location of my research project to share in the future, and
2.  To preserve my work, because I find myself relearning the lesson of backing up my files when I don't have a complete backup.

## Requirements

* SageMath (readily available in nearly all Linux distros - just don't use the non-LTS latest point release of Ubuntu, since SageMath may not be available immiediately after the most current point release date)
* Linux (makes installing and using SageMath a breeze, just like LaTeX)
* 1 instance of the Terminal emulator for executing 1 Sage script

## Instructions

1.  To run the script, edit Line 1 of the script to input the desired finite Coxeter group and the last line to change the name of the result Sage Object file as the output.
2.  Run the script with:
```
$ sage <coxeter-group>.sage
```
3.  The Sage script will generate a corresponding `<coxeter-group.sage.py>` Python file.

### Comment for Instructions

Don't try to run the `<coxeter-group>.sage.py` script with Python!  Unless you've done prior set up to do so, that way will be a little more involved.  For example:
```
$ python <coxeter-group>.sage.py
```

This is because Python requires the SageMath library to be imported and thus doesn't "know" SageMath by default.  I believe it would require prefixing the Sage script with 1-line to run the Sage script in plain Python (back in 2019), but it can be avoided by simply using `sage` to execute the script.

Since the SageMath migration to Python 3, I think Sage's default behavior is to add this import preamble to the corresponding `.py` file that is automatically generated, but that seems to be an improvement added to Sage since May 2019 - usiing `sage` to execute `.sage` scripts will always work.

## Other Remarks

* I would not use `algorithm2e` as a pseudocode environment in LaTeX again if I had to do another research project for long pseudocode sections that spill onto new pages.  This is because I found myself manually breaking pseudo sections by hand in order to avoid running pseudocode off the page in LaTeX - this is not a very extensible manner of doing things.  I invest time in the future to learn how to use pseudocode environment that can handle page breaks much better.
* I would use a LaTeX package, such as TikZ, to draw high quality figures for future research projects.  (However, my advisor was quite pleased with how the hand-drawn figures turned out.)
* Lastly, I would probably learn how to use Beamer to make presentation slides in LaTeX for the future.  I found out that I didn't need to for my research project presentation, but I know learning Beamer is inevitable down the road.

## The Time Capsule Nature of This Project

This research project was completed at the end of May 2019.  Since then, many aspects of the software used have changed:

* Python 3 has been fully adopted and Python 2 has been deprecated (at least for "modern" scripting purposes).  (I've heard the transition from Python 3 to 4 won't be like the transition from 2 to 3, but I'll worry about that when I arrived to that bridge.)
* Due to this, SageMath has fully migrated to Python 3 during this time.

Therefore, I have created 2 versions of my undergraduate research project:

* the "Original" version is contained in the `Original` directory and contains all of my research project files in the exact state I turned in my project on May 24, 2019.
* the "Current" version edited all of `print` statements written in Python 2 syntax so that now they read as Python 3 `print()` functions in the Sage script.  Ignoring all corresponding changes from Python 2 to 3 in the LaTeX writeup, the content of the project writeup is identical to the writeup from May 2019.

## License

(The SageMath scripts are licensed under GPLv3, but I'll write the rest later...)