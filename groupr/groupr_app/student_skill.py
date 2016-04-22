#======================================================
# Desired and known skills
#======================================================

#input desired skill
#(skillStr: skills seperated by comma)
def insertDesiredSkill (netID, skillStr):
	skillList = skillStr.split(",");
	for s in skillList:
		query = "insert into SkillsDesired (netId, skillName) values ('" + netID + "'," + "'"+s+"'" + ")";
		cursor = connection.cursor();
		cursor.execute(query);


#delete desired skill
#(skillStr: skills seperated by comma)
def deleteDesiredSkill (netID, skillStr):
	skillList = skillStr.split(",");
	for s in skillList:
		query = "delete from SkillsDesired where netId = " + "'" + netID + "'" + "AND " + "skillName = " + "'" + s + "'";
		cursor = connection.cursor();
		cursor.execute(query);


#input known skill input
#(skillStr: skills seperated by comma)
def insertKnownSkill (netID, skillStr):
	skillList = skillStr.split(",");
	for s in skillList:
		query = "insert into SkillsKnown (netId, skillName) values ('" + netID + "'," + "'"+s+"'" + ")";
		cursor = connection.cursor();
		cursor.execute(query);


#delete known skill
#(skillStr: skills seperated by comma)
def deleteKnownSkill (netID, skillStr):
	skillList = skillStr.split(",");
	for s in skillList:
		query = "delete from skillsKnown where netId = " + "'" + netID + "'" + "AND " + "skillName = " + "'" + s + "'";
		cursor = connection.cursor();
		cursor.execute(query);


#Search based on desired skills then return list of netIDs
#create a view named "myId__desired_people_skill" 
#return dict representing the result view
def searchByDesiredSkill (myId):
	viewName = myId + "_desired_people_skill";
	drop_query = "DROP VIEW IF EXISTS " + viewName
	cursor = connection.cursor();
	cursor.execute(drop_query);
	search_query = "create view " + viewName + " as SELECT netId FROM skillsknown WHERE skillName in (SELECT skillName FROM skillsdesired where netId = " + "'" + myId + "'" + ") GROUP BY netId ORDER BY COUNT(*) DESC";
	cursor = connection.cursor();
	cursor.execute(search_query);
	resultQuery = "select * from " + viewName;
	result = cursor.execute(resultQuery);

	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]



#======================================================
# Test with desired and known skills
#======================================================

#Test insert and delete

"""
insertDesiredSkill ('jackma', 'UI design,database,network');
deleteDesiredSkill ('jackma', 'database');
insertDesiredSkill ('larry', 'network,database');
"""

#Test search by language desired
skillResult = searchByDesiredSkill ('larry');
print (skillResult);
