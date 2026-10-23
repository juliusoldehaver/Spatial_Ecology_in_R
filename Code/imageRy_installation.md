# Remote sensing for ecosystems

## Installation of the imageRy package from github

In order to install packages from GitHub you need to use a function coming out from the remote package.

Hence:
+ install the remote package
+ install imageRy

### 1. Install remotes
```
install.packages("remotes")
```

### 2. Install imageRy from GitHub
```
library(remotes)
install_github("ducciorocchini/imageRy")
```

During the installation do not update previous packages (just pressing enter)

Write:
```
library(imageRy)
```
to check that the package has been properly installed.
