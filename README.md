This is a fork from CRAN/BOIN read-only repo.

The goal of this repo is to add/mimic certain functions implemented by the BOIN in the  trialdesign.org but not available in the R CRAN BOIN package yet.

The fork starts with BOIN 2.7.2 in May 2024. 

run the following to install this updated BOIN package.

```r
devtools::install_github("https://github.com/zhaohualu/BOIN")
library(BOIN)
```

Updates:
* Add a logical argument fix13 in get.oc and get.boundary to implement "Modify the decision from de-escalation to stay when observing 1 DLT out of 3 patients".
