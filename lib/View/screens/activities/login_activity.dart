import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Provider/GuageStationProvider.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/Provider/StaffProvider.dart';
import 'package:flutter_project/Provider/UsersProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/widgets/outlinedTextFormField.dart';
import 'package:flutter_project/View/widgets/snackBarBuilder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'RegistrationActivity.dart';
import 'home_activity.dart';

class LoginActivity extends StatefulWidget {
  static String id = "LoginActivity";
  const LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  bool isLoading = false;
  final _key = GlobalKey<FormState>();
  var emailController = TextEditingController(),
      passwordController = TextEditingController();
  UsersProvider _usersProvider = UsersProvider();
  GaugeStationProvider _gaugeStationProvider = GaugeStationProvider();
  StaffProvider _staffProvider = StaffProvider();
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
              Text(
                'Hey\nLogin Now',
                style: kTextStyleHeader1,
              ),
              Row(
                children: [
                  Text('If you are new / ', style: kTextStyleHint),
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, RegistrationActivity.id);
                    },
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
      ),
    );
  }

  buttonSubmit() async {
    if (_key.currentState!.validate()) {
      setState(() => isLoading = true);
      var request = await _usersProvider.usersLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      if (request != null) {
        snackBarBuilder(context: context, message: "Login Successful");
        await _sharedPreferenceProvider.addUserDetails(request);
        var staffData = await _staffProvider.getStaff(request.id);

        if (staffData != null) {
          int stationID = staffData.stationId;
          var gaugeRecordId =
              await _gaugeStationProvider.gaugeStationGetByStationId(stationID);
          if (gaugeRecordId != null) {
            await _sharedPreferenceProvider.addStattion(
              data: gaugeRecordId.id.toString(),
            );
          }
        }
        Navigator.popAndPushNamed(context, HomeActivity.id);
      } else {
        snackBarBuilder(context: context, message: "Account does not exist");
      }
      setState(() => isLoading = false);
    }
  }
}
