import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_boarding/utilities/authentication_errorhandling.dart';
import 'package:on_boarding/main.dart';
import '../utilities/content_button.dart';
import 'login.dart';
import '../home/start-up/start.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage();
        } else {
          return const SignUp();
        }
      },
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final ErrorHandling _errorHandling = ErrorHandling();

  late String hintText;
  late final bool obsecureText;
  // inputs controller
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();
  
  // Overriding the dispose() method to dispose
  // of all controllers when the widget
  // is removed from the widget tree
  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    pwdController.dispose();
    confirmPwdController.dispose();
    super.dispose();
  }

  // user sign in method
  // Creating a new user using the email and password entered in the form. 
  // If the creation is successful, the username is updated as the display name 
  // of the user using the updateDisplayName() method. 
  // If an exception occurs during the creation, 
  // it shows an error message using the DialogBox() method of _errorHandling class
  // and clears the form fields. 
  // If the passwords don't match, 
  // it shows an error message and clears the form fields.
  Future userSignIn() async {
    final validated = formKey.currentState!.validate();
    if (!validated) return;
    if (confirmedPassword()) {
      try {
        UserCredential result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pwdController.text.trim(),
        );
        User? user = result.user;
        user?.updateDisplayName(usernameController.text.trim());
      } on FirebaseAuthException catch (e) {
        _errorHandling.dialogBox(e.message.toString(), context);
        emailController.clear();
        usernameController.clear();
        pwdController.clear();
        confirmPwdController.clear();
      }
    } else {
      _errorHandling.dialogBox("Passwords don't match", context);
      emailController.clear();
      usernameController.clear();
      pwdController.clear();
      confirmPwdController.clear();
    }
  }

  // The confirmedPassword function checks if the password 
  // entered by the user in the pwdController text field is 
  // the same as the password entered in the confirmPwdController text field. 
  // If the two passwords match, it returns true, indicating 
  // that the passwords are confirmed. Otherwise, 
  // it returns false, indicating that the passwords do not match.
  bool confirmedPassword() {
    if (pwdController.text.trim() == confirmPwdController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  const SizedBox(height: 20.0),
                  //Page description
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
                  // Email
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
                        //The validator function takes an email as input.
                        // checks if the email is empty and then returns the error message "Please enter an email".
                        // checks if the email ids valid and then return "Please enter a valid email".
                        // If both conditions are false, the function returns null to indicate that the email is valid.
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter an email';
                            } else if (!EmailValidator.validate(email)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 5),

                        // username
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Username',
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
                          controller: usernameController,
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

                          //The validator function takes a string value as input.
                          // checks if the value is empty and then returns the error message "Please enter a username".
                          // checks if the length of the value is less than 4 and then returns the error message "Username should be at least 4 characters".
                          // If both conditions are false, the function returns null to indicate that the value is valid.

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            if (value.length < 4) {
                              return 'Username must be at least 4 characters';
                            }
                            return null; // return null if the value is valid
                          },
                        ),

                        const SizedBox(height: 5),

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

                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Confirm password',
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
                          controller: confirmPwdController,
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

                          autovalidateMode: AutovalidateMode.onUserInteraction,
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

                  const SizedBox(height: 20.0),

                  //sign up button
                  PageButton(
                    onTap: userSignIn,
                  ),

                  const SizedBox(height: 10.0),

                  // ----------- already a member ----------
                  const Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Color(0xFF52143F),
                      fontFamily: 'Exo Space',
                      fontSize: 20.0,
                    ),
                  ),

                  const SizedBox(
                    height: 5.0,
                  ),
                  // sign in button
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
                                builder: ((context) => const LoginPage())));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color(0xFF2C2C3A),
                          fontFamily: 'Exo Space',
                          fontSize: 24.0,
                        ),
                      )),
                  const SizedBox(
                    height: 5.0,
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
