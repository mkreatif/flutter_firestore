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
          final recipe = recipes[index];
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.judul),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(recipe.bahan),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(recipe.cara),
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
