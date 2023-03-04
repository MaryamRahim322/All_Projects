import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/auth/login_screen.dart';
import 'package:practice/ui/posts/add_post.dart';
import 'package:practice/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('POST');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Posts'),
        actions: [
          IconButton(
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
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: '  Search',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ),

          //Using Firebase Animated list
          const SizedBox(
            height: 8,
          ),
          Expanded(
            // flex: 1,
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: const Center(
                    child: Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30),
                )),
                itemBuilder: ((context, snapshot, animation, index) {
                  //For Searchfilter
                  final title = snapshot.child('title').value.toString();
                  if (searchFilter.text.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Card(
                        color: const Color.fromARGB(255, 177, 176, 176),
                        child: ListTile(
                            title: Text(
                              snapshot.child('title').value.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                            ),
                            subtitle: Text(
                              snapshot.child('id').value.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            trailing: PopupMenuButton(
                                icon: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.pop(context);
                                            showMyDialog(
                                                title,
                                                snapshot
                                                    .child('title')
                                                    .value
                                                    .toString());
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
                                                .child(snapshot
                                                    .child('id')
                                                    .value
                                                    .toString())
                                                .remove();
                                          },
                                          leading:
                                              const Icon(Icons.delete_outlined),
                                          title: const Text('Delete'),
                                        ),
                                      )
                                    ])),
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                      searchFilter.text.toLowerCase().toLowerCase())) {
                    return Container(
                      width: 210,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 163, 161, 161),
                        border: Border.all(
                          width: 3.4,
                          color: const Color.fromARGB(255, 242, 242, 242),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListTile(
                            title: Text(
                              snapshot.child('title').value.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23),
                            ),
                            subtitle: Text(
                              snapshot.child('id').value.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            trailing: PopupMenuButton(
                                icon: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.pop(context);
                                            showMyDialog(
                                                title,
                                                snapshot
                                                    .child('title')
                                                    .value
                                                    .toString());
                                          },
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Edit'),
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: 2,
                                        child: ListTile(
                                          leading: Icon(Icons.delete_outlined),
                                          title: Text('Delete'),
                                        ),
                                      )
                                    ])),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = id;
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
                    //for update
                    ref
                        .child(id)
                        .update({'title': editController.text.toLowerCase()})
                        .then((value) => Utils().toastMessage('Post Updated'))
                        .onError((error, stackTrace) =>
                            Utils().toastMessage(error.toString()));
                  }),
                  child: const Text('Update')),
            ],
          );
        });
  }
}



// const Text(
          //   'StreamBuilder',
          //   style: TextStyle(
          //       color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
          // ),
          // Expanded(
          //     flex: 2,
          //     child: StreamBuilder(
          //       stream: ref.onValue,
          //       builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //         if (!snapshot.hasData) {
          //           return const CircularProgressIndicator();
          //         } else {
          //           Map<dynamic, dynamic> map =
          //               snapshot.data!.snapshot.value as dynamic;
          //           List<dynamic> list = [];
          //           list.clear();
          //           list = map.values.toList();
          //           return ListView.builder(
          //               itemCount: snapshot.data!.snapshot.children.length,
          //               itemBuilder: (context, index) {
          //                 return Container(
          //                   width: 210,
          //                   height: 80,
          //                   decoration: BoxDecoration(
          //                     color: const Color.fromARGB(255, 230, 230, 75),
          //                     border: Border.all(
          //                       width: 3.4,
          //                       color: const Color.fromARGB(255, 242, 242, 242),
          //                     ),
          //                     borderRadius: BorderRadius.circular(18),
          //                   ),
          //                   child: Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 12.0),
          //                     child: ListTile(
          //                       title: Text(
          //                         list[index]['title'].toString(),
          //                         style: const TextStyle(
          //                             color: Colors.white,
          //                             fontWeight: FontWeight.w500,
          //                             fontSize: 23),
          //                       ),
          //                       subtitle: Text(
          //                         list[index]['aa'].toString(),
          //                         style: const TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.w500,
          //                             fontSize: 14),
          //                       ),
          //                     ),
          //                   ),
          //                 );
          //               });
          //         }
          //       },
          //     )),
          // const Divider(
          //   thickness: 5,
          // ),
          // const Text(
          //   'FirebaseAnimatedList',
          //   style: TextStyle(
          //       color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
          // ),