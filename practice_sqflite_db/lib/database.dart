import 'package:flutter/material.dart';
import 'package:practice_sqflite_db/Services/db_helper.dart';

class DatabaseScreen extends StatelessWidget {
  DatabaseScreen({super.key});

  final EditController = TextEditingController();
  final UpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQFLite')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(34.0),
            child: TextFormField(
              controller: EditController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await DatabaseHelper.instance.insertRecord({
                  DatabaseHelper.columnName: EditController.text.toString()
                });
              },
              child: const Text('insert')),
          Padding(
            padding: const EdgeInsets.all(34.0),
            child: TextFormField(
              controller: UpdateController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await DatabaseHelper.instance.updateRecord({
                  DatabaseHelper.columnId: 4,
                  DatabaseHelper.columnName: UpdateController
                });
              },
              child: const Text('Update')),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var dbquery = await DatabaseHelper.instance.queryDatabase();
                    print(dbquery);
                  },
                  child: const Text('Read')),
              const SizedBox(
                width: 80,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.deleteRecord(4);
                  },
                  child: const Text('Delete')),
            ],
          )
        ],
      )),
    );
  }
}
