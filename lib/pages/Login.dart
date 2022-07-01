import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/utils/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  CollectionReference refs = FirebaseFirestore.instance.collection('/users');
  List<TextEditingController> tecs =
      List.generate(2, (index) => TextEditingController());
  @override
  void initState() {
    initApp();
    super.initState();
  }

  initApp() async {
    await refs.get().then((event) {
      for (var doc in event.docs) {
        debugPrint("${doc.id} => ${doc.data()}");
      }
    });
  }

  handleLogin() async {
    debugPrint("${tecs[0].text} ${tecs[1].text}");
    await refs
        .where("username", isEqualTo: tecs[0].text)
        .where('password', isEqualTo: tecs[1].text)
        .get()
        .then(
      (res) {
        if (res.size > 0) {
          debugPrint("Login Success");
          Navigator.pushReplacementNamed(context, '/recipes');
        } else {
          debugPrint("Login Failed");
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: tecs[0],
                  textInputAction: TextInputAction.done,
                  decoration:
                      defaultInputDecoration(hintText: 'Email / Username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: tecs[1],
                  textInputAction: TextInputAction.done,
                  decoration: defaultInputDecoration(
                      hintText: 'Kata Sandi', isObscured: true),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () => handleLogin(),
          child: Text("Login"),
          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
        ),
      ),
    );
  }
}
