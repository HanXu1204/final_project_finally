report_diamond_prize.html: report_diamond_prize.Rmd code/04_render_report.R 
	Rscript code/04_render_report.R

output/data_clean.rds: code/00_clean_data.R output/data_clean.rds
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_make_table1.R output/table_one.rds
	Rscript code/01_make_table1.R

output/scatterplot.png: code/02_make_scatter.R output/scatterplot.png
	Rscript code/02_make_scatter.R
	
output/both_models.rds: code/03_models.R output/both_models.rds
	Rscript code/03_models.R

output/both_regression_tables.rds: code/03_models.R output/both_regression_tables.rds
	Rscript code/03_models.R


.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f report_diamond_prize.html 
	
.PHONY: install
install:
	Rscript -e "renv::restore(promt=FALSE)"