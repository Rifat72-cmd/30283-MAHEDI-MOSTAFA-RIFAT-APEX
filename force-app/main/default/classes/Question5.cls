//-------------------A----------------------//
In the current Implementations the code only throws 'Error' as message so what the error is exactly that is not defined here

//--------------------------B---------------//
using the logic below 
databse.saveresults(false)

it will perform like if any data is processing good way it will save the update.

//-------------------C--------------------//
using the given pattern of the question the error handling should be done like This

try {
insert leadsToInsert;
} catch (Exception e) {
System.debug(e.getMessage());
}


//--------------------------D---------------------------//
using maping like key value pairs it could be stored in  a list so that in the future it could be investigate properly


demo below
map<string,string> err = new map<string, string>();
try {
insert leadsToInsert;
} catch (Exception e) {
//System.debug(e.getMessage());
err.put('Lead Insert', e.getMessage())}
