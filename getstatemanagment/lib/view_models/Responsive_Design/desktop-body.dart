import 'package:flutter/material.dart';

class DesktopBodyScreen extends StatefulWidget {
  const DesktopBodyScreen({super.key});

  @override
  State<DesktopBodyScreen> createState() => _DesktopBodyScreenState();
}

class _DesktopBodyScreenState extends State<DesktopBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(title: const Text('D E S K T O P')),
      body: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              //utube video
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
                          height: 20,
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            color: Colors.deepPurple[300],
          ),
        )
      ]),
    );
  }
}
