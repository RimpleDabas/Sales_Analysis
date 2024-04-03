# Sales Analysis
The ultimate goal of this project is to create PowerBI dashboard.

## Steps 
The first step involved was to extraxt and clean the datatset. This was doone using Python and SQL. Refer here for [cleaning](https://github.com/RimpleDabas/Sales_Analysis/blob/main/Sales_cleaning.ipynb) steps.Exploratory data analysis was done in Python to get some insights. For eg. Sunburst chart below shows the best performing regions yearwise .![](Images\Sunburst.png)

Database was created using MYSQL Server and queriws were fired to get few analytical points. These queries can be referred in this [file](https://github.com/RimpleDabas/Sales_Analysis/blob/main/SQL_queries.sql)

Finally data was imported inot Power BI using SQL server import method and report was dahboard was created using PowerBI Deskptop and published to PowerBI service. Dashboard allows users to :
 *  Shift between two tabs Home and Best/Worst performances based on the revenue
 * Filter the results based on the year and State
 * Bar and Pie charts interactive buttons to visualize Top and bottom States based on revenue

 * Bar and Pie charts interactive buttons to visualize Top and bottom 5 sub-categories based on revenue

* Bar and Pie charts interactive buttons to visualize Top and bottom 5 sub-categories based on the number of orders

* Drill through the details based on the regions ,states ,segments and Sub categories

The .pbix [file](https://github.com/RimpleDabas/Sales_Analysis/blob/main/Sales_dashboard.pbix) is here for the refrence

![](Images\Dashboard.png)





