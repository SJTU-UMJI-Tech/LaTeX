# LaTeX Lecture

This is a beamer slide for LaTeX lecture in JI.

The built PDF are saved in the `build` directory.

[The old version](https://github.com/SJTU-UMJI-Tech/LaTeX/raw/master/lecture_old_version.pdf)

## Development

### Requirements
xelatex (shipped with modern LaTeX distributions)  
GNU make (make on Linux/OS X, or mingw-make on Windows)  
Python library pygments (display source code elegantly)

### Compile with Makefile

#### On Windows
Install mingw and add it to the PATH.  
run `mingw32-make` in bash (git bash recommended) to generate pdf files

#### On Linux and Mac OS
run `make` to generate pdf files

### Compile tex file directly
`-shell-escape` option must be added (a requirement of the minted package)
