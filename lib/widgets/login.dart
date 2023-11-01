import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Value is Empty';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Value is Empty';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !_isDataMatched,
                  child: Text(
                    'Username password doesnot match',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('Data empty');
                      }
                    },
                    icon: Icon(Icons.check),
                    label: Text('Login')),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    // final _username = _usernameController.text;
    // final _password = _usernameController.text;
    if (_usernameController.text == 'shadh' &&
        _passwordController.text == 'shadh') {
      print('Username password is match');

      final _sharedprfs = await SharedPreferences.getInstance();
      await _sharedprfs.setBool(SAVE_KEY_NAME, true);
      //go to screen1
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Screen1()));
    } else
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("close"),
                  )
                ],
                title: Text(
                  "Mis match",
                  style: TextStyle(color: Colors.red),
                ),
                content: Text("You may enterd wrong password or user ID"),
              ));
  }
}
