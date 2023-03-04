import 'dart:convert';
import 'package:app/signup.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Material Login',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ],
          ),
          SizedBox(
            height: 90.0,
          ),
          Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                showCursor: true,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                ),
                onChanged: (value) {
                  print('value is' + value);
                  // _email = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email here';
                  }
                  //return value.isEmpty ? 'Enter email':null;
                  print(value);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: true,
                showCursor: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                ),
                onChanged: (value) {
                  if (value == null || value.isEmpty) {}
                  return null;
                  // _password = value;
                  // print(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password here';
                  }
                  return null;
                },
                // return value. ? 'Enter password':null;
                // print(value);
              ),
            ]),
          )
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: "Email",
          //     labelStyle: TextStyle(fontSize: 20),
          //     filled: true,
          //   ),
          //   onChanged: ((value) {
          //   }),
          // ),
          // SizedBox(
          //   height: 20.0,
          // ),
          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     labelText: "Password",
          //     labelStyle: TextStyle(fontSize: 20),
          //     filled: true,
          //   ),
          // ),
          ,
          // ignore: prefer_const_constructors
          SizedBox(
            height: 240.0,
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                height: 50,
                disabledColor: Colors.blueAccent,
                child: ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    // print(emailController.text);
                    if (_formKey.currentState!.validate()) {}
                    makePostRequest();
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                child: Text(
                  'New User? SignUp here',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signup()),
                  );
                },
              )
            ],
          )
        ],
      )),
    );
  }

  Future<void> makePostRequest() async {
    final url = Uri.parse('http://realestate.tecrux.net/api/v1/login');
    final headers = {"Content-type": "application/json"};
    //final json = '{"email": "rs8926000095@gmail.com", "password": "test1234" }';
    final response = await post(url,
        headers: headers,
        body: jsonEncode(
            {"email": "rs8926000095@gmail.com", "password": "test1234"}));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
