/**

Tables that need to be updated:
Idea

**/
ALTER TABLE idea

ADD FOREIGN KEY (netId)
REFERENCES Student(netId)
ON DELETE CASCADE,

ADD FOREIGN KEY (projectId)
REFERENCES Project(projectId)
ON DELETE CASCADE;

