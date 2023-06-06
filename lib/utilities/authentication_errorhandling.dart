import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorHandling {
  Future<void> dialogBox(String subtitle, BuildContext context) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0XFF3E1452,),
                  width: 2.0,
                ) ,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              backgroundColor: const Color.fromRGBO(235, 214, 245, 1.0),
              elevation: 1.0,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/alert.png',
                      height: 50,
                      width: 166,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'Error occurred',
                      style: TextStyle(
                        color: Color(0XFF9B0404),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0XFF3E1452),
                    fontSize: 24,
                  ),
                ),
              ),
              actions: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                  child: SizedBox(
                    width: 180,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF52143F),
                          minimumSize: const Size.fromHeight(52),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24)),
                          ),
                          side: const BorderSide(
                              width: 1, color: Color(0xFF52143F)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  FontAwesomeIcons.circleArrowLeft,
                                  color: Color.fromRGBO(62, 20, 82, 1.0),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color.fromRGBO(62, 20, 82, 1.0)),
                            )
                          ],
                        )),
                
                  ),
                ),
              ],
            );
          });
}
