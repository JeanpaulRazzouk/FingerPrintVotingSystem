create table Administration
(
AD_ID number primary key
);
create table Person
(
U_ID number primary key ,
U_FirstName varchar2(200),
U_LastName varchar2(200),
U_MotherName varchar2(200),
U_FatherName varchar2(200),
U_Age number,
AD_ID number(20),CONSTRAINT fk_AD_ID FOREIGN KEY (AD_ID) references Administration(AD_ID)
);

create table Voter
(
V_ID number primary key ,
V_FirstName varchar2(200),
V_LastName varchar2(200),
V_Gender VARCHAR(200),
V_Age number(3),
AD_ID number(20),CONSTRAINT fk_AD_ID2 FOREIGN KEY (AD_ID) references Administration(AD_ID),
A_AreaID number(20) , CONSTRAINT fk_Area_ID2 FOREIGN KEY (A_AreaID) references Area(A_AreaID),
C_ID number(20) ,CONSTRAINT fk_Candidate_ID FOREIGN KEY (C_ID) references Candidate(C_ID)
);

create table FingerPrint
(
F_ID number primary key,
V_ID number(20) ,CONSTRAINT fk_V_ID2 FOREIGN KEY (V_ID) references Voter(V_ID)
);

create table Area
(
A_AreaID number primary key ,
A_Name varchar2(200) NOT NULL UNIQUE,
A_Population varchar2(200),
A_NumberOfRegisteredVoters number,
C_ID number(20) ,CONSTRAINT fkey_Candidate_ID FOREIGN KEY (C_ID) references Candidate(C_ID),
P_PartyID number(20) ,CONSTRAINT fkey_Party_ID FOREIGN KEY (P_PartyID) references Party(P_PartyID)
);

create table Election (
E_ID number primary key,
E_Date date,
E_Type varchar2(200),
E_ResultDate date,
E_Details varchar2(200),
AD_ID number(20),CONSTRAINT fk_AD_ID3 FOREIGN KEY (AD_ID) references Administration(AD_ID)
);

create table Participate( 
A_AreaID number NOT NULL,
    E_ID number NOT NULL,
    V_ID number NOT NULL,
    FOREIGN KEY (A_AreaID) REFERENCES Area(A_AreaID), 
    FOREIGN KEY (E_ID) REFERENCES Election(E_ID),
    FOREIGN KEY (V_ID) REFERENCES Voter(V_ID),
    UNIQUE (A_AreaID,E_ID,V_ID)
);
create table Address
(
ADD_ID number primary key ,
ADD_Street varchar2(200),
ADD_City varchar2(200),
ADD_Country varchar2(200),
ADD_ZipCode varchar2(200),
V_ID number(20) ,CONSTRAINT fk_V_ID3 FOREIGN KEY (V_ID) references Voter(V_ID)
);

create table Candidate
(
C_ID number primary key ,
C_FirstName varchar2(200),
C_LastName varchar2(200),
C_Gender varchar2(200),
AD_ID number(20),CONSTRAINT fk_AD_ID4 FOREIGN KEY (AD_ID) references Administration(AD_ID),
P_PartyID number(20) ,CONSTRAINT fk_Party_ID4 FOREIGN KEY (P_PartyID) references Party(P_PartyID)
);

create table Party (
P_PartyID number primary key,
P_name varchar2(200),
P_LeaderName varchar2(200),
P_DateofEstablishment date
);

create table res(
R_ID number primary key,
R_Candidate_total_vote number,
R_party_total_vote number,
R_total_votes number,
P_PartyID number(20) ,CONSTRAINT fk_Party_ID5 FOREIGN KEY (P_PartyID) references Party(P_PartyID),
C_ID number(20) , CONSTRAINT fk_C_ID1 FOREIGN KEY (C_ID) references Candidate(C_ID)
);

-- Insert
--Party
INSERT INTO Party (P_PartyID, P_name,P_LeaderName,P_DateofEstablishment)
VALUES (1,'Freedom Party','Agnis',TO_DATE('1989-12-09','YYYY-MM-DD'));
INSERT INTO Party (P_PartyID, P_name,P_LeaderName,P_DateofEstablishment)
VALUES (2,'Math Party','Alexa',TO_DATE('1991-12-09','YYYY-MM-DD'));

--Admin
INSERT INTO Administration (AD_ID)
VALUES (500);

-- Voter
INSERT INTO Voter (V_ID, V_FirstName,V_LastName,V_Gender,V_Age,AD_ID,A_AreaID,C_ID)
VALUES(20,'elias','Farah','male',25,500,5,1);
INSERT INTO Voter (V_ID, V_FirstName,V_LastName,V_Gender,V_Age,AD_ID,A_AreaID,C_ID)
VALUES(30,'John','Razz','male',49,500,99,2);
INSERT INTO Voter (V_ID, V_FirstName,V_LastName,V_Gender,V_Age,AD_ID,A_AreaID,C_ID)
VALUES(40,'Ali','Saleh','male',36,500,5,1);

-- candiate
INSERT INTO Candidate (C_ID, C_FirstName,C_LastName,C_Gender,AD_ID,P_PartyID)
VALUES(1,'Candidate 1 Fname','Candidate 1 Lname','male',500,1);

INSERT INTO Candidate (C_ID, C_FirstName,C_LastName,C_Gender,AD_ID,P_PartyID)
VALUES(2,'Candidate 2 Fname','Candidate 2 Lname','female',500,2);

-- Address
INSERT INTO Address(ADD_ID,ADD_Street,ADD_City,ADD_Country,ADD_ZipCode,V_ID)
VALUES(1,2323,'Byblos','Lebanon',1212,30);
INSERT INTO Address(ADD_ID,ADD_Street,ADD_City,ADD_Country,ADD_ZipCode,V_ID)
VALUES(2,223,'Beirut','Lebanon',122,30);
INSERT INTO Address(ADD_ID,ADD_Street,ADD_City,ADD_Country,ADD_ZipCode,V_ID)
VALUES(3,232,'NYC','US',888,40);
INSERT INTO Address(ADD_ID,ADD_Street,ADD_City,ADD_Country,ADD_ZipCode,V_ID)
VALUES(4,2222,'Ras Beirut','Lebanon',908,20);

-- Area
INSERT INTO Area (A_AreaID, A_Name,A_Population,A_NumberOfRegisteredVoters,C_ID,P_PartyID)
VALUES (5,'Achrafieh','2000',1000,1,1);
INSERT INTO Area (A_AreaID, A_Name,A_Population,A_NumberOfRegisteredVoters,C_ID,P_PartyID)
VALUES (99,'Ras Beirut','2000',1000,2,1);


-- res which is the result
insert into Res(R_ID, R_Candidate_Total_Vote, R_Party_Total_Vote, R_Total_Votes, P_PartyID, C_ID)
values(1, 1000, 3000, 10000, 1, 1);
insert into Res(R_ID, R_Candidate_Total_Vote, R_Party_Total_Vote, R_Total_Votes, P_PartyID, C_ID)
values(2, 2000, 2500, 10000,2,2);

-- Election
insert into Election(E_ID, E_Date, E_Type, E_ResultDate, E_Details, AD_ID) 
values(1,TO_DATE('2016-07-11','YYYY-MM-DD'),'Parliamentary',TO_DATE('2016-08-07','YYYY-MM-DD'),'',500);
insert into Election(E_ID, E_Date, E_Type, E_ResultDate, E_Details, AD_ID) 
values(2,TO_DATE('2020-11-01','YYYY-MM-DD'),'Presidential',TO_DATE('2020-12-07','YYYY-MM-DD'),'',500);


--participate
insert into Participate (A_AreaID,E_ID,V_ID)
values (5,1,20);
insert into Participate (A_AreaID, E_ID, V_ID)
values (99,2,30);


-- Queries;

-- returns the list of voters that are from a certain area (Achrafieh);
select Voter.V_ID,Voter.V_FirstName,Voter.V_Lastname,Area.A_AreaID,Area.A_Name
from Voter,Area
where Voter.A_AreaID = Area.A_AreaID
and Area.A_Name = 'Achrafieh';


-- returns the candidates that are standing a certain area (Achrafieh);
select Candidate.C_ID,Candidate.C_FirstName,Candidate.C_Lastname
from Candidate,Area
where Area.C_ID = Candidate.C_ID
and Area.A_Name = 'Achrafieh';

-- returns the numbers of registered voters;
select
SUM(A_NumberOfRegisteredVoters) 
from Area;

-- return the name of the areas of all registered voters;
select A_Name,A_AreaID 
from Area;

-- returns the list of registred voters that have more than one address ;
select count (Voter.V_ID) ,Voter.V_FirstName, Voter.V_Lastname
from Voter,Address
where Voter.V_ID = Address.V_ID
group by Voter.V_ID, Voter.V_FirstName, Voter.V_Lastname
having count (V_ID) > 1;


-- returns the party total votes of "Freedom Party";
select res.R_ID,Party.P_Name ,res.R_Party_Total_Vote
from res,Party
where res.P_PartyID = Party.P_PartyID
and P_Name = 'Freedom Party';

-- returns the party total votes of "Math Party";
select res.R_ID,Party.P_Name ,res.R_Party_Total_Vote
from res,Party
where res.P_PartyID = Party.P_PartyID
and P_Name = 'Math Party';

-- return the total votes of all candidates in a descending order;
select Candidate.C_ID,Candidate.C_FirstName,res.R_ID, res.R_Candidate_Total_Vote
from res, Candidate
where res.C_ID = Candidate.C_ID
ORDER BY res.R_Candidate_Total_Vote DESC;

-- returns the number of voters who voted;
select sum (R_Total_votes)
from res;

-- returns the zip code of the voters in ascending order;
select Voter.V_ID,Voter.V_FirstName,Voter.V_LastName, Address.ADD_ZipCode
from Voter, Address
where Voter.V_ID = Address.V_ID
order by Address.ADD_ZipCode ASC;

-- returns the  voters who voted in a certain type of election; // TO BE CHECKED;
select E_ID,V_ID
from participate
where E_ID in (
select E_ID
from Election
where E_Type = 'Parliamentary' and V_ID in (
select V_ID
from Voter
)
);
-- returns the elections that occured between 2010 and 2020;
select E_ID,E_Date,E_Type,E_ResultDate
from Election
where E_Date between TO_DATE('2010-11-01','YYYY-MM-DD') and TO_DATE('2020-11-01','YYYY-MM-DD');


-- returns the candidate that won the election 
select Candidate.C_ID,Candidate.C_FirstName,Candidate.C_LastName,res.R_Candidate_total_vote 
from res,Candidate
where Candidate.C_ID = res.C_ID
and res.R_Candidate_total_vote in (select max(res.R_Candidate_total_vote) from res);

-- returns the party that won the election  
select Party.P_PartyID,Party.P_Name,res.R_Party_Total_Vote 
from Party,res 
where Party.P_PartyID = res.P_PartyID
and res.R_party_total_vote in (select max(res.R_party_total_vote) from res);


-- returns the number of votes each party got
select Party.P_name,res.R_party_total_vote
FROM res,Party
where Party.P_PartyID = res.P_PartyID;

-- returns the list of voters with Zip Code 122 and from Beirut 
Select *
from Voter,Address
Where Voter.V_ID = Address.V_ID and ADD_ID in (
select ADD_ID
from Address
where ADD_ZipCode = '122' and  ADD_City = 'Beirut'
);
-- returns the parties that had votes ranging from 2000 to 3500
select Party.P_PartyID,Party.P_Name,res.R_Party_Total_Vote 
from Party,res
where Party.P_PartyID = res.P_PartyID
and R_Party_Total_Vote BETWEEN 2000 AND 3500;

-- returns the candidates of male gender
select C_ID, C_FirstName, C_LastName, C_Gender
from Candidate
where C_Gender = 'male';

-- returns the maximum votes of candidates in each party
select Party.P_PartyID, Party.P_Name, Candidate.C_FirstName, Max(R_Candidate_Total_Vote)
from res, Party, Candidate
where Party.P_PartyID = res.P_PartyID and Party.P_PartyID = Candidate.P_PartyID
GROUP BY Party.P_PartyID, Party.P_Name, Candidate.C_FirstName;