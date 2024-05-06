import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/homepage/hoteln.dart';



class HotelN extends GetView<HotelNController> {

  final List<Room> room = [
    Room(
      imageUrl: 'assets/images/m.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
    ),
    Room(
      imageUrl: 'assets/images/m1.jpg',
      des:
      "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
    ),
    Room(
      imageUrl: 'assets/images/p1.jpg',
      des:
      "Experience unparalleled luxury and impeccable service at our five-star hotel,your expectations.",
    ),
    Room(
      imageUrl: 'assets/images/p.jpg',
      des:
      "Discover a fusion of modern elegance and traditional charm at our boutique hotel.",
    ),
    Room(
      imageUrl: 'assets/images/m.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
    ),
    Room(
      imageUrl: 'assets/images/m1.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
    ),
    Room(
      imageUrl: 'assets/images/sea.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Set background color
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as needed
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: room.length,
          itemBuilder: (context, index) {
            return RoomCard(room: room[index]);
          },
        ),
      ),
    );
  }
}

class Room {
  final String imageUrl;
  final String des;

  Room({
    required this.imageUrl,
    required this.des,
  });
}

class RoomCard extends StatelessWidget {
  final Room room;

  RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set card background color
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        elevation: 0, // Remove Card's default elevation
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'room_image_${room.imageUrl}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  room.imageUrl,
                  fit: BoxFit.cover, // Ensure the entire image is visible
                  height: 140, // Adjust the height as needed
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${room.des}",
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
