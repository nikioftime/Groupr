/**

Tables that need to be updated:
Idea
languagesDesired
languagesKnown
partOf
skillsDesired
skillsKnown
suggested

Do not need to update
Preferred
Available
Teaches
Instructor
**/

/*ALTER TABLE idea

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE,

ADD FOREIGN KEY (projectId)
REFERENCES Project(projectId)
ON DELETE CASCADE;
*/

/*
ALTER TABLE languagesKnown

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE;
*/

/*ALTER TABLE languagesDesired
DROP KEY netId;*/


/*
ALTER TABLE partOf

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE;
*/

/*
ALTER TABLE partOf

ADD FOREIGN KEY (groupId)
REFERENCES Groups(id)
ON DELETE CASCADE;
*/

/*
ALTER TABLE skillsDesired

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE;
*/

/*
ALTER TABLE skillsKnown

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE;
*/

ALTER TABLE suggested

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE,

ADD FOREIGN KEY (groupId)
REFERENCES Groups(id)
ON DELETE CASCADE;