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

`code/03_models.R`
- reads cleaned dataset saved by `code/00_clean_data.R`
- investigates the generalized linear regression model to explore the association between `price` and `cut`, `carat`, and `table`.
- investigates the logistic linear regression model to explore the association between `price_cat` and `cut`, `color`, and `clarity`.
- creates descriptive tables for regression models mentioned above including test statistics and p-values.
- saves regression models and descriptive tables as a `.rds` object in `output/` folder

`report_diamond_prize.Rmd`
- loads cleaned dataset
- loads each set of code saved by several `.R` scripts such as table1, scatter plot, regression models and descriptive tables
- generates the introduction of the dataset and description of the project