import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routerName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          ListTile(
            tileColor: _auth == Auth.signup
                ? GlobalVariable.backgroundColor
                : GlobalVariable.greyBackgroundCOlor,
            title: const Text(
              'create account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariable.secondaryColor,
              value: Auth.signup,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if (_auth == Auth.signup)
            Container(
              padding: const EdgeInsets.all(
                8.0,
              ),
              color: GlobalVariable.backgroundColor,
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'SignUp', onTap: () {})
                  ],
                ),
              ),
            ),
          ListTile(
            tileColor: _auth == Auth.signin
                ? GlobalVariable.backgroundColor
                : GlobalVariable.greyBackgroundCOlor,
            title: const Text(
              'Sign-In.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariable.secondaryColor,
              value: Auth.signin,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if (_auth == Auth.signin)
            Container(
              padding: const EdgeInsets.all(
                8.0,
              ),
              color: GlobalVariable.backgroundColor,
              child: Form(
                key: _signInFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'SignIn', onTap: () {})
                  ],
                ),
              ),
            ),
        ],
      )),
    );
  }
}