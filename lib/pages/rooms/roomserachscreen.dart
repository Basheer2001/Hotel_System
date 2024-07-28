// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controllers/roomsearch_controller.dart';
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // Define a custom shape for the AppBar
// class CircularAppBarShape extends RoundedRectangleBorder {
//   CircularAppBarShape()
//       : super(
//     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//   );
// }
//
// class RoomSearch extends StatelessWidget {
//   final RoomSearchController roomSearchController = Get.find<RoomSearchController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My Booking Services',
//           style: TextStyle(
//             color: Colors.blue,
//             shadows: [
//               Shadow(
//                 offset: Offset(5.0, 5.0), // Shadow position
//                 blurRadius: 3.0, // Shadow blur
//                 color: Colors.grey, // Shadow color
//               ),
//             ],
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: Colors.black,
//         shape: CircularAppBarShape(),
//         iconTheme: IconThemeData(color: Colors.grey),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16),
//             Form(
//               key: roomSearchController.formKey,
//               child: Column(
//                 children: [
//                   _buildTextFormField(
//                     controller: roomSearchController.searchTextController,
//                     labelText: 'Search',
//                     validator: (value) => value == null || value.isEmpty ? 'Please enter a search term' : null,
//                   ),
//                   SizedBox(height: 12),
//                   _buildTextFormField(
//                     controller: roomSearchController.viewTextController,
//                     labelText: 'View',
//                     validator: (value) => value == null || value.isEmpty ? 'Please enter a view' : null,
//                   ),
//                   SizedBox(height: 12),
//                   _buildTextFormField(
//                     controller: roomSearchController.basePriceTextController,
//                     labelText: 'Base Price',
//                     validator: (value) => value == null || value.isEmpty ? 'Please enter a base price' : null,
//                   ),
//                   SizedBox(height: 12),
//                   _buildTextFormField(
//                     controller: roomSearchController.averageRatingTextController,
//                     labelText: 'Average Rating',
//                     validator: (value) => value == null || value.isEmpty ? 'Please enter an average rating' : null,
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: roomSearchController.searchRooms,
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>((Colors.blueAccent)),
//                       textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
//                       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                       ),
//                       elevation: MaterialStateProperty.all<double>(10),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     child: Text('Search',style: TextStyle(color: Colors.white),),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: Obx(() {
//                 if (roomSearchController.isLoading.value) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 if (roomSearchController.rooms.isEmpty) {
//                   return Center(child: Text('No rooms available'));
//                 }
//
//                 return ListView.builder(
//                   itemCount: roomSearchController.rooms.length,
//                   itemBuilder: (context, index) {
//                     final room = roomSearchController.rooms[index];
//                     return Card(
//                       margin: EdgeInsets.symmetric(vertical: 8),
//                       elevation: 4,
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(16),
//                         title: Text(
//                           room.roomNumber,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text('View: ${room.view}'),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?) validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(),
//         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       ),
//       validator: validator,
//     );
//   }
// }
//
//
//
//
