import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/base/event_object.dart';
import '../utils/api_utils.dart';

Future<EventObject> getCategories() async {
  try {
    http.Response response = await http.get(ApiConstants.baseUrl + ApiOperations.categories);

    if (response != null) {
      if (response.statusCode == ApiResponseCode.scOK && response.body != null) {  
        List<Map<String, dynamic>> categories = List<Map<String,dynamic>>.from(json.decode(response.body)["results"]);
        return EventObject(id: EventConstants.requestSuccessful, object: categories);
      } 
      else 
        return EventObject(id: EventConstants.requestUnsuccessful);
    } 
    else 
      return EventObject();
  } 
  catch (Exception) {
    return EventObject();
  }
}

Future<EventObject> getTrivia(int category, String difficulty, int limit) async {
  try {
    int level = 1;
    if (difficulty == 'medium') level = 2;
    else if (difficulty == 'hard') level = 3;

    http.Response response = await http.get(
      ApiConstants.baseUrl + ApiOperations.trivia +
      "?category=$category&level=$level&limit=$limit"
    );

    if (response != null) {
      if (response.statusCode == ApiResponseCode.scOK && response.body != null) {  
        List<Map<String, dynamic>> trivia = List<Map<String,dynamic>>.from(json.decode(response.body)["results"]);
        return EventObject(id: EventConstants.requestSuccessful, object: trivia);
      } 
      else 
        return EventObject(id: EventConstants.requestUnsuccessful);
    } 
    else 
      return EventObject();
  } 
  catch (Exception) {
    return EventObject();
  }
}
