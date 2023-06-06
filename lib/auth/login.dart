import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_boarding/main.dart';
import 'package:on_boarding/home/start-up/start.dart';
import '../utilities/authentication_errorhandling.dart';
import '../utilities/login_button.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage();
        } else {
          return const LogIn();
        }
      },
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();

  String errorMessage = '';
  //The userLogIn() function takes the user's email and password, then signs in the user
  // using the signInWithEmailAndPassword method from Firebase Authentication. If the 
  //email and password are correct, the user will be signed in, otherwise an error message will 
  //be displayed using a custom DialogBox widget.
  Future userLogIn() async {
    final ErrorHandling errorHandling = ErrorHandling();
    final validated = formKey.currentState!.validate();
    if (!validated) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwdController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      errorHandling.dialogBox(e.message.toString(), context);
      emailController.clear();
      pwdController.clear();
    }
  }

  late String hintText;
  late final bool obsecureText;

  // inputs controller
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

   // Overriding the dispose() method to dispose
  // of all controllers when the widget
  // is removed from the widget tree
  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromRGBO(245, 235, 250, 1.0),
        Color.fromRGBO(235, 214, 245, 1.0),
      ])),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const StartScreen())));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        side: const BorderSide(
                            width: 1, color: Color.fromRGBO(62, 20, 82, 1.0))),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                        child: Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.circleArrowLeft,
                                  color: Color.fromRGBO(62, 20, 82, 1.0),
                                )),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Emolearn",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0)),
                            )
                          ],
                        ))),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Stars image
                  const Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/stars.png',
                      ),
                      fit: BoxFit.contain,
                      width: 120.0,
                      height: 60.0,
                    ),
                  ),

                  //Page description
                  const SizedBox(height: 20.0),
                  const Text(
                    "Create an account to track your performance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF52143F),
                      fontFamily: 'Exo Space',
                      fontSize: 20.0,
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Error message
                  Center(
                    child: Text(errorMessage),
                  ),
                  // email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF52143F),
                          fontFamily: 'Exo Space',
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF52143F)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF5D1E7B)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        //The validator function takes an email as input.
                        // checks if the email is empty and then returns the error message "Please enter an email".
                        // checks if the email ids valid and then return "Please enter a valid email".
                        // If both conditions are false, the function returns null to indicate that the email is valid.
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter an email';
                            } else if (!EmailValidator.validate(email)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        // Password

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF52143F),
                                fontFamily: 'Exo Space',
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        TextFormField(
                          controller: pwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF52143F)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF5D1E7B)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                          ),
                        //The validator function takes a string value as input.
                        // checks if the value is null or empty and then returns the error message "Please fill this field".
                        // checks if the length of the value is less than 6 and then returns the error message "Password should be at least 6 characters long".
                        // If both conditions are false, the function returns null to indicate that the value is valid.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill this field';
                            }
                            if (value.length < 6) {
                              return 'Password should be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  //sign in button
                  LoginButton(
                    onTap: userLogIn,
                  ),

                  const SizedBox(height: 10.0),

                  // ----------- New here ----------
                  const Text(
                    'New here?',
                    style: TextStyle(
                      color: Color(0xFF52143F),
                      fontFamily: 'Exo Space',
                      fontSize: 20.0,
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),

                  // sign up button

                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF52143F),
                        minimumSize: const Size.fromHeight(59),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        side: const BorderSide(
                            width: 1, color: Color(0xFF52143F)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignupPage())));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFF2C2C3A),
                          fontFamily: 'Exo Space',
                          fontSize: 24.0,
                        ),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
