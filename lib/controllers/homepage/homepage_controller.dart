import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HotelHomeController extends GetxController{
  List<int> likedHotelIds = [];

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




}