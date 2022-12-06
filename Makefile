report_diamond_prize.html: report_diamond_prize.Rmd code/04_render_report.R output/data_clean.rds output/table_one.rds output/scatterplot.png 
	Rscript code/04_render_report.R

output/data_clean.rds: code/00_clean_data.R output/data_clean.rds
	Rscript code/00_clean_data.R

output/table_one.rds: code/01_make_table1.R output/table_one.rds
	Rscript code/01_make_table1.R

output/scatterplot.png: code/02_make_scatter.R output/scatterplot.png
	Rscript code/02_make_scatter.R
	


.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f report_diamond_prize.html 
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
	
	
projectfiles = report_diamond_prize.Rmd code/04_render_report.R output/data_clean.rds output/table_one.rds output/scatterplot.png 

project_image3: $(projectfiles) $(renvfiles) $(Dockerfile)
	docker build -t project_image3 .
	docker tag project_image3 hanxu1204/project_image3
	touch $@
	
final_report/report_diamond_prize.html:
	docker run -v "/$$(pwd)/final_report":/project/final_report hanxu1204/project_image3
	
	