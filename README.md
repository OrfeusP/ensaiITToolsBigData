# ensaiITToolsBigData
# Initialization
## Load Data to HDFS
After uploading the folder with the files to the Hortonworks's Sandbox run the following command to load the data to the HDFS under admin user. 
```
    hdfs dfs -put /path/to/data/dir /user/admin/
```
## Create Hive Table
To create the Parquet Table via command line execute the following command  
```
hive -f load_data.hql
```
or use Hive View's UI provided by Ambari. 

# Visualizations Proposed 

* The first visualization presents the average price of the different types of gas thought the examined period, providing an general overview of the data.
* The second visualization shows the evolution of the price per gas type for a period of one month.
* The third one shows the average price of each gas type depending on the population that lives near the gas stations.

# Problems Encountared
I trying to implement the bonuses but I came accross multiple problems.

* As far loading directly from the .xml files I tried to do it with multiple ways but none seemed to work. I either got an error( usually memory limitations) or when I didn't got errors in the load procedure I wasn't able to use the table (error on SELECT command).
An example of the code I used is given below.
```
drop table xml_table_org;
drop table xml_table;

create external table xml_table_org( xmldata string) 
LOCATION '/user/admin/data';
select * from xml_table_org;

CREATE TABLE xml_table 
AS SELECT xpath_int(xmldata,'pvd/adresse'),
			xpath_string(xmldata,'pdv/ville'),
			xpath_string(xmldata,'pvd/@id') 
FROM xml_table_org;

select * from xml_table;
```  

* As for the oozie process, in the not_working folder you may find the files for the workflow. Unfortunately I could make the work because no matter the configuration I wasn't able to find the correct ports and when I executed the oozie command to add the workflow for execution I got "no response"

# Possible Improvements

One necessary improvement is the inclusion of the oozie workflow to automatize the proccess, as well as to add the daily data.