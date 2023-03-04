import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/FireStore/firestore.dart';
import 'package:practice/ui/auth/login_screen.dart';
import 'package:practice/utils/utils.dart';
import 'package:practice/widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  // void signup() {
  //   setState(() {
  //     loading = true;
  //   });
  //   _auth
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text.toString(),
  //           password: passwordController.text.toString())
  //       .then((value) {
  //     Utils().toastMessage(value.user!.email.toString());
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const PostScreen()));
  //     setState(() {
  //       loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     debugPrint(error.toString());
  //     Utils().toastMessage(error.toString());

  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                title: 'Sign Up',
                loading: loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    _auth
                        .createUserWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString())
                        .then((value) {
                      Utils().toastMessage(value.user!.email.toString());
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '  Already have an account?',
                    style: TextStyle(fontSize: 16.5),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16.5),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
