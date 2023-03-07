public with sharing class NewsApiCallout {
    @AuraEnabled
    public static Map<String,Object> retrieveNews(){
        String queryParameter = '/v2/everything?q=tesla&from=2023-02-06&sortBy=publishedAt';
        String apiKey = '&apiKey=3ac6b2e40ff349a6acd63e9f5d0494a4';
        
        HttpRequest req = new HttpRequest();
        
        req.setEndPoint('callout:News_Api'+queryParameter+apiKey);
        req.setMethod('GET');
        Map<String, Object> newsJsonData = new Map<String,Object>();
        String strResponse = null;
        try{
            Http http = new Http();
            HttpResponse response = http.send(req);
            if(response.getStatusCode()==200){
                strResponse = response.getBody();
            }
            else{
                throw new CalloutException(response.getBody());
            }
        }catch(Exception e){
            throw e;
        }
        if(!String.isBlank(strResponse)){
            newsJsonData = (Map<String,Object>) JSON.deserializeUntyped(strResponse);
        }
        if(!newsJsonData.isEmpty()){
            return newsJsonData;
        }else return null;

    } 
}