# estonian_startup_database_analysis
### Analysis of the most extensive source for Estonian startups.


These are the steps I went through during my analysis:

1. PDF to CSV conversion 

Since there was no option to download the datasets in CSV format, I wrote a python script that converted all the pdfs to CSV by using a package called tabula-py. This step was crucial because it allowed me to then import the CSV files to Mysql Workbench for my analysis.

2. SQL analysis 

This step is quite straightforward: I imported all the datasets into SQL. Before doing that, I created a new database, and inside of this database, a new table for each quarter. After importing the CSV in each table, I started querying the database in order to answer some key questions.

3. String to numeric conversion

At this point, I exported the Q1 2022 CSV file and imported it into Python. Here I wrote another script to convert the columns 'Employment_taxes' and 'Turnover' into numerical values. This step was functional for the last visualization task: in order to plot these columns on Tableau, they had to be converted to numerical first.

4. Visualization

As a final step, I imported the converted CSV file to Tableau and was able to create my visualizations.
