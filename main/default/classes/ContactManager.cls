/*
*
* @Author: Felipe Gouvea
* @Date: 20/01/2020
* @Description: This class is callable mainly to be used in generic table
*
*/
global class ContactManager implements Callable {
    public object call(String relatedId, Map<String, Object> args){
        return (object) [SELECT Name, Email, Birthdate FROM Contact WHERE AccountId =: relatedId];
    }
}