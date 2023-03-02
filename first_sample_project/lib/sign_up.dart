import 'package:first_sample_project/new_login_ui.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

void main() => runApp(MaterialApp(
  home: signUp(),
));

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool _isObscure = true;
  List<TextEditingController> textControllers = List.generate(5, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Container(
        color: Color.alphaBlend(Colors.indigo, Colors.white30),
        child: ListView(

          children: [

            Container(

              margin: EdgeInsets.fromLTRB(5, screenHeight / 10, 5, 15),
              width: screenWidth / 2,
              height: screenHeight / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // stops: const [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Color.fromRGBO(75,66,147, 0.8),
                    Color.fromRGBO(75,66,147, 1),
                    Color.fromRGBO(8,65,142, 1),
                    Color.fromRGBO(8,65,142, 1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('asset/space-3.jpg', height: screenHeight / 6, width: screenHeight / 10),
                  ),

                  Container(
                    child: Text('Please sign in to continue', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: TextField(
                      controller: textControllers[0],
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          prefixIcon: Icon(Icons.account_box, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: TextField(
                      controller: textControllers[1],
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          prefixIcon: Icon(Icons.phone_android, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: TextField(
                      controller: textControllers[2],
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          prefixIcon: Icon(Icons.mail, color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: TextField(
                      controller: textControllers[3],
                      style: TextStyle(color: Colors.grey),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.grey,),
                          onPressed: (){
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: TextField(
                      controller: textControllers[4],
                      style: TextStyle(color: Colors.grey),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.grey,),
                          onPressed: (){
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const loginUi()),
                        );

                        for (int i=0;i<5;i++){
                          print(textControllers[i].text);
                        }
                      },
                      child: Text('Sign up'),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                          // fixedSize: Size(MediaQuery.of(context).size.width, 10),
                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10)
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('If you have an account', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ),

                  Container(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const loginUi()),
                        );
                      },
                      child: Text('Sign in'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.alphaBlend(Colors.indigo, Colors.white30),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
