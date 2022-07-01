import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/recipe.dart';
import 'package:flutter_firebase/pages/recipe_add_edit.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipesState();
}

class _RecipesState extends State<RecipeView> {
  CollectionReference refs = FirebaseFirestore.instance.collection('/recipes');
  List<Recipe> recipes = List.empty(growable: true);
  @override
  void initState() {
    initApp();
    super.initState();
    print("Init Again");
  }

  initApp() async {
    recipes = List.empty(growable: true);
    refs.get().then((event) {
      for (var doc in event.docs) {
        debugPrint("${doc.id} => ${doc.data()}");
        recipes.add(Recipe.fromMap(doc.data() as Map<String, dynamic>));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeAddView(),
                  )).then((_) => initApp()),
              icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].judul),
          );
        },
      )),
    );
  }
}
