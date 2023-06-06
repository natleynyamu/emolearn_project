import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:on_boarding/auth/signup.dart';
import 'package:on_boarding/home/start-up/start.dart';

//Link to privacy policy
final Uri _url = Uri.parse(
    'https://docs.google.com/document/d/1PKbKpqLnXx61Bt-OPL15Q7dgB9uSVd__R3C5t1njIig/edit?usp=sharing');

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('userscore'),
      builder: (BuildContext context, AsyncSnapshot<Box> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error opening Hive box: ${snapshot.error}');
          } else {
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const ProfileWithAccount();
                } else {
                  return const ProfileNoAccount();
                }
              },
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ProfileNoAccount extends StatelessWidget {
  const ProfileNoAccount({super.key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          elevation: 2.0,
          color: const Color.fromRGBO(251, 247, 253, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 40.0, bottom: 40.0),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/images/stars.png", width: 136.0, height: 65.0)
                ]),
                const SizedBox(
                  height: 32.0,
                ),
                const Text("Create an account to track your performance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(62, 20, 82, 1.0))),
                const SizedBox(
                  height: 48.0,
                ),
                TextButton(
                    onPressed: ((() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignupPage())));
                    })),
                    child: Container(
                        // width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(62, 20, 82, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 32.0),
                            child: Text(
                              "Create an account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.white),
                            )))),
                const SizedBox(
                  height: 64.0,
                ),
                OutlinedButton(
                    onPressed: _launchUrl,
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size.fromWidth(310.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        side: const BorderSide(
                            width: 1, color: Color.fromRGBO(62, 20, 82, 1.0))),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Privacy and security",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0)),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.angleRight,
                                  color: Color.fromRGBO(62, 20, 82, 1.0),
                                  size: 18.0,
                                )),
                          ],
                        ))),
              ]))),
    ]);
  }
}

class ProfileWithAccount extends StatefulWidget {
  const ProfileWithAccount({super.key});

  @override
  State<ProfileWithAccount> createState() => _ProfileWithAccountState();
}

class _ProfileWithAccountState extends State<ProfileWithAccount> {
  Future signingOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  late final Box sampleBox;

  @override
  void initState() {
    super.initState();
    sampleBox = Hive.box('userscore');
  }

  @override
  void dispose() {
    sampleBox.close();
    super.dispose();
  }

  // A function uses Hive to retrieve an integer value called "score"
  // from a Hive box called "sampleBox". 
  //If the box is empty, it returns 0 as the default value. 
  //Otherwise, it retrieves the value stored in the "score" key
  // and returns it as an integer.
  Future<int> displayScore() async {
    await Hive.openBox('userscore');
    try {
      if (sampleBox.isEmpty) {
        return 0;
      } else {
        return sampleBox.get('score');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting score from sampleBox: $e');
      }
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Creating a FutureBuilder widget whcih takes the displayScore() function 
    // as its future argument and returns the score in the Text widget
    // when the future completes. If the future has not yet completed, 
    // a CircularProgressIndicator is displayed instead.
    return FutureBuilder<int>(
      future: displayScore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return a loading indicator while the score is being fetched
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // handle any errors that may occur while fetching the score
          return Text('Error: ${snapshot.error}');
        } else {
          // display the score if it was fetched successfully
          return Column(children: [
            const SizedBox(
              height: 8.0,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40.0, bottom: 40.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/profile.png",
                                width: 216.0, height: 68.95)
                          ]),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/avatar.png",
                                width: 136.0, height: 65.0),
                            Text(
                              "${FirebaseAuth.instance.currentUser!.displayName}",
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0)),
                            ),
                          ]),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Points:",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0)),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "${snapshot.data}",
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0),
                                  textBaseline: TextBaseline.alphabetic),
                            ),
                          ]),
                      const SizedBox(
                        height: 64.0,
                      ),
                      TextButton(
                          onPressed: ((() {
                            // add logout logic here
                            signingOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()));
                          })),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(62, 20, 82, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0))),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 32.0),
                                  child: Text(
                                    "Log Out",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24.0, color: Colors.white),
                                  )))),
                    ],
                  ),
                )),
          ]);
        }
      },
    );
  }
}
