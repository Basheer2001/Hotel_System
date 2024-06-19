import 'package:get/get.dart';

import '../../pages/services/services.dart';
import '../../repository/services_repo.dart';

class ServicesController extends GetxController {
  final ServicesRepo servicesRepo = Get.find<ServicesRepo>();

  var isLoading = false.obs;
  var services = <Service>[].obs;

  Future<void> fetchServices() async {
    try {
      isLoading.value = true;
      List<Service> servicesList = (await servicesRepo.getServices()).cast<Service>();
      services.assignAll(servicesList);
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

