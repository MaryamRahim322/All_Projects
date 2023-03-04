import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String dropdownvalue = 'Seller';
  // List of items in our dropdown menu
  var items = [
    'Seller',
    'Purchaser',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Material Sign Up',
                style: const TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: "Phone No",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: usernameController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "UserName",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: fnameController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "First Name",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Last Name",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "City",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Country",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "State",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                height: 50,
                disabledColor: Colors.blueAccent,
                child: ElevatedButton(
                  child: Text("SignUp"),
                  onPressed: () {
                    makePostRequest();
                  },
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  Future<void> makePostRequest() async {
    final url = Uri.parse('http://realestate.tecrux.net/api/v1/register');
    final headers = {"Content-type": "application/json"};
    // ignore: prefer_const_declarations
    final json =
        '{"email": "aqib@gmail.com", "password": "gh12345","phone": "123457244", "username": "qwey ", "fname": "afg", "lname": "hl",  "city": "raindi ","country": "punjab ","state": "pakistan" }';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
