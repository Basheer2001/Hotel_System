import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/review_controller.dart';

class ReviewScreen extends StatelessWidget {
  final ReviewController reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submit Review")),
      body: Form(
        key: reviewController.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: reviewController.ratingTextController,
                decoration: InputDecoration(labelText: "Rating"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a rating';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: reviewController.commentTextController,
                decoration: InputDecoration(labelText: "Comment"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(() => reviewController.postReviewLoadingState.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () => reviewController.postReview(2), // replace 2 with dynamic room number if needed
                child: Text("Submit Review"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
