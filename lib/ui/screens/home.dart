import 'package:flutter/material.dart';

import 'package:recipes_app/model/recipe.dart';
import 'package:recipes_app/ui/widgets/RecipeCard.dart';
import 'package:recipes_app/utils/store.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget>createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  //New member of the class:
  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();

  //New method :
  //Inactive widgets are going to call this method to 
  //signalize the parent widget HomeScreen to refresh the list view.
  void _handleFavoritesListChanged(String recipeID){
    //Set new State and refresh the widget:
    setState((){
      if(userFavorites.contains(recipeID)){
        userFavorites.remove(recipeID);
      }else {
        userFavorites.add(recipeID);
      }
    });
  }
  @override
  Widget build(BuildContext context){
    //new method 
    Padding _buildRecipes(List<Recipe>recipesList){
      return Padding(
        //Padding before and after the list view
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recipesList.length,
                itemBuilder: (BuildContext context , int index){
                  return new RecipeCard(
                    // title: Text(recipesList[index].name),
                    recipe: recipesList[index],
                    inFavorites: userFavorites.contains(recipesList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                }
              )
            )
          ],
        )
       
      );


    }
    const double _iconSize = 20.0;

      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            //We set Size equal to passed height (50.0) and inifinite width
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 2.0,
              bottom: TabBar(
                labelColor: Theme.of(context).indicatorColor,
                tabs:[
                  Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                  Tab(icon: Icon(Icons.local_drink , size: _iconSize)),
                  Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                  Tab(icon: Icon(Icons.settings , size: _iconSize))
                ]
              )
            )
          ),
          body: Padding(
            padding: EdgeInsets.all(5.0),
            child: TabBarView(
              //replace placeholders:
              children: [
                //display recipes of type food: 
                _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.food)
                  .toList()),
                  //display recipes of type drink:
                 _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.drink)
                  .toList()),
                  // display favourites
                 _buildRecipes(recipes
                  .where((recipe) => userFavorites.contains(recipe.id))
                  .toList()),
                Center(child: Icon(Icons.settings))
              ]
            )
          )
        ),
      );
  }
}
// class HomeScreen extends StatelessWidget{
//   @override 
//   Widget build(BuildContext context){
//     double _iconSize = 20.0;

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold (
//         appBar: PreferredSize(
//           //set size equal to passed height (50.0) and infinite width
//           preferredSize: Size.fromHeight(50.0),
//           child: AppBar(
//             backgroundColor:  Colors.white,
//           elevation:  2.0,
//           bottom: TabBar(
//             labelColor: Theme.of(context).indicatorColor,
//             tabs: [
//               Tab(icon: Icon(Icons.restaurant , size: _iconSize)),
//               Tab(icon: Icon(Icons.local_drink , size: _iconSize)),
//               Tab(icon: Icon(Icons.favorite , size: _iconSize)),
//               Tab(icon: Icon(Icons.settings, size: _iconSize))
//             ]
//           ),
          
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(5.0),
//           child: TabBarView(
//             //placeHolders for content of the tabs:
//             children: [
//               Center(child: Icon(Icons.restaurant)),
//               Center(child: Icon(Icons.local_drink)),
//               Center(child: Icon(Icons.favorite)),
//               Center(child: Icon(Icons.settings)),
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }