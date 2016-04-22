import sys
import MySQLdb
from .queries import *
connection = MySQLdb.connect(user='groupr', passwd='grouprsp16', db='grouprsp_cs411');



#input desired language
#(languageStr: languages seperated by comma)
def insertDesiredLanguage (netID, languageStr):
	languageList = languageStr.split(",");
	for s in languageList:
		query = "insert into LanguagesDesired (netId, languageName) values ('" + netID + "'," + "'"+s+"'" + ")";
		cursor = connection.cursor();
		cursor.execute(query);



#delete desired language
#(languageStr: languages seperated by comma)
def deleteDesiredLanguage (netID, languageStr):
	languageList = languageStr.split(",");
	for s in languageList:
		query = "delete from LanguagesDesired where netId = " + "'" + netID + "'" + "AND " + "languageName = " + "'" + s + "'";
		cursor = connection.cursor();
		cursor.execute(query);



#input known language input
#(languageStr: languages seperated by comma)
def insertKnownLanguage (netID, languageStr):
	languageList = languageStr.split(",");
	for s in languageList:
		query = "insert into LanguagesKnown (netId, languageName) values ('" + netID + "'," + "'"+s+"'" + ")";
		cursor = connection.cursor();
		cursor.execute(query);



#delete known language
#(languageStr: languages seperated by comma)
def deleteKnownLanguage (netID, languageStr):
	languageList = languageStr.split(",");
	for s in languageList:
		query = "delete from LanguagesKnown where netId = " + "'" + netID + "'" + "AND " + "languageName = " + "'" + s + "'";
		cursor = connection.cursor();
		cursor.execute(query);


#Search based on desired languages then return list of netIDs
#create a view named "myId__desired_people" 
#return dict representing the result view
def searchByDesiredLanguage (myId):
	viewName = myId + "_desired_people";
	drop_query = "DROP VIEW IF EXISTS " + viewName
	cursor = connection.cursor();
	cursor.execute(drop_query);
	search_query = "create view " + viewName + " as SELECT netId FROM LanguagesKnown WHERE languageName in (SELECT languageName FROM LanguagesDesired where netId = " + "'" + myId + "'" + ") GROUP BY netId ORDER BY COUNT(*) DESC";
	print(search_query)
	cursor = connection.cursor();
	cursor.execute(search_query);
	resultQuery = "select * from " + viewName;
	result = cursor.execute(resultQuery);
	cursor = connection.cursor();
	cursor.execute(drop_query);

	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]


#Test insert and delete
"""
insertDesiredLanguage ('jackma', 'java,python,c++');
deleteDesiredLanguage ('jackma', 'java');
"""


# insertDesiredLanguage ('larry', 'assembly');

# #Test search by language desired
# result = searchByDesiredLanguage ('larry');
# print (result);

"""
IF EXISTS(select * FROM sys.views where name = '" + viewName + "')" + " drop view " + viewName;
"""

