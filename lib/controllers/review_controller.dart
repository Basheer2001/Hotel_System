import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../repository/review_repo.dart';


class ReviewController extends GetxController {
  ReviewRepo reviewRepo = Get.find<ReviewRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController ratingTextController = TextEditingController();
  TextEditingController commentTextController = TextEditingController();

  var firstSubmit = false.obs;
  var postReviewLoadingState = false.obs;

  void postReview(int roomNumber) async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      postReviewLoadingState.value = true;
      AppResponse response = await reviewRepo.postReview(
        roomNumber,
        int.parse(ratingTextController.text),
        commentTextController.text,
      );
      postReviewLoadingState.value = false;
      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text(response.data!),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Ok"),
            ),
          ],
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage!),
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
}
