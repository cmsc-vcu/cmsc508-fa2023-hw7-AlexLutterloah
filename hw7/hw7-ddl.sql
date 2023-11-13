# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

#SET AUTOCOMMIT = 1

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    time_commitment INT,
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
    (1, 'Running', 'Ability to run long distances', 'Skill 1', 'google.com/running', 5),
    (2, 'Programming', 'Able to code programs', 'Skill 2', 'google.com/programming', 100),
    (3, 'Teaching', 'Capable of teaching others', 'Skill 3', 'google.com/teaching', 20),
    (4, 'Swimming', 'Can swim in the ocean', 'Skill 4', 'google.com/swimming', 20),
    (5, 'Climbing', 'Can free solo any climb', 'Skill 5', 'google.com/climbing', 40),
    (6, 'Jumping', 'Able to jump over 5 feet', 'Skill 6', 'google.com/jumping', 15),
    (7, 'Hiding', 'Owns camo gear, unable to be seen', 'Skill 7', 'google.com/invisible', 50),
    (8, 'Skateboarding', 'Able to kickflip', 'Skill 8', 'google.com/skateboarding', 75);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(255),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
  (1, 'John', 'Person 1', 'john.person@example.com', 'linkedin.com/in/johnperson1', 'john_headshot_url_1.jpg', 'john#1234', 'Brief bio for John Person 1', '2023-01-01'),
  (2, 'Alice', 'Person 2', 'alice.person@example.com', 'linkedin.com/in/aliceperson2', 'alice_headshot_url_2.jpg', 'alice#1234', 'Brief bio for Alice Person 2', '2023-01-02'),
  (3, 'Bob', 'Person 3', 'bob.person@example.com', 'linkedin.com/in/bobperson3', 'bob_headshot_url_3.jpg', 'bob#1234', 'Brief bio for Bob Person 3', '2023-01-03'),
  (4, 'Emma', 'Person 4', 'emma.person@example.com', 'linkedin.com/in/emmaperson4', 'emma_headshot_url_4.jpg', 'emma#1234', 'Brief bio for Emma Person 4', '2023-01-04'),
  (5, 'David', 'Person 5', 'david.person@example.com', 'linkedin.com/in/davidperson5', 'david_headshot_url_5.jpg', 'david#1234', 'Brief bio for David Person 5', '2023-01-05'),
  (6, 'Sophia', 'Person 6', 'sophia.person@example.com', 'linkedin.com/in/sophiaperson6', 'sophia_headshot_url_6.jpg', 'sophia#1234', 'Brief bio for Sophia Person 6', '2023-01-06'),
  (7, 'Michael', 'Person 7', 'michael.person@example.com', 'linkedin.com/in/michaelperson7', 'michael_headshot_url_7.jpg', 'michael#1234', 'Brief bio for Michael Person 7', '2023-01-07'),
  (8, 'Olivia', 'Person 8', 'olivia.person@example.com', 'linkedin.com/in/oliviaperson8', 'olivia_headshot_url_8.jpg', 'olivia#1234', 'Brief bio for Olivia Person 8', '2023-01-08'),
  (9, 'Daniel', 'Person 9', 'daniel.person@example.com', 'linkedin.com/in/danielperson9', 'daniel_headshot_url_9.jpg', 'daniel#1234', 'Brief bio for Daniel Person 9', '2023-01-09'),
  (10, 'Emily', 'Person 10', 'emily.person@example.com', 'linkedin.com/in/emilyperson10', 'emily_headshot_url_10.jpg', 'emily#1234', 'Brief bio for Emily Person 10', '2023-01-10');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT NOT NULL AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (skills_id) REFERENCES skills (id),
    FOREIGN KEY (people_id) REFERENCES people (id),
    UNIQUE (people_id, skills_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
  (1, 1, '2023-01-01'), (3, 1, '2023-01-01'), (6, 1, '2023-01-01'),
  (3, 2, '2023-01-02'), (4, 2, '2023-01-02'), (5, 2, '2023-01-02'),
  (1, 3, '2023-01-03'), (5, 3, '2023-01-03'),
  (3, 5, '2023-01-05'), (6, 5, '2023-01-05'),
  (2, 6, '2023-01-06'), (3, 6, '2023-01-06'), (4, 6, '2023-01-06'),
  (3, 7, '2023-01-07'), (5, 7, '2023-01-07'), (6, 7, '2023-01-07'),
  (1, 8, '2023-01-08'), (3, 8, '2023-01-08'), (5, 8, '2023-01-08'), (6, 8, '2023-01-08'),
  (2, 9, '2023-01-09'), (5, 9, '2023-01-09'), (6, 9, '2023-01-09'),
  (1, 10, '2023-01-10'), (4, 10, '2023-01-10'), (5, 10, '2023-01-10');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT NOT NULL,
    name VARCHAR(255),
    sort_priority INT,
    PRIMARY KEY (ID)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
  (1, 'Designer', 10),
  (2, 'Developer', 20),
  (3, 'Recruit', 30),
  (4, 'Team Lead', 40),
  (5, 'Boss', 50),
  (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT NOT NULL AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
  (1, 2, '2023-01-01'),
  (2, 5, '2023-01-02'),
  (2, 6, '2023-01-02'),
  (3, 2, '2023-01-03'),
  (3, 4, '2023-01-03'),
  (4, 3, '2023-01-04'),
  (5, 3, '2023-01-05'),
  (6, 1, '2023-01-06'),
  (6, 2, '2023-01-06'),
  (7, 1, '2023-01-07'),
  (8, 1, '2023-01-08'),
  (8, 4, '2023-01-08'),
  (9, 2, '2023-01-09'),
  (10, 1, '2023-01-10'),
  (10, 2, '2023-01-10');