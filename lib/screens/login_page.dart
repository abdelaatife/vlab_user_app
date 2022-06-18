
// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vlab/screens/homeScreens/home_page.dart';
import 'package:vlab/screens/sigup_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isinprogrese = false;

  var _mypassword, _myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var message;
  singin() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _myemail, password: _mypassword);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        setState(() {
          if (e.code == 'user-not-found') {
            message = 'No user found for that email.';
          } else if (e.code == 'wrong-password') {
            message = 'Wrong password provided for that user.';
          }
        });
      } catch (e) {
        print(e);
      }
    }
  }
  double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            
            margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 27,
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person,
                        color: Colors.black38,
                        size: 45,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sign in ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                message != null
                    ? Text(
                        message.toString(),
                        style: const TextStyle(color: Colors.red),
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('E-mail ',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /*phone input */
                      TextFormField(
                        onSaved: (val) {
                          _myemail = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add your email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9))),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      /*password input */
                      Row(
                        children: [
                          const Text('Password ',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (val) {
                          _mypassword = val;
                        },
                        validator: (val) {
                          if (val!.length < 5) {
                            return "password can't be less than 4 letter";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9))),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {},
                              child: const Text(
                                'forget your password ?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /*submit button */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () async {
                              await singin();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 105, vertical: 18),
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            height: 50,
                            color: Colors.teal,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('or ',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const signunpage()));
                      },
                      child: const Text('Sign up ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
