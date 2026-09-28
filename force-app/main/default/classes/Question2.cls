trigger OpportunityTrigger on Opportunity (after insert, after update) {
    for (Opportunity opp : Trigger.new) {
Account acc = [
SELECT Id, Strategic__c
FROM Account
WHERE Id = :opp.AccountId
];
List<Opportunity> opportunities = [
SELECT Id, Amount
FROM Opportunity
WHERE AccountId = :opp.AccountId
];
Decimal totalAmount = 0;
for (Opportunity item : opportunities) {
if (item.Amount != null) {
totalAmount += item.Amount;
}
}
if (totalAmount >= 5000000) {
acc.Strategic__c = true;
update acc;
}
}
}



//------------------------------A----------------------//
DML operation is inside the loop.This is a violation of the best practice. DML operations should be outside the loop to avoid hitting governor limits.

when checking for the ID the type is Opportunity but checking Account Id it is expection Opportunity ID.it should be nested.

Totalamount is in integer but treating as decimal.


//------------------B--------------------//
Apex can run upto 200 dml operation in a chunks and when DML operations throw the apex count all the operation in a loop but when throws in a list  it count it as 1 .but here in the question code 


/----------------------C-----------------------//

trigger OpportunityTrigger on Opportunity (after insert, after update) {

    list<Account> upacc = new List<Account>();

    for (Opportunity opp : Trigger.new) {
        Account acc = [
        SELECT Id, Strategic__c
        FROM Account
        WHERE Id = :opp.AccountId
        ];
        List<Opportunity> opportunities = [
        SELECT Id, Amount
        (select Id from Account WHERE AccountId = :opp.AccountId)
        FROM Opportunity
        ];
        Integer totalAmount = 0;
        for (Opportunity item : opportunities) {
        if (item.Amount != null) {
        totalAmount += item.Amount;
        }
        }
        if (totalAmount >= 5000000) {
        acc.Strategic__c = true;
        
        }
        upacc.add(acc);
    }
    update upacc;
}