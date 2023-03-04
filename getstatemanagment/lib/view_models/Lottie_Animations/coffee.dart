import 'package:flutter/material.dart';
import 'package:getstatemanagment/utils/coffee_type.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({
    super.key,
  });

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  // list of coffeee types
  final List coffeeTypes = [
    //[ coffee type,is Selected]
    [
      'Cuppucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ]
  ];
//user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notification_add,
                color: Colors.black,
              ),
              label: ''),
        ]),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  'Find the Best Coffee for U..',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 33,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Find your  coffee..',
                    hintStyle: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 178, 131, 60)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //horizontal listview of coffeee types
            SizedBox(
                height: 50,
                // width: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeTypes.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                          coffeeType: coffeeTypes[index][0],
                          isSelected: coffeeTypes[index][1],
                          onTap: () {
                            coffeeTypeSelected(index);
                          });
                    })),
            // Horizontal listview of coffee titles
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Image(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/11901524/pexels-photo-11901524.jpeg?auto=compress&cs=tinysrgb&w=600')),
                          ),
                          //cpffee name
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Cuppucino',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white70),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '  With Almond Milk',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //price
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$ 9.00',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 20),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.add))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // 2nd
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 58),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Image(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/11276232/pexels-photo-11276232.jpeg?auto=compress&cs=tinysrgb&w=600')),
                          ),
                          //cpffee name
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Black',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white70),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '  With Almond Milk',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //price
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$ 6.70',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 20),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.add))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 58),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Image(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/7952756/pexels-photo-7952756.jpeg?auto=compress&cs=tinysrgb&w=600')),
                          ),
                          //Coffee name
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Tea',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white70),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '  With Almond Milk',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //price
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$ 7.90',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 20),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.add))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //3rd

                  //4
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 58),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Image(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=600')),
                          ),
                          //cpffee name
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Latte',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white70),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '  With Almond Milk',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //price
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$ 8.00',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 20),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Icon(Icons.add))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Horizontal listview of coffee titles

            // Expanded(
            //     child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: const [
            //     CoffeeTile(
            //         coffeeImagePath:
            //             'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=600',
            //         coffeeName: 'Cuppucino',
            //         cofffeePrice: '4.20'),
            //     CoffeeTile(
            //         coffeeImagePath:
            //             'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=600',
            //         coffeeName: 'Black',
            //         cofffeePrice: '4.10'),
            //     CoffeeTile(
            //         coffeeImagePath:
            //             'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=600',
            //         coffeeName: 'Milk Coffee thing',
            //         cofffeePrice: '4.60'),
            //     CoffeeTile(
            //         coffeeImagePath:
            //             'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=600',
            //         coffeeName: 'Tea',
            //         cofffeePrice: '4.80')
            //   ],
            // ))
          ],
        ));
  }
}
