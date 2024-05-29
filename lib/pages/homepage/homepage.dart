import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:untitled1/pages/homepage/roomhill.dart';
import 'package:untitled1/pages/homepage/roompool.dart';
import 'package:untitled1/pages/homepage/roomsea.dart';
import '../../controllers/dashboard/managing_reports_controller/displayreports_controller.dart';
import '../../controllers/homepage/homepage_controller.dart';
import '../booking/bookingroom.dart';
import 'package:untitled1/pages/settings/settings.dart';
import '../dashboard/dashboardscreen.dart';
import '../profile/profile.dart';
import 'hotel.dart';
import 'hoteln.dart';
import 'hotelnp.dart';
import 'hotelp.dart';
import 'hotels.dart';


class HotelHome extends StatelessWidget {
  final String token;

 HotelHome({required this.token,Key? key}) : super(key: key);


  // Define categories
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.beach_access, 'label': 'Sea'},
    {'icon': Icons.pool, 'label': 'Pool'},
    {'icon': Icons.terrain, 'label': 'Hill'},
  ];



  Widget _buildCategoryIcon(IconData icon, String label) {
    Widget destinationScreen;
    switch (label) {
      case 'Sea':
        destinationScreen = RoomSeaView();
        break;
      case 'Pool':
        destinationScreen = RoomPoolView();
        break;
      case 'Hill':
        destinationScreen = RooHillView();
        break;
      default:
        destinationScreen = Container();
        break;
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => destinationScreen);
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Icon(
              icon,
              color: Colors.grey,
              size: 24,
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
      ),
    );
  }



 @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    final HotelHomeController controller = Get.put(HotelHomeController());

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor:Colors.blueGrey[50],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
              ElevatedButton(
                onPressed: () async {
                 controller.navigateToFavorites();
                },
                child: Text('Favorites', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                ),
              ),

            ),
          ],
        ),

      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [

      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color:Colors.black,
        ),
        accountName: Text('Lory Demerjian',style: TextStyle(color: Colors.white),),
        accountEmail: Text('Lory@Gmail.com',style: TextStyle(color: Colors.white),),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            'A',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('Dashboard'),
        onTap: () {
          Get.to(DashboardScreen());
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Profile'),
        onTap: () {
          Get.to(Profile());
        },
      ),

      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {
          Get.to(Settings());
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout'),
        onTap: () {
          // Handle logout
        },
      ),
    ],
  ),
),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height:10 ,),

                Row(
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
                    OutlinedButton(
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
                                    TextField(
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
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 16,),
                                    Text(
                                      'Activities',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      children: [
                                        Image.asset('assets/images/activity.jpg'),
                                        Image.asset('assets/images/activity.jpg'),
                                        Image.asset('assets/images/c.jpg'),
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
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.grey, width: 2.0), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...', // Add a hint text
                    hintStyle: TextStyle(color: Colors.grey), // Style for the hint text
                    prefixIcon: InkWell(
                      child: Icon(Icons.search, color: Colors.black), // Customize the icon color
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearch(),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                      borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                      borderSide: BorderSide(color: Colors.grey, width: 2.0), // Bold border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                      borderSide: BorderSide(color: Colors.blue, width: 2.0), // Bold border when focused
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Padding inside the text field
                    filled: true,
                    fillColor: Colors.white, // Background color for the text field
                  ),
                  style: TextStyle(color: Colors.black), // Text style
                ),
                SizedBox(height: 15,),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 80, // Adjust the height as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.map((category) {
                      return _buildCategoryIcon(category['icon'], category['label']);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // Expanded to make sure the grid takes the remaining space
          Expanded(
            child: Obx(() {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // Aspect ratio for each item
                ),
                itemCount: controller.hotels.length,
                itemBuilder: (context, index) {
                  final hotel = controller.hotels[index];
                  return GestureDetector(
                    onTap: () {
                     // Get.to(() => HotelDetailsView(hotel: hotel));
                         Get.to( () => HotelDetailsView(hotel: hotel, imageUrl: hotel.imageUrl));

                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                      child: Container(
                                        height: 250,
                                        child: Image.asset(
                                          hotel.imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () async {
                                          controller.toggleFavorite(hotel.id); // Toggle favorite status
                                        },
                                        child: Icon(
                                          hotel.isLiked ? Icons.favorite : Icons.favorite_border,
                                          color: hotel.isLiked ? Colors.red : Colors.grey, // Change color based on isLiked status
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel.name,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${hotel.price}',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ), RatingBar.builder(
                                          initialRating: hotel.rating ?? 0,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class HotelDetailsView extends StatelessWidget {
  final Hotel hotel;
  final String imageUrl;

  HotelDetailsView({required this.hotel, required this.imageUrl});

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
                image: AssetImage(imageUrl),
               // image: AssetImage(hotel.imageUrl), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter, // Align the container to the bottom center
          ),
          Positioned(
            top: 250,
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
                      Get.to(() => RoomBooking());
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
    "Price",
    "Number of Persons",
    "View",
    "Services"
  ];

  List? filterList;
  bool isLoading = false;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Result $query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filteredList = username
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Material(
            elevation: 4.0, // Set elevation
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(filteredList[index]),
                ),
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
                    if (filteredList[index] == "View") {
                      Get.to(HotelN());
                    } else if (filteredList[index] == "Price") {
                      Get.to(HotelP());
                    } else if (filteredList[index] == "Number of Persons") {
                      Get.to(HotelNP());
                    } else if (filteredList[index] == "Services") {
                      Get.to(HotelS());
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }




}








