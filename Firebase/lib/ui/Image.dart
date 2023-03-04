// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:practice/utils/utils.dart';

// class FirestoreImageUpload extends StatefulWidget {
//   const FirestoreImageUpload({super.key});

//   @override
//   State<FirestoreImageUpload> createState() => _FirestoreImageUploadState();
// }

// class _FirestoreImageUploadState extends State<FirestoreImageUpload> {
//   CollectionReference products =
//       FirebaseFirestore.instance.collection('products');

//   bool loading = false;

//   File? _image;

//   final picker = ImagePicker();

//   Future imagePicker() async {
//     try {
//       final pick = await picker.pickImage(
//         source: ImageSource.gallery,
//       );
//       setState(() {
//         if (pick != null) {
//           _image = File(pick.path);
//         } else {
//           print('no Image selected');
//         }
//       });
//     } catch (e) {
//       Utils().toastMessage(e.toString());
//     }
//   }

// // ignore: no_leading_underscores_for_local_identifiers
//   Future uploadImage(File _image) async {
//     Reference reference = FirebaseStorage.instance.ref().child('images');
//     await reference.putFile(_image);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Image Upoad')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//                 height: 340,
//                 width: 360,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     shape: BoxShape.rectangle,
//                     border: Border.all(
//                       color: Colors.pink,
//                     )),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: _image == null
//                             ? const Center(
//                                 child: Text('no image selected'),
//                               )
//                             : Image.file(
//                                 _image!,
//                                 fit: BoxFit.cover,
//                               ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           imagePicker().then((value) => uploadImage(_image!));
//                         },
//                         child: const Text('SELECT IMAGE'),
//                       )
//                     ],
//                   ),
//                 )),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(32.0),
//           //   child: RoundButton(
//           //       loading: loading,
//           //       title: 'Upload',
//           //       onTap: () async {
//           //         imagePicker().then((value) {
//           //           uploadImage(_image!);
//           //         }
//           // );
//           //         // setState(() {
//           //         //   loading = true;
//           //         // });
//           //         // firebase_storage.Reference ref = firebase_storage
//           //         //     .FirebaseStorage.instance
//           //         //     .ref('/maryam/${DateTime.now().microsecondsSinceEpoch}');
//           //         // firebase_storage.UploadTask uploadTask =
//           //         //     ref.putFile(_image!.absolute);

//           //         // Future.value(uploadTask).then((value) async {
//           //         //   var newUrl = await ref.getDownloadURL();
//           //         //   databaseRef
//           //         //       .child('1')
//           //         //       .set({'id': '1212', 'title': newUrl.toString()}).then(
//           //         //           (value) {
//           //         //     setState(() {
//           //         //       loading = false;
//           //         //     });
//           //         //     Utils().toastMessage('Uploaded');
//           //         //   }).onError(
//           //         //     (error, stackTrace) {
//           //         //       setState(() {
//           //         //         loading = false;
//           //         //       });
//           //         //       Utils().toastMessage(error.toString());
//           //         //     },
//           //         //   );
//           //         // }).onError((error, stackTrace) {
//           //         //   setState(() {
//           //         //     loading = false;
//           //         //   });
//           //         //   Utils().toastMessage(error.toString());
//           //         // });
//           //       }),
//           // )
//         ],
//       ),
//     );
//   }

//   Future<void> showMyDialog() async {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Upload Image'),
//             actions: [
//               TextButton(
//                   onPressed: (() {
//                     Navigator.pop(context);
//                     imagePicker();
//                   }),
//                   child: const Text(
//                     'Camera',
//                   )),
//               TextButton(
//                   onPressed: (() {
//                     Navigator.pop(context);
//                     imagePicker();
//                     //for update
//                   }),
//                   child: const Text('Gallery')),
//             ],
//           );
//         });
//   }
// }
