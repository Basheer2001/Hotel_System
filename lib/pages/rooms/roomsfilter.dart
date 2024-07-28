import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/roomsearch_controller.dart';

/*
class RoomSearch extends StatelessWidget {
  final RoomSearchController roomSearchController = Get.find<RoomSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: roomSearchController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: roomSearchController.searchTextController,
                decoration: InputDecoration(labelText: 'Search'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a search term';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.viewTextController,
                decoration: InputDecoration(labelText: 'View'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a view';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.basePriceTextController,
                decoration: InputDecoration(labelText: 'Base Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a base price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.averageRatingTextController,
                decoration: InputDecoration(labelText: 'Average Rating'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an average rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: roomSearchController.searchRooms,
                child: Text('Search'),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (roomSearchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (roomSearchController.rooms.isEmpty) {
                  return Center(child: Text('No rooms available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: roomSearchController.rooms.length,
                    itemBuilder: (context, index) {
                      final room = roomSearchController.rooms[index];
                      return ListTile(
                        title: Text(room.roomNumber),
                        subtitle: Text('View: ${room.view}'),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
*/



import '../homepage/roomhill.dart';
import '../homepage/roompool.dart';
import '../homepage/roomsea.dart';

// Define a custom shape for the AppBar
class CircularAppBarShape1 extends RoundedRectangleBorder {
  CircularAppBarShape1()
      : super(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
  );
}

class RoomFilter extends StatefulWidget {
  @override
  State<RoomFilter> createState() => _RoomFilterState();
}

class _RoomFilterState extends State<RoomFilter> {
  final RoomSearchController roomSearchController = Get.find<RoomSearchController>();
  bool ratingisSelected1 = false;
  bool ratingisSelected2 = false;
  bool ratingisSelected3 = false;
  bool ratingisSelected4 = false;
  bool priceisSelected100= false;
  bool priceisSelected1000= false;
  bool priceisSelected2000= false;
  bool seaviewisSelected= false;
  bool pooliewisSelected= false;
  bool hillviewisSelected= false;

  final List<Map<String, dynamic>> viewcategories = [
    {'icon': Icons.beach_access, 'label': 'Sea'},
    {'icon': Icons.pool, 'label': 'Pool'},
    {'icon': Icons.terrain, 'label': 'Hill'},
  ];

  final List<Map<String, dynamic>> pricecategories = [
    {'icon': Icons.monetization_on_sharp, 'label': '100'},
    {'icon': Icons.monetization_on_sharp, 'label': '1000'},
    {'icon': Icons.monetization_on_sharp, 'label': '2000'},
  ];

  final List<Map<String, dynamic>> ratingcategories = [
    {'icon': Icons.star_rate, 'label': '1'},
    {'icon': Icons.star_rate, 'label': '2'},
    {'icon': Icons.star_rate, 'label': '3'},
    {'icon': Icons.star_rate, 'label': '4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Booking Services',
          style: TextStyle(
            color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0), // Shadow position
                blurRadius: 3.0, // Shadow blur
                color: Colors.grey, // Shadow color
              ),
            ],
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        shape: CircularAppBarShape1(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Form(
              key: roomSearchController.formKey,
              child: Column(
                children: [
                  _buildTextFormField(
                    controller: roomSearchController.searchTextController,
                    labelText: 'hint',
                    validator: (value) => value == null || value.isEmpty ? 'Please enter a search term' : null,
                  ),
                  // SizedBox(height: 12),
                  // _buildTextFormField(
                  //   controller: roomSearchController.viewTextController,
                  //   labelText: 'View',
                  //   validator: (value) => value == null || value.isEmpty ? 'Please enter a view' : null,
                  // ),
                  SizedBox(height: 20),
                  Text("view"),
                  SizedBox(height: 20),
                  Container(
                    height: 80, // Adjust the height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: viewcategories.map((category) {
                        return _buildCategoryIcon(category['icon'], category['label']);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("basic price"),
                  SizedBox(height: 20),
                  Container(
                    height: 80, // Adjust the height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: pricecategories.map((category) {
                        return _buildCategoryIcon(category['icon'], category['label']);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("average ratung"),
                  SizedBox(height: 20),
                  Container(
                    height: 80, // Adjust the height as needed
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: ratingcategories.map((category) {
                        return _buildCategoryIcon(category['icon'], category['label']);
                      }).toList() ,
                    ),
                  ),



                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: roomSearchController.searchRooms,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>((Colors.blueAccent)),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      elevation: MaterialStateProperty.all<double>(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text('Search',style: TextStyle(color: Colors.white),),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      validator: validator,
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    //bool is = isSelected;
    Color c=Colors.blue;
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
    Color cc(){
      if( label =="Sea"){
         return seaviewisSelected?Colors.blue:Colors.grey;
      }
      else if( label =="Pool"){
        return pooliewisSelected?Colors.blue:Colors.grey;
      }else if( label =="Hill"){
        return hillviewisSelected?Colors.blue:Colors.grey;
      }
      else if(  label =="100"){
        return priceisSelected100?Colors.blue:Colors.grey;
      }
      else if(  label =="1000"){
        return priceisSelected1000?Colors.blue:Colors.grey;
      }
      else if(  label =="2000"){
        return priceisSelected2000?Colors.blue:Colors.grey;
      }
      else if (label=="1") {
        return ratingisSelected1?Colors.blue:Colors.grey;

      }      else if (label=="2") {
        return ratingisSelected2?Colors.blue:Colors.grey;

      }      else if (label=="3") {
        return ratingisSelected3?Colors.blue:Colors.grey;

      }      else {
        return ratingisSelected4?Colors.blue:Colors.grey;

      }

    }


    return GestureDetector(
      onTap: () {
        setState(() {
          if( label =="Sea"){
            seaviewisSelected=!seaviewisSelected;
            pooliewisSelected=false;
            hillviewisSelected=false;
            roomSearchController.viewTextController.text=label;
          }
          else if( label =="Pool"){
            pooliewisSelected=!pooliewisSelected;
            seaviewisSelected=false;
            hillviewisSelected=false;
            roomSearchController.viewTextController.text=label;

          }else if( label =="Hill"){
            hillviewisSelected=!hillviewisSelected;
            seaviewisSelected=false;
            pooliewisSelected=false;
            roomSearchController.viewTextController.text=label;
          }
          else if(  label =="100"){
            priceisSelected100=!priceisSelected100;
            priceisSelected1000=false;
            priceisSelected2000=false;
            roomSearchController.basePriceTextController.text=label;

          }
          else if(  label =="1000"){
            priceisSelected1000=!priceisSelected1000;
            priceisSelected100=false;
            priceisSelected2000=false;
            roomSearchController.basePriceTextController.text=label;
          }
          else if(  label =="2000"){
            priceisSelected2000=!priceisSelected2000;
            priceisSelected1000=false;
            priceisSelected100=false;
            roomSearchController.basePriceTextController.text=label;
          }
          else if (label=="1") {
            ratingisSelected1=!ratingisSelected1;
            ratingisSelected2=false;
            ratingisSelected3=false;
            ratingisSelected4=false;


            roomSearchController.averageRatingTextController.text=label;
          }      else if (label=="2") {
            ratingisSelected2=!ratingisSelected2;
            ratingisSelected1=false;
            ratingisSelected3=false;
            ratingisSelected4=false;
            roomSearchController.averageRatingTextController.text=label;

          }      else if (label=="3") {
            ratingisSelected3=!ratingisSelected3;
            ratingisSelected1=false;
            ratingisSelected2=false;
            ratingisSelected4=false;
            roomSearchController.averageRatingTextController.text=label;

          }      else {
            ratingisSelected4=!ratingisSelected4;
            ratingisSelected1=false;
            ratingisSelected2=false;
            ratingisSelected3=false;
            roomSearchController.averageRatingTextController.text=label;

          }


        });

       // Get.to(() => destinationScreen);
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
                color: cc(),

                //priceisSelected==true?Colors.blue:Colors.grey,
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
              color:Colors.grey,
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
}




