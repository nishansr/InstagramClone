import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:like_button/like_button.dart';

class InstaPost extends StatefulWidget {
  const InstaPost({super.key});

  @override
  State<InstaPost> createState() => _InstaPostState();
}

class _InstaPostState extends State<InstaPost> {
  int pageIndex = 0;
  List<String> images = [
    'https://www.publicdomainpictures.net/pictures/50000/velka/dog-1373273591Tqi.jpg',
    'https://www.publicdomainpictures.net/pictures/170000/velka/dog-1463217877Fwe.jpg',
    'https://www.publicdomainpictures.net/pictures/250000/velka/dog-1521355449xTO.jpg',
    'https://www.publicdomainpictures.net/pictures/170000/velka/dog-1463231979zjO.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://w7.pngwing.com/pngs/502/150/png-transparent-havanese-dog-pet-sitting-labrador-retriever-puppy-cat-pet-dog-animals-carnivoran-pet.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Ruffles',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: const [Icon(Icons.menu), SizedBox(width: 20)],
              ),
            ],
          ),
        ),
        Stack(children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              itemCount: images.length,
              itemBuilder: ((context, index) {
                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
          Positioned(
              top: 340,
              left: 330,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.access_alarms_outlined,
                  size: 40,
                ),
              ))
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LikeButton(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                      ))
                ],
              ),
              Row(
                children: [
                  CarouselIndicator(
                    height: 2,
                    width: 5,
                    count: images.length,
                    index: pageIndex,
                    activeColor: Colors.black,
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.bookmark_border))
                ],
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
