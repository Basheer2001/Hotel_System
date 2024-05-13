import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:get/get.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:untitled1/pages/homepage/roomhill.dart';
import 'package:untitled1/pages/homepage/roompool.dart';
import 'package:untitled1/pages/homepage/roomsea.dart';

import '../../controllers/homepage/homepage_controller.dart';
import '../auth/profile/profile.dart';
import 'hotel.dart';
import 'hoteln.dart';
import 'hotelp.dart';


class HotelHome extends StatelessWidget {
  const HotelHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    // Sample list of hotels
    final List<Hotel> hotels = [
      Hotel(name: 'Hotel A', location: 'City A', imageUrl: 'assets/images/images.jpg',des:"Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.", price: 100.0,id:1),
      Hotel(name: 'Hotel B', location: 'City B', imageUrl:'assets/images/images.jpg',des:"With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.", price: 1000.0,id:2,),
      Hotel(name: 'Hotel C', location: 'City C', imageUrl: 'assets/images/images.jpg',des:"Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.", price: 250.0,id:3),
      Hotel(name: 'Hotel D', location: 'City E', imageUrl: 'assets/images/images.jpg',des:"Discover a fusion of modern elegance and traditional charm at our boutique hotel, where personalized experiences await around every corner.",price: 500.0,id:4),
      Hotel(name: 'Hotel E', location: 'City C', imageUrl: 'assets/images/images.jpg',des:"Whether you're here for business or leisure, our centrally located hotel provides the perfect base for exploring the vibrant city and its myriad attractions.",price: 250.0,id:5),
      Hotel(name: 'Hotel F', location: 'City E', imageUrl: 'assets/images/images.jpg',des:"Indulge in culinary delights and cultural experiences at our historic hotel, where each room is a reflection of the city's rich heritage.",price: 400.0,id:6),
    ];

    Get.put(HotelHomeController());

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],



      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse existing offers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 16,),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Activities',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Display pictures of activities here
                                    // You can use GridView, ListView, or any other widget to display images
                                    // Example:
                                    GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      children: [
                                        // Replace with your activity images
                                        Image.asset('assets/images/activity.jpg'),
                                        Image.asset('assets/images/activity.jpg'),
                                        Image.asset('assets/images/c.jpg'),
                                        // Add more images as needed
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text("Browse"),
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.blue, // Change to your preferred color
                      ),
                    ),
                SizedBox(width: 30,),
                ElevatedButton(onPressed: (){
                  Get.to(() => Profile());
                }, child: Text("profile"))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      child: Icon(Icons.search),
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearch(),
                        );
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 13),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  _buildCategoryButton(Icons.beach_access, "Sea"),
                  SizedBox(width: 10),
                  _buildCategoryButton(Icons.terrain, "Mountain"),
                  SizedBox(width: 10),
                  _buildCategoryButton(Icons.pool, "Pool"),
                ],
              ),
            ),
            SizedBox(height: 10),
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return HotelCard(hotel: hotels[index]);
                  },
                ),
              ]
            ),
        ),

    );
  }

  Widget _buildCategoryButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        if(label=="Sea"){
          Get.to(() => RoomSeaView());
        }else if(label=="Mountain"){
          Get.to(() => RooHillView());
        }else if(label=="Pool"){
          Get.to(() => RoomPoolView());
        }

      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        //primary: Colors.grey[200],
        //onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            Get.to(() => HotelDetailsView(hotel: hotel),
              //transition: Transition.fadeIn, // Specify transition animation
              // duration: Duration(milliseconds: 400), // Adjust duration as needed
            );
          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag:'hotel_image_${hotel.imageUrl}',
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Image.asset(
                    hotel.imageUrl,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            hotel.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.find<HotelHomeController>().toggleLike(hotel.id);
                            Get.find<HotelHomeController>().addToWishlist(hotel.id);
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 15,
                            color: hotel.isLiked ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      hotel.location,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    RatingBar.builder(
                      initialRating: hotel.rating ?? 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 10,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Update the rating of the hotel
                        hotel.rating = rating;
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HotelDetailsView extends StatelessWidget {
  final Hotel hotel;

  HotelDetailsView({required this.hotel});

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotel.imageUrl), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter, // Align the container to the bottom center
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                  bottomRight: Radius.circular(0.0), // Adjust this value as needed
                ),
                boxShadow: [
                  BoxShadow(
                    // color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        Text(
                          hotel.name,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.blue,),
                      SizedBox(width: 5,),
                      Text(
                        hotel.location,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 14,
                        ),
                      SizedBox(width: 5),
                      Text(
                        '4.0', // Assuming rating is 4.0
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '100 Reviews', // Assuming reviews is an int value
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$${hotel.price?.toStringAsFixed(2)}', // Assuming price is a double value
                        style: TextStyle(
                          fontSize: 16,
                          color: customColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryIcon(Icons.wifi, "WiFi"),
                        _buildCategoryIcon(Icons.ac_unit, "AC"),
                        _buildCategoryIcon(Icons.local_parking, "Parking"),
                        _buildCategoryIcon(Icons.restaurant, "Restaurant"),
                        _buildCategoryIcon(Icons.pool, "pool"),
                        _buildCategoryIcon(Icons.sports_gymnastics, "Gym"),
                        _buildCategoryIcon(Icons.electric_bolt, "Electricity"),
                        // Add more icons here as needed
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text("Description",style: TextStyle(fontSize: 16,
                        color: Colors.black,fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Column(
                    children: [
                      Text(
                        hotel.des,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,

                        ),),
                    ],
                  ),

                  SizedBox(height: 15,),
                  // Add more form fields as needed
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => ());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          customColor), // Set button color
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(color: Colors.white)), // Text style
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40)), // Padding
                      elevation: MaterialStateProperty.all<double>(10), // Elevation
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // BorderRadius
                        ),
                      ),
                    ),
                    child: Text('Book Hotel'),
                  ),
                ],
                //
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryIcon(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 60, // Fixed width for the circular container
        height: 60, // Fixed height for the circular container
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200], // Background color of the circular container
        ),
        padding: EdgeInsets.all(12), // Adjust padding as needed
        child: Icon(
          icon,
          color: Colors.grey,
          size: 24, // Set the size of the icon
        ),
      ),
      SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

class CustomSearch extends SearchDelegate {

  List username = [
    "price",
    "number of person",
    "view",
    "servies"
  ];

  List ? filterList;

  bool isLoading = false;


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result $query");
  }

  @override
  /*Widget buildSuggestions(BuildContext context) {



    if(query==""){
      return ListView.builder(
          itemCount:username.length ,
          itemBuilder:(context,i){
            return InkWell(
              onTap:(){
                showResults(context);
              } ,
              child: Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${username[i]}",
                  style: TextStyle(fontSize: 16),
                ),
              )),
            );
          });
    }else
      {
        filterList=username.where((element) =>element.contains(query)).toList();
        return ListView.builder(
            itemCount:filterList!.length ,
            itemBuilder:(context,i){
              return InkWell(
                onTap:(){
                  showResults(context);
                } ,
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${filterList![i]}",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
              );
            });
      }

  }*/

  Widget buildSuggestions(BuildContext context) {
    List filteredList =
    username.where((element) => element.contains(query)).toList();


    return ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredList[index]),
            onTap: () {
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );

              Future.delayed(Duration(seconds: 2), () {
                // Close loading dialog
                Navigator.of(context).pop();
                // Navigate to corresponding page based on query
                if (filteredList[index] == "view") {
                  Get.to(() => HotelN());
                } else if (filteredList[index] == "price") {
                  Get.to(() => HotelP());
                } else if (filteredList[index] == "number of person") {
                  Get.to(() => RooHillView());
                } else if (filteredList[index] == "services") {
                  Get.to(() => RooHillView());
                }
              });
            },
          );
        }
    );
  }

}









