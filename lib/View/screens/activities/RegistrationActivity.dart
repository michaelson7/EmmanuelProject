import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';

import 'home_activity.dart';

class RegistrationActivity extends StatefulWidget {
  static String id = "RegistrationActivity";
  const RegistrationActivity({Key? key}) : super(key: key);

  @override
  _RegistrationActivityState createState() => _RegistrationActivityState();
}

class _RegistrationActivityState extends State<RegistrationActivity> {
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlutterLogo(),
            ),
            Text(
              'Registration',
              style: kTextStyleHeader1,
            ),
            Row(
              children: [
                Text('Already Have An Account? ', style: kTextStyleHint),
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, RegistrationActivity.id);
                  },
                  child: Text(
                    'Login',
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
                      'Register',
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
