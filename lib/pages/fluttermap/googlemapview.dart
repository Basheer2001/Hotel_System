import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  var currentLocation = LatLng(0.0, 0.0).obs;

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}

class MapView extends StatelessWidget {
  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Location'),
      ),
      body: Obx(
            () => FlutterMap(
          options: MapOptions(
            initialCenter: controller.currentLocation.value,
            initialZoom: 13.0,
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: controller.currentLocation.value,
                  width: 80,
                  height: 80,

                  child: Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  )
                ),
              ],
            ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getLocation();
        },
        child: Icon(Icons.my_location),
      ),
    );
  }

}
