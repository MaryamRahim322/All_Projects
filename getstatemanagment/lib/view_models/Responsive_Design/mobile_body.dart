import 'package:flutter/material.dart';

class MobileBodyScreen extends StatefulWidget {
  const MobileBodyScreen({super.key});

  @override
  State<MobileBodyScreen> createState() => _MobileBodyScreenState();
}

class _MobileBodyScreenState extends State<MobileBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(title: const Text('M O B I L E')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //utube vieo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                // height: 250,
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          //comment section
          Expanded(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepPurple[300],
                      height: 70,
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
