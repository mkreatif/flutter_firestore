import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/recipe.dart';

class RecipeAddView extends StatefulWidget {
  final Recipe? updateRecipe;
  const RecipeAddView({Key? key, this.updateRecipe}) : super(key: key);

  @override
  State<RecipeAddView> createState() => _RecipeAddViewState();
}

class _RecipeAddViewState extends State<RecipeAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: Text('Add Page'),
      ),
    );
  }
}
