//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:learning/widgets/story_circle.dart';

import '../widgets/insta_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //! Top Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage("assets/images/Logo.png")),
                  ],
                ),
                Row(
                  children: [
                    Image(image: AssetImage('assets/icons/heart.png')),
                    SizedBox(width: 10),
                    Image(image: AssetImage('assets/icons/chat.png')),
                    SizedBox(width: 10),
                    Image(image: AssetImage('assets/icons/add.png')),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          //! Stories
          Container(
            height: 95,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.3),
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://w7.pngwing.com/pngs/502/150/png-transparent-havanese-dog-pet-sitting-labrador-retriever-puppy-cat-pet-dog-animals-carnivoran-pet.png"),
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text('Ruffles')
                  ],
                ),
                StoryCircle(),
                StoryCircle(),
                StoryCircle(),
                StoryCircle(),
                StoryCircle(),
                StoryCircle(),
              ],
            ),
          ),
          Divider(),
          InstaPost(),
          InstaPost(),
          InstaPost(),
          InstaPost(),
          InstaPost(),
          InstaPost(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.videocam), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: ''),
        ],
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
