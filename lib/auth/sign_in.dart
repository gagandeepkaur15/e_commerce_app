// ignore_for_file: library_private_types_in_public_api

import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserProvider? userProvider;
  _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // ADD USER DATA TO USER DATA COLLECTION IN FIREBASE

      final User? user = (await auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider!.addUserData(
          currentUser: user,
          userName: user!.displayName,
          userEmail: user.email,
          userImage: user.photoURL);

      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Craft',
                  style: GoogleFonts.merienda(
                      fontSize: 50,
                      color: Colors.white,
                      shadows: [
                        const BoxShadow(
                          blurRadius: 5,
                          color: Color.fromARGB(255, 36, 9, 9),
                          offset: Offset(3, 3),
                        )
                      ]),
                ),
                Text(
                  'Bazaar',
                  style: GoogleFonts.merienda(
                      fontSize: 50,
                      color: Colors.white,
                      shadows: [
                        const BoxShadow(
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
