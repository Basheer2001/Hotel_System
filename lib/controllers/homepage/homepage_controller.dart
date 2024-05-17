import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/app_response.dart';
import '../../repository/homepage_repo.dart';

class HotelHomeController extends GetxController {

  HomePageRepo homePageRepo = Get.find<HomePageRepo>();
  TextEditingController numberTextController = TextEditingController(text: "2");

  List<int> wishlist = [];

  List<int> likedHotelIds = [];

  @override
  void onInit() {
    super.onInit();
    // Fetch wishlist items when the homepage is initialized
    getWishlist();
  }

  void toggleLike(int hotelId) {
    if (likedHotelIds.contains(hotelId)) {
      likedHotelIds.remove(hotelId);
    } else {
      likedHotelIds.add(hotelId);
    }
    update(); // Notify listeners that the state has changed
  }

  bool isHotelLiked(int hotelId) {
    return likedHotelIds.contains(hotelId);
  }

  void addToWishlist(int roomId) async {
    String cookie = "your_cookie_value_here"; // Get the cookie value from your app logic
    try {
      await homePageRepo.addToWishlist(roomId, cookie);
      // Handle success scenario
      Get.defaultDialog(
        title: "Success",
        content: Text("Added to wishlist successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } catch (e) {
      // Handle error scenario
      print("Error: $e");
      Get.defaultDialog(
        title: "Error",
        content: Text("Failed to add to wishlist. Please try again later."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }

  void getWishlist() async {
    try {
      // Fetch wishlist items

       await homePageRepo.getwishlist("your_cookie_here");
      // Update UI if needed
      update();
    } catch (e) {
      // Handle error
      print("Error fetching wishlist: $e");
    }
  }
}
