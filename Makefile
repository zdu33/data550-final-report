output/data_clean.rds: code/00_clean_data.R data/Impact_of_Remote_Work_on_Mental_Health.csv
	Rscript code/00_clean_data.R
	
tables: code/01_make_tables.R output/data_clean.rds
	Rscript code/01_make_tables.R 

figures: code/02_make_figures.R output/data_clean.rds
	Rscript code/02_make_figures.R


report.html: code/03_render_report.R output/data_clean.rds tables figures report.Rmd
	Rscript code/03_render_report.R
		
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html