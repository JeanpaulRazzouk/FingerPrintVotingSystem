# FingerPrintVotingSystem
SQL Database of a FingerPrint voting Application.

## System Description :

First of all, each person is an eligible voter but isn’t registered yet to vote. To do so, each eligible voter must register with the admin in order to be able to become a voter a vote in the election.
Every Voter has an ID with the inclusion of his first and last name, his gender and his age.
Every voter may have the choice to have more than one address, but an address can only be had by one voter only. An Address is represented by a unique ID and also includes attributes such as street address, city, country and zip code.
Now an Area is the location of where the voters vote from. It is represented by an ID but is not limited to the area name, area population and the number of registered voters.
The candidate that is up for in the election is represented by an ID and also has the following attributes such as first name, last name, middle name and candidate gender.
Those candidates can stand with a certain political party which has a name, leader name and the date of establishment. A candidate can stand with only one political party but the party can have multiple candidates up for election.
The Election is represented by an ID and has a date, result date, details and type of election.
The voter can participate in a variety of election, and the election can be participated by multiple voters.

