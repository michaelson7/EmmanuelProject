import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/Provider/UsersProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/login_activity.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';
import 'package:flutter_project/View/widgets/snackBarBuilder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'home_activity.dart';

class RegistrationActivity extends StatefulWidget {
  static String id = "RegistrationActivity";
  const RegistrationActivity({Key? key}) : super(key: key);

  @override
  _RegistrationActivityState createState() => _RegistrationActivityState();
}

class _RegistrationActivityState extends State<RegistrationActivity> {
  bool isLoading = false;
  final _key = GlobalKey<FormState>();
  var emailController = TextEditingController(),
      passwordController = TextEditingController();
  UsersProvider _usersProvider = UsersProvider();
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  mainBody() {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
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
                      Navigator.popAndPushNamed(context, LoginActivity.id);
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
      ),
    );
  }

  buttonSubmit() async {
    if (_key.currentState!.validate()) {
      setState(() => isLoading = true);
      UsersModel usersModel = UsersModel(
        id: 0,
        firstName: "",
        lastName: "",
        email: emailController.text,
        password: passwordController.text,
        roleId: 3,
        timestamp: null,
        rolesModel: null,
      );
      var request = await _usersProvider.usersRegistration(
        usersModel: usersModel,
        showResponse: true,
      );
      if (request != null) {
        if (!request.error) {
          snackBarBuilder(context: context, message: "Registration Successful");
          await _sharedPreferenceProvider.addUserDetails(usersModel);
          Navigator.popAndPushNamed(context, HomeActivity.id);
        } else {
          snackBarBuilder(
            context: context,
            message: request.errorMessage,
          );
        }
      } else {
        snackBarBuilder(context: context, message: "ERROR!");
      }
      setState(() => isLoading = false);
    }
  }
}
