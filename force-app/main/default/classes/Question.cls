//---------------------A-----------------------//
DML operation inside a loop it will have govornor limit 

checking Accounts Id while fetching the contact object ID

//------------------B-------------------//
public static void updateContacts(List<Account> accounts) {
    list<Contact> c = new Contact();


for (Account acc : accounts) {
List<Contact> contacts = [
SELECT Id,  Description(select Id from Accounts WHERE AccountId = :acc.Id)
FROM Contact

];

for (Contact con : contacts) {
if (acc.Industry == 'Technology') {
con.Description = 'Technology Customer';
c.add(con);
}
}
}

update c;
}

//-----------------------C----------------------//
public static void updateContacts(List<Account> accounts) {
    list<Contact> c = new Contact();


for (Account acc : accounts) {
List<Contact> contacts = [
SELECT Id,  Description(select Id from Accounts WHERE AccountId = :acc.Id)
FROM Contact

];

for (Contact con : contacts) {
if (acc.Industry == 'Technology') {
    if(con.Description != 'Technology Customer';){
        con.Description = 'Technology Customer';

c.add(con);}
}
}
}

update c;
}

it will make the code more efficient as it will make the list less then the previous.