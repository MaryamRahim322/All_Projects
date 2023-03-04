import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/FireStore/add_firestore_data.dart';
import 'package:practice/ui/auth/login_screen.dart';
import 'package:practice/utils/utils.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  // final ref1 = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('FireStore'),
        actions: [
          IconButton(
              iconSize: 27,
              onPressed: (() {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              }),
              icon: const Icon(Icons.logout_outlined)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 19,
          ),
          //fetch update delete data
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) return const Text('Some Error');
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final title =
                              snapshot.data!.docs[index]['title'].toString();
                          return Card(
                            color: const Color.fromARGB(255, 177, 176, 176),
                            child: ListTile(
                              onTap: () {
                                // ref
                                //     .doc(snapshot.data!.docs[index]['id']
                                //         .toString())
                                //     .update({'title': 'mmmmmmmmm'}).then((value) {
                                //   Utils().toastMessage('Updated');
                                // }).onError((error, stackTrace) {
                                //   Utils().toastMessage(error.toString());
                                // });

                                // ref
                                //     .doc(snapshot.data!.docs[index]['title']
                                //         .toString())
                                //     .delete();
                              },
                              title: Text(snapshot.data!.docs[index]['title']
                                  .toString()),
                              subtitle: Text(
                                  snapshot.data!.docs[index]['id'].toString()),
                              trailing: PopupMenuButton(
                                  icon: const Icon(Icons.more_vert),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              showMyDialog(
                                                  snapshot.data!
                                                      .docs[index]['title']
                                                      .toString(),
                                                  snapshot
                                                      .data!.docs[index]['id']
                                                      .toString());
                                              // ref
                                              //     .doc(snapshot
                                              //         .data!.docs[index]['id']
                                              //         .toString())
                                              //     .update({
                                              //   'title': 'mmmmmmmmm'
                                              // }).then((value) {
                                              //   Utils().toastMessage('Updated');
                                              // }).onError((error, stackTrace) {
                                              //   Utils().toastMessage(
                                              //       error.toString());
                                              // });
                                            },
                                            leading: const Icon(Icons.edit),
                                            title: const Text('Edit'),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              ref
                                                  .doc(snapshot
                                                      .data!.docs[index]['id']
                                                      .toString())
                                                  .delete();
                                            },
                                            leading: const Icon(
                                                Icons.delete_outlined),
                                            title: const Text('Delete'),
                                          ),
                                        )
                                      ]),
                            ),
                          );
                        }));
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFireStoreDataScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: SizedBox(
              height: 10,
              child: TextFormField(
                // maxLines: 2,
                controller: editController,
                decoration: const InputDecoration(hintText: 'Edit'),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    ref
                        .doc(id)
                        .update({'title': editController.text}).then((value) {
                      Utils().toastMessage('Updated');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });

                    //for update
                  }),
                  child: const Text('Update')),
            ],
          );
        });
  }
}
