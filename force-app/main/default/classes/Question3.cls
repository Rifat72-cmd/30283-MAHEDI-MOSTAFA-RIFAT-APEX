//--------------------A------------------------//
trigger OpportunityTrigger on Opportunity (after insert, after update) {

    list<Opportunity> upacc = new List<Opportunity>();

    for (Opportunity opp : Trigger.new) {
        
     
        List<Opportunity> opportunities = [
        SELECT Id, Amount, Stage
        FROM Opportunity
        ];
        
        for (Opportunity item : opportunities) {
        if (item.Amount != '' && item.Amount <= 0) {
       item.Stage = 'Closed  Won';
        upacc.add(item);
        }
        
        }
       
    }
    update upacc;
}

//----------------------B----------------------------//

