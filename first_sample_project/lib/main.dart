import 'package:flutter/material.dart';
import 'dart:developer' as logDev;

import 'package:passwordfield/passwordfield.dart';

void main() => runApp(MaterialApp(
  home:MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final myController = TextEditingController();
  final myController_2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign in page'),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text('Sign in page', style: TextStyle(color: Colors.blueAccent, fontSize: 24)),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text('Sign in', style: TextStyle(color: Colors.black, fontSize: 16)),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your username'
                ),),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: PasswordField(
                  passwordConstraint: r'.*[@$#.*].*',
                  controller: myController_2,
                  inputDecoration: PasswordDecoration(),
                    border: PasswordBorder(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(width: 2, color: Colors.red.shade200),
                      ),
                    ),
                    hintText: 'Enter your password',
                    errorMessage: 'must contain special character either . * @ # \$',
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text('Forgot Password', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  onPressed: () {
                    print(myController.text);
                    print(myController_2.text);
                  },
                  child: Text('Login'),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      fixedSize: Size(MediaQuery.of(context).size.width, 10)
                  ),
                ),
              ),

              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 5, 0, 10, 0),
                        child: Text('Does not have account?'),
                      ),

                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Sign up'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),),

            ],
          ),
        ],
      )

    );
  }


}
