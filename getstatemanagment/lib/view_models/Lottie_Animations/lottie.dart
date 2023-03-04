import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstatemanagment/view_models/Lottie_Animations/coffee.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationScreen extends StatefulWidget {
  // final String title;
  const LottieAnimationScreen({
    super.key,
  });

  @override
  State<LottieAnimationScreen> createState() => _LottieAnimationScreenState();
}

class _LottieAnimationScreenState extends State<LottieAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAnimating = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // duration: const Duration(seconds: 4)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'C O F F E E',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.black,
      ),
      body: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                Center(
                  child: Lottie.network(
                    // 'https://assets9.lottiefiles.com/private_files/lf30_72kogvb9.json',
                    'https://assets6.lottiefiles.com/packages/lf20_GZ1sK1.json',

                    controller: _controller,
                    onLoaded: (composition) {
                      //for defult duration
                      _controller.duration = composition.duration;
                      // _controller.forward();
                      //for repeat
                      // _controller.repeat();
                    },
                    // repeat: false
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(28.0),
                //   child: Container(
                //     height: 50,
                //     width: 80,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(40), color: Colors.black),
                //     child: TextButton(
                //         onPressed: () {
                //           if (_controller.isAnimating) {
                //             _controller.stop();
                //             setState(() {
                //               isAnimating = false;
                //             });
                //           } else {
                //             _controller.forward();
                //             setState(() {
                //               isAnimating = true;
                //             });
                //           }
                //         },
                //         child: Text(isAnimating ? 'Stop' : 'Play',
                //             style:
                //                 const TextStyle(fontSize: 20, color: Colors.white))),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_controller.isAnimating) {
                          _controller.stop();
                          setState(() {
                            isAnimating = false;
                          });
                        } else {
                          _controller.repeat();
                          setState(() {
                            isAnimating = true;
                          });
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      child: Text(isAnimating ? 'Stop' : 'Play')),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(const CoffeeScreen());
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text('Coffe UI'))
              ],
            );
          }),
      // body: Column(
      //   children: [
      //     const SizedBox(
      //       height: 160,
      //     ),
      //     Center(
      //       child: Lottie.network(
      //         // 'https://assets9.lottiefiles.com/private_files/lf30_72kogvb9.json',
      //         'https://assets6.lottiefiles.com/packages/lf20_GZ1sK1.json',

      //         controller: _controller,
      //         onLoaded: (composition) {
      //           //for defult duration
      //           _controller.duration = composition.duration;
      //           // _controller.forward();
      //           //for repeat
      //           // _controller.repeat();
      //         },
      //         // repeat: false
      //       ),
      //     ),
      //     // Padding(
      //     //   padding: const EdgeInsets.all(28.0),
      //     //   child: Container(
      //     //     height: 50,
      //     //     width: 80,
      //     //     decoration: BoxDecoration(
      //     //         borderRadius: BorderRadius.circular(40), color: Colors.black),
      //     //     child: TextButton(
      //     //         onPressed: () {
      //     //           if (_controller.isAnimating) {
      //     //             _controller.stop();
      //     //             setState(() {
      //     //               isAnimating = false;
      //     //             });
      //     //           } else {
      //     //             _controller.forward();
      //     //             setState(() {
      //     //               isAnimating = true;
      //     //             });
      //     //           }
      //     //         },
      //     //         child: Text(isAnimating ? 'Stop' : 'Play',
      //     //             style:
      //     //                 const TextStyle(fontSize: 20, color: Colors.white))),
      //     //   ),
      //     // ),
      //     Padding(
      //       padding: const EdgeInsets.all(18.0),
      //       child: ElevatedButton(
      //           onPressed: () {
      //             if (_controller.isAnimating) {
      //               _controller.stop();
      //               setState(() {
      //                 isAnimating = false;
      //               });
      //             } else {
      //               _controller.repeat();
      //               setState(() {
      //                 isAnimating = true;
      //               });
      //             }
      //           },
      //           style: const ButtonStyle(
      //               backgroundColor: MaterialStatePropertyAll(Colors.black)),
      //           child: Text(isAnimating ? 'Stop' : 'Play')),
      //     ),
      //     ElevatedButton(
      //         onPressed: () {
      //           Get.to(const CoffeeScreen());
      //         },
      //         style: const ButtonStyle(
      //             backgroundColor: MaterialStatePropertyAll(Colors.black)),
      //         child: const Text('Coffe UI'))
      //   ],
      // ),
    );
  }
}
