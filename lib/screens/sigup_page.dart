import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vlab/screens/homeScreens/home_page.dart';
import 'package:vlab/screens/login_page.dart';

class signunpage extends StatefulWidget {
  const signunpage({Key? key}) : super(key: key);

  @override
  _signunpageState createState() => _signunpageState();
}

class _signunpageState extends State<signunpage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isinprogrese = false;

  var mypassword, vpassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var message;
  singin() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        setState(() {
          if (e.code == 'weak-password') {
            message = 'The password provided is too weak.';
          } else if (e.code == 'email-already-in-use') {
            message = 'The account already exists for that email.';
          }
        });
      }
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const loginPage()));
                        },
                        icon: const Icon(LineIcons.angleLeft))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 27,
                      backgroundColor: Colors.black12,
                      child:  Icon(
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
                    const Text('Sign up ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                message != null
                    ? Text(
                        message.toString(),
                        style: const TextStyle(color: Colors.red),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('E-mail ',
                              style:  TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      /*phone input */
                      TextFormField(
                        onSaved: (val) {
                          myemail = val;
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

                      /*password input */
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text('Password ',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          vpassword = val;
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
                      /* confirme password */
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text('Confirme Password ',
                              style:  TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          mypassword = val;
                        },
                        validator: (val) {
                          if (vpassword != mypassword) {
                            return "password not muched";
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
                      Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
