/*
*
*
* @Author: Felipe Gouvea
* @Date: 20/01/2020
* @Description: This class controls the generic table LWC
*/
public with sharing class GenericTableController {
    
    @AuraEnabled(cacheable=true)
    public static List<SObject> dispatchMethod(string className, string recordId, Map<string, object> properties){
        Type t = Type.forName(className);
        Callable classToBeCalled = (Callable) t.newInstance();
        return (List<SObject>)classToBeCalled.call(recordId, properties);
    }


}