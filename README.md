# Code Description

`code/00_clean_data.R`
- cleans and labels variables
- creates a new dichotomy variable called `price_cat` to represent price larger or less than $2401 
- saves cleaned dataset as a `.rds` object in `output/` folder

`code/01_make_table1.R`
- reads cleaned dataset saved by `code/00_clean_data.R`
- generates a descriptive table for `cut`, `table`, `carat` classified by `price_cat`
- saves table_one as a `.rds` object in `output/` folder

`code/02_make_scatter.R`
- reads cleaned dataset saved by `code/00_clean_data.R`
- generates a scatter plot for `carat` and`price_cat` to observe the relationship primarily
- saves the scatter plot as a `.rds` object in `output/` folder


`report_diamond_prize.Rmd`
- loads cleaned dataset
- loads each set of code saved by several `.R` scripts such as table1, scatter plot, regression models and descriptive tables
- generates the introduction of the dataset and description of the project!



How to synchronize your package repository:

1. In an R console, use `getwd` and `setwd` to confirm that the working directory is the project directory.

2. Use `renv::restore()` to synchronize the project library.
	- This likely will involve my (automatically) installing packages to the project library.
	
	
Makefile description:

make clean: remove files
make install: install packages needed in the project
make final_report/report_diamond_prize.html: run the docker image hanxu1204/project_image3
