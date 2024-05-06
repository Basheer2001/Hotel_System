import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/homepage/hotelp_controller.dart';


class HotelP extends StatelessWidget {
  const HotelP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HotelPController controller = Get.put(HotelPController());

    // Sample list of hotels
    final List<Price> price = [
      Price(name: 'sweet', price: 100.0, imageUrl: "assets/images/p1.jpg"),
      Price(name: 'doublex', price: 1000.0, imageUrl: "assets/images/m.jpg"),
      Price(name: '2 person', price: 250.0, imageUrl: "assets/images/p1.jpg"),
      Price(name: '2 person', price: 500.0, imageUrl: "assets/images/sea.jpg"),
      Price(name: 'doublex', price: 250.0, imageUrl: "assets/images/m1.jpg"),
      Price(name: 'sweet', price: 400.0, imageUrl: "assets/images/sea1.jpg"),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: price.length,
          itemBuilder: (context, index) {
            return PriceCard(
              price: price[index],
            );
          },
        ),
      ),
    );
  }
}

class Price {
  final String name;
  final String imageUrl;
  final double price;

  Price({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class PriceCard extends StatefulWidget {
  final Price price;

  const PriceCard({required this.price});

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.price.imageUrl,
                fit: BoxFit.cover,
                height: 140,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 8), // Add spacing between image and text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
              child: Text(
                widget.price.name,
                style: TextStyle(
                  fontSize: 16, // Increase font size for room name
                  fontWeight: FontWeight.bold, // Apply bold font weight
                  // Optionally, you can use a different font family:
                  // fontFamily: 'YourCustomFont',
                ),
              ),
            ),
            SizedBox(height: 4), // Add spacing between room name and price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.price.price?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14, // Adjust font size for price
                      fontWeight: FontWeight.bold, // Apply bold font weight
                      color: Colors.blue, // Optionally, apply a different color to the price
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8), // Add spacing below price
          ],
        ),
      ),
    );
  }
}

