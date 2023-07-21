import 'package:e_commerce_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Boho',
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color.fromARGB(255, 36, 9, 9),
                      offset: Offset(3, 3),
                    )
                  ]),
                ),
                const Text(
                  'Bazaar',
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color.fromARGB(255, 36, 9, 9),
                      offset: Offset(3, 3),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign in with Apple",
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () async {
                        await _googleSignUp().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'By signing in you are agreeing to our',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      'Terms and Pricacy Policy',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
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
