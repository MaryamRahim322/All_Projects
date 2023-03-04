import 'package:flutter/material.dart';
import 'package:shared__preferences/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString(
          'email',
        ) ??
        '';
    age = sp.getString(
          'age',
        ) ??
        "";
    print('avcxcca');
    // setState(() {});
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Email:'),
              Text(email.toString()),
              // const Text('Age:'),
              // Text(age.toString()),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Text('Email:'),
              // Text(email),
              const Text('Age:'),
              Text(age.toString()),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              // sp.setString('email', emailController.text.toString());
              // sp.setString('age', ageController.text.toString());
              // sp.setBool('isLogin', true);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));

              // print('Tap');
              // SharedPreferences sp = await SharedPreferences.getInstance();
              // sp.setString('name', 'maryam');
              // sp.setInt('age', 21);
              // sp.setBool('isLogin', false);

              // // for get
              // print(sp.getString('name'));
              // print(sp.getInt('age').toString());
              // print(sp.getBool('isLogin').toString());

              // // FOR REMOVE
              // sp.remove('name');
              // print(sp.getString('name'));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.green,
              child: const Center(child: Text('Logout')),
            ),
          )
        ],
      ),
    );
  }
}
