import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/app_response.dart';
import '../../pages/homepage/hotel.dart';
import '../../repository/homepage_repo.dart';

class HotelHomeController extends GetxController {

  HomePageRepo homePageRepo = Get.find<HomePageRepo>();
  TextEditingController numberTextController = TextEditingController(text: "2");

  List<int> wishlist = [];

  List<int> likedHotelIds = [];

  var hotels = <Hotel>[].obs;

  @override
  void onInit() {
    super.onInit();
    hotels.addAll([
      Hotel(name: 'Doublex', imageUrl: 'assets/images/hill1.jpg', des: "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.", price: 100.0, id: 1),
      Hotel(name: 'Sweet',  imageUrl: 'assets/images/sea.jpg', des: "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.", price: 1000.0, id: 2,),
      Hotel(name: 'one person',  imageUrl: 'assets/images/p3.jpg', des: "Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.", price: 250.0, id: 3),
      Hotel(name: 'Sweet',  imageUrl: 'assets/images/sea2.jpg', des: "Discover a fusion of modern elegance and traditional charm at our boutique hotel, where personalized experiences await around every corner.", price: 500.0, id: 4),
      Hotel(name: 'Twice',  imageUrl: 'assets/images/m1.jpg', des: "Whether you're here for business or leisure, our centrally located hotel provides the perfect base for exploring the vibrant city and its myriad attractions.", price: 250.0, id: 5),
      Hotel(name: 'Doublex',  imageUrl: 'assets/images/sea1.jpg', des: "Indulge in culinary delights and cultural experiences at our historic hotel, where each room is a reflection of the city's rich heritage.", price: 400.0, id: 6),
    ]);    getWishlist();
  }
  void toggleFavorite(int id) {
    int index = hotels.indexWhere((hotel) => hotel.id == id);
    if (index != -1) {
      hotels[index].isLiked = !hotels[index].isLiked;
      // Update the 'hotels' observable list to trigger UI update
      hotels.refresh(); // Refresh the observable list
      // Print or store the hotel ID when the favorite status is toggled
      if (hotels[index].isLiked) {
        print('Hotel ${hotels[index].name} (ID: ${hotels[index].id}) added to favorites.');
      } else {
        print('Hotel ${hotels[index].name} (ID: ${hotels[index].id}) removed from favorites.');
      }
      // Alternatively, you can store the hotel ID in a list or database for further use
      // You can also use a state management solution like GetX to update the UI automatically
    }
  }



  /* void toggleLike(int hotelId) {
    if (likedHotelIds.contains(hotelId)) {
      likedHotelIds.remove(hotelId);
    } else {
      likedHotelIds.add(hotelId);
    }
    update(); // Notify listeners that the state has changed
  }*/

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

