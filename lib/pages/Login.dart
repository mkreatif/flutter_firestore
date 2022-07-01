import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
//   late CollectionReference userCollectionRefs;
  @override
  void initState() {
    super.initState();
  }

  initApp() async {
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    // userCollectionRefs = FirebaseFirestore.instance.collection('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [Text("Selamat datang")],
          ),
        ),
      ),
    );
  }
}
