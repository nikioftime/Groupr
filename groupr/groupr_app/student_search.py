import MySQLdb
from queries import *
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
def searchByDesiredLanguage (myId):
	search_query = "create view " + myId + "_desired_people "  + "as SELECT netId FROM languagesknown WHERE languageName in (SELECT languageName FROM languagesdesired where netId = " + "'" + myId + "'" + ") GROUP BY netId ORDER BY COUNT(*) DESC";
	cursor = connection.cursor();
	cursor.execute(search_query);



#Test search by language desired
"""
searchByDesiredLanguage ('jackma');

"""

#Test insert and delete
"""
insertDesiredLanguage ('jackma', 'java,python,c++');
deleteDesiredLanguage ('jackma', 'java');
insertKnownLanguage ('larry', 'java,python,c++');
deleteKnownLanguage ('larry', 'java');
"""


