import 'dart:convert';
import 'package:recipe_api/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{
  static Future <List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "feeds/list",
        { "limit": '18', "start": '0', "tag": 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': 'cb1868d3b2msha91addfb6c0613cp1ee01cjsn486268a7f840',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data["feed"]){
      _temp.add(i["content"]["details"]);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }


}


// import 'dart:convert';
// import 'package:recipe_api/model/recipe.dart';
// import 'package:http/http.dart' as http;
//
// class RecipeApi {
//   static Future<List<Recipe>> getRecipe() async {
//     var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
//         {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
//
//     final response = await http.get(uri, headers: {
//       "x-rapidapi-key": "cb1868d3b2msha91addfb6c0613cp1ee01cjsn486268a7f840",
//       "x-rapidapi-host": "yummly2.p.rapidapi.com",
//       "useQueryString": "true"
//     });
//
//     Map data = jsonDecode(response.body);
//     List _temp = [];
//
//     for (var i in data['feed']) {
//       _temp.add(i['content']['details']);
//     }
//
//     return Recipe.recipesFromSnapshot(_temp);
//   }
// }