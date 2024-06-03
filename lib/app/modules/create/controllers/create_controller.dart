import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController instructionsController;
  late TextEditingController ingredientsController;
  late TextEditingController descriptionController;
  late TextEditingController time_estimationController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String instructions, String ingredients,
      String description, int time_estimation) async {
    try {
      await firestore.collection('recipe').add({
        'title': title,
        'instructions': instructions,
        'ingredients': ingredients,
        'description': description,
        'time_estimation': time_estimation,
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data added successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
      titleController.clear();
      instructionsController.clear();
      ingredientsController.clear();
      descriptionController.clear();
      time_estimationController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    instructionsController = TextEditingController();
    ingredientsController = TextEditingController();
    descriptionController = TextEditingController();
    time_estimationController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    instructionsController.dispose();
    ingredientsController.dispose();
    descriptionController.dispose();
    time_estimationController.dispose();
    super.onClose();
  }
}
