import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';

import 'home_activity.dart';

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
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Text(
              'Hey\nLogin Now',
              style: kTextStyleHeader1,
            ),
            Row(
              children: [
                Text('If you are new / ', style: kTextStyleHint),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: kAccent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            outlinedTextFormField(
              title: 'Email/Username',
              errorText: 'Please input Email/Username',
              controller: emailController,
              showAccent: true,
              returnedParameter: (value) {
                //userName = value;
              },
            ),
            SizedBox(height: 10),
            outlinedTextFormField(
              title: 'Password',
              errorText: 'Please input Password',
              controller: passwordController,
              obscureText: true,
              showAccent: true,
              returnedParameter: (value) {
                //userName = value;
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('Forgot Password / ', style: kTextStyleHint),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Reset',
                    style: TextStyle(color: kAccent),
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => buttonSubmit(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'LOGIN',
                      style: kTextStyleHeader2,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buttonSubmit() async {
    if (_key.currentState!.validate()) {
      Navigator.popAndPushNamed(context, HomeActivity.id);
    }
  }
}
