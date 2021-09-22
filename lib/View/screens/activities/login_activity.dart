import 'package:flutter/material.dart';

class LoginActivity extends StatefulWidget {
  static String id = "LoginActivity";
  const LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final _key = GlobalKey<FormState>();
  var emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  mainBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Hello World'),
          ],
        ),
      ),
    );
  }

  buttonSubmit() async {
    if (_key.currentState!.validate()) {
      //Navigator.popAndPushNamed(context, HomeActivity.id);
    }
  }
}
