import 'package:flutter/material.dart';
import 'package:geeksnergy/signup_page.dart';
import 'package:hive/hive.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: () => _login(context),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Do not have an account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w900),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    var box = await Hive.openBox('userBox');
    String storedName = box.get('name', defaultValue: '');
    String storedPassword = box.get('password', defaultValue: '');

    if (nameController.text == storedName &&
        passwordController.text == storedPassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid Credentials'),
      ));
    }
  }
}
