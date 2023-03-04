import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/ui/FireStore/firestore.dart';
import 'package:practice/ui/auth/forget_password.dart';
import 'package:practice/ui/auth/login_phone_number.dart';
import 'package:practice/ui/auth/signup_screen.dart';
import 'package:practice/ui/posts/posts_screen.dart';
import 'package:practice/ui/upload_image.dart';
import 'package:practice/widgets/round_button.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

//   void login() {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              // helperText: 'Enter email e.g abc@gmail.com',
                              prefixIcon: Icon(Icons.alternate_email)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              // helperText: 'Enter email e.g abc@gmail.com',
                              prefixIcon: Icon(Icons.lock_open)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter passsword';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )),
                RoundButton(
                  title: 'login',
                  loading: loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      // login();
                      _auth
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text.toString())
                          .then((value) {
                        Utils().toastMessage(value.user!.email.toString());
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FireStoreScreen()));
                        setState(() {
                          loading = false;
                        });
                      }).onError((error, stackTrace) {
                        debugPrint(error.toString());
                        Utils().toastMessage(error.toString());

                        setState(() {
                          loading = false;
                        });
                      });
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordScreen()));
                      },
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(fontSize: 17),
                      )),
                ),
                const SizedBox(
                  height: 0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LoginWithPhoneNumber()));
                  },
                  child: Container(
                    height: 52,
                    width: 336,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      'Login with Phone ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadImageScreen()));
                  },
                  child: Container(
                    height: 52,
                    width: 336,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      'Image Upload ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PostScreen()));
                      },
                      child: Container(
                        height: 48,
                        width: 155,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'Realtime ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FireStoreScreen()));
                      },
                      child: Container(
                        height: 48,
                        width: 142,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'Firestore ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '  Dont have an account?',
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
