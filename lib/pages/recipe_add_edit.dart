import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/recipe.dart';
import 'package:flutter_firebase/utils/theme.dart';

class RecipeAddView extends StatefulWidget {
  final Recipe? updateRecipe;
  const RecipeAddView({Key? key, this.updateRecipe}) : super(key: key);

  @override
  State<RecipeAddView> createState() => _RecipeAddViewState();
}

class _RecipeAddViewState extends State<RecipeAddView> {
  CollectionReference refs = FirebaseFirestore.instance.collection('/recipes');
  List<TextEditingController> tecs =
      List.generate(5, (index) => TextEditingController());

  handleSaveRecipe() async {
    final data = Recipe(
        id: Random().nextInt(1000),
        judul: tecs[0].text,
        bahan: tecs[1].text,
        cara: tecs[2].text,
        createdAt: Timestamp.fromDate(DateTime.now()));

    refs.add(data.toMap()).then((documentSnapshot) {
      print("Added Data with ID: ${documentSnapshot.id}");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Add New Recipe"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: tecs[0],
                  textInputAction: TextInputAction.done,
                  decoration: defaultInputDecoration(hintText: 'Judul'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: tecs[1],
                  minLines: 10,
                  maxLines: 10, // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  decoration: defaultInputDecoration(hintText: 'Bahan-Bahan'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: tecs[2],
                  minLines: 10,
                  maxLines: 10, // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  decoration: defaultInputDecoration(hintText: 'Cara Memasak'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => handleSaveRecipe(),
          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
          child: Text('Simpan'),
        ),
      ),
    );
  }
}
