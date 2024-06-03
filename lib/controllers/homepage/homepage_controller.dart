import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/sharedprefrence/shared.dart';
import '../../models/app_response.dart';
import '../../pages/auth/login/login.dart';
import '../../pages/homepage/favorite.dart';
import '../../pages/homepage/hotel.dart';
import '../../providers/api_provider.dart';
import '../../repository/homepage_repo.dart';

class HotelHomeController extends GetxController {



  HomePageRepo homePageRepo = Get.find<HomePageRepo>();

  List<int> wishlist = [];

  List<int> likedHotelIds = [];

  var hotels = <Hotel>[].obs;

  var reports = <dynamic>[].obs;



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
    ]);
    getWishlist();
   // fetchReports();
  }

  Future<List<dynamic>> getWishlist() async {
    try {
      List data = await homePageRepo.getwishlist();
      wishlist = data.map<int>((item) => item['id']).toList();
      return data; // Return wishlist data
    } catch (e) {
      print("Error fetching wishlist: $e");
      // Handle the error gracefully, for example, return an empty list
      return [];
    }
  }

  Future<void> navigateToFavorites() async {
    try {
      // Fetch the wishlist data before navigating
      List<dynamic> wishlistData = await homePageRepo.getwishlist();
      print("Navigating to Favorites with data: $wishlistData"); // Log data for debugging
      // Navigate to Favorites page and pass the list of liked room IDs
      Get.to(() => Favorite(wishlistData: wishlistData));
    } catch (e) {
      print("Error navigating to Favorites page: $e");
    }
  }



  void toggleFavorite(int id) async {
    int index = hotels.indexWhere((hotel) => hotel.id == id);
    if (index != -1) {
      hotels[index].isLiked = !hotels[index].isLiked;
      hotels.refresh(); // Refresh the observable list

      if (hotels[index].isLiked) {
        print('Hotel ${hotels[index].name} (ID: ${hotels[index].id}) added to favorites.');
        if (!wishlist.contains(hotels[index].id)) {
          await addToWishlist(hotels[index].id);
        }
      } else {
        print('Hotel ${hotels[index].name} (ID: ${hotels[index].id}) removed from favorites.');
        await removeFromWishlist(hotels[index].id);
      }
    }
  }

  Future<void> removeFromWishlist(int roomId) async {
    try {
      String? token = await getToken(); // Assume this function retrieves your token
      if (token == null) {
        throw Exception("User not logged in");
      }
      await homePageRepo.removeFromWishlist(roomId);
      await updateWishlist();
      Get.defaultDialog(
        title: "Success",
        content: Text("Removed from wishlist successfully"),
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
        content: Text("Failed to remove from wishlist. Please try again later."),
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
  Future<void> addToWishlist(int roomId) async {
    try {
      print(7);
      String? token = await getToken(); // Assume this function retrieves your token
      if (token == null) {
        throw Exception("User not logged in");
      }

      await homePageRepo.addToWishlist(roomId);
      await updateWishlist();

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

  bool isHotelLiked(int hotelId) {
    return wishlist.contains(hotelId);
  }

  Future<void> updateWishlist() async {
    try {
      List data = await homePageRepo.getwishlist();
      wishlist = data.map<int>((item) => item['id']).toList();
      update(); // Update UI
    } catch (e) {
      print("Error fetching wishlist: $e");
    }
  }

  void handleWishlistError(dynamic error) {
    print("Error: $error");
    Get.defaultDialog(
      title: "Error",
      content: Text("Failed to update wishlist. Please try again later."),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("OK"),
        ),
      ],
    );
  }


  Future<void> logout() async {
    try {
      await homePageRepo.logout();
      // Clear user data, navigate to login screen, etc.
      Get.offAll(Login());
    } catch (e) {
      print("Error during logout: $e");
      Get.defaultDialog(
        title: "Error",
        content: Text("Failed to logout"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Ok"),
          ),
        ],
      );
    }
  }
}







/*  bool isHotelLiked(int hotelId) {
    return likedHotelIds.contains(hotelId);
  }*/



/* void toggleLike(int hotelId) {
    if (likedHotelIds.contains(hotelId)) {
      likedHotelIds.remove(hotelId);
    } else {
      likedHotelIds.add(hotelId);
    }
    update(); // Notify listeners that the state has changed
  }*/