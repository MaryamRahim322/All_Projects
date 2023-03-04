import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/posts/posts_screen.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final VerifyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            const SizedBox(
              height: 230,
            ),
            // Text(
            //       'Enter Pincode ',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 10.0,
            //     ),
            //     PinCodeFields(
            //       length: 6,
            //       obscureText: true,
            //       //obscureCharacter: '❌',
            //       onComplete: (text) {
            //         // Your logic with pin code
            //         print(text);
            //       },
            //     ),
            TextFormField(
              controller: VerifyCodeController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(hintText: ' Enter 6 digit code'),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundButton(
                loading: loading,
                title: 'Verify',
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final cred = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: VerifyCodeController.text);
                  try {
                    await auth.signInWithCredential(cred);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostScreen()));
                  } catch (e) {}

                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: VerifyCodeController.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostScreen()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
