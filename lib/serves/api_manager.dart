import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_response.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager{

   static Future<SourceResponse> getSources({required String category})async{
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {
        "apiKey" : "933ceafb9aa444d0bb964d0d1b509524",
         "category": category
      }
     
      );
    http.Response response= await http.get(url);   
    //response.body  now the response body is string but i want it as amap or json
    var json = jsonDecode(response.body); // now this line will convert the response from string to json map
    //now i have the json map but i can not behave with map i want the response as a model
    //so we can use web site called Json to model can convert the map to dart 

    // now i want to take object from the converted object 
    SourceResponse sourceResponse = SourceResponse.fromJson(json); // this line means that i took an object 
    //from the class of the nedded attributes
    return sourceResponse;// i want to return the object
   }  
   

    static Future<NewsDataResponse>getNewsData(String sourceId)
     async{
      Uri url = Uri.https(
        "newsapi.org",
        "/v2/everything", 
         {
        "apiKey" : "93e0fe7b7a35497c86be4eb9608dbddb",
        "sources": sourceId,
        
      } 
      );
      http.Response response = await http.get(url);
      var json =jsonDecode(response.body);
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(json);
      return newsDataResponse;

     }
}