import 'package:flutter/material.dart';
import 'package:recipe_api/model/recipe.dart';
import 'package:recipe_api/model/recipe_api.dart';
import 'package:recipe_api/widget/recipe_card.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }
  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width:10),
            Text("Food Recipes",
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 1,
              color: Colors.green
            ),
            ),
          ],
        ),
      ),
      body: isLoading? Center(
        child: CircularProgressIndicator()
      ) : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index){
            return  Recipe_Card(title: _recipes[index].name,
                rating:_recipes[index].rating.toString(),
                cookTime: _recipes[index].totalTime,
              thumbnailUrl:_recipes[index].images );
          }
      )

    );
  }
}
