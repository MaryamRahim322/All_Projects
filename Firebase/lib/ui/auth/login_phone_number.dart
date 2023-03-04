import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/auth/verify_code.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/round_button.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            const SizedBox(
              height: 230,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: '  +1 234 3455 234'),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundButton(
                loading: loading,
                title: 'Login',
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  // auth.verifyPhoneNumber(
                  //     verificationCompleted: (_) {},
                  //     verificationFailed: (e) {
                  //       Text(e.toString());
                  //     },
                  //     codeSent: (verificationId, forceResendingToken) {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => VerifyCodeScreen(
                  //                   verificationId: verificationId)));
                  //     },
                  //     codeAutoRetrievalTimeout: (e) {
                  //       Text(e.toString());
                  //     });

                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen(
                                    verificationId: verificationId)));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                })
          ],
        ),
      ),
    );
  }
}
