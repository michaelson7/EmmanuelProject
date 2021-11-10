import 'package:flutter/material.dart';
import 'package:flutter_project/Provider/SharedPreferenceProvider.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/constants/enums.dart';
import 'package:flutter_project/View/widgets/inputCard.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  SharedPreferenceProvider _sharedPreferenceProvider =
      SharedPreferenceProvider();
  var nameController = TextEditingController(),
      emailController = TextEditingController(),
      roleController = TextEditingController(),
      passwordController = TextEditingController();

  Future<void> initData() async {
    nameController.text = (await _sharedPreferenceProvider
        .getStringValue(getEnumValue(UserDetails.userName)))!;
    emailController.text = (await _sharedPreferenceProvider
        .getStringValue(getEnumValue(UserDetails.userEmail)))!;
    nameController.text = (await _sharedPreferenceProvider
        .getStringValue(getEnumValue(UserDetails.userName)))!;
    roleController.text = (await _sharedPreferenceProvider
        .getStringValue(getEnumValue(UserDetails.userAccount)))!;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            imageHandler(),
            personalInformation(),
            //ButtonHandler(),
          ],
        ),
      ),
    );
  }

  imageHandler() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1628191013085-990d39ec25b8?ixid=MnwxMjA3fD'
              'F8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
        ),
      ),
    );
  }

  personalInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Details', style: kTextStyleHeader2),
          SizedBox(height: 15),
          inputCard(
            title: 'Names',
            controller: nameController,
          ),
          inputCard(
            title: 'Email',
            controller: emailController,
          ),
          inputCard(
            title: 'Role',
            controller: roleController,
          ),
          // inputCard(
          //   title: 'Password, leave empty if you do not want to change',
          //   controller: passwordController,
          // )
        ],
      ),
    );
  }

  ButtonHandler() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Update'),
        ),
      ),
    );
  }
}
