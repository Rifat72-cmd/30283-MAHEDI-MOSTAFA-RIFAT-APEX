//---------------------------------A------------------------------//
public with sharing class records {
    public list<Account> records(ID ids) {
      
        List<Account> a = new list<Account>();
        list<Contacs> c = new list<Contacts>();
        list<Opportunities> o = new list<Opportunities>();


        for(Id i: ids){
        List<Account> n = [select Id,Name from Account where Id = :i.id];}
        a.add(n);
        

        for(Id i: ids){
        List<Contacts> n = [select Id, Name, Email, Phone from Contacts where Id = :a.id];}
        a.add(n);

        for(Id i: ids){
        List<Opportunities> n = [select Id, Name, StageName, Amount, CloseDate from Opportunities where Id = :i.id];}
        a.add(n);

        merge a c ;
        merge a o;
        return a;

}
}
//----------------------------B-------------------------------------//

public with sharing class Records {

    public static List<List<SObject>> searchRecords(String searchText) {

        List<List<SObject>> results = [
            FIND :searchText IN NAME FIELDS
            RETURNING
                Account(Id, Name),
                Contact(Id, Name, Email, Phone)
            WITH USER_MODE
        ];

        return results;
    }
}

//-----------------------------D-------------------//
public static List<Account> getAccountDetails(Set<Id> accountIds) {

    return [
        SELECT Id, Name,
            (SELECT Id, Name, Email, Phone
             FROM Contacts),
            (SELECT Id, Name, StageName, Amount, CloseDate
             FROM Opportunities)
        FROM Account
        WHERE Id IN :accountIds
        WITH USER_MODE
    ];
}