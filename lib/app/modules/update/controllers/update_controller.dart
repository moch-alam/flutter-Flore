import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController
      instructionsController; // Controller untuk instructions
  late TextEditingController
      ingredientsController; // Controller untuk ingredients
  late TextEditingController
      timeEstimationController; // Controller untuk time estimation

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('recipe').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String description,
      String instructions, String ingredients, int timeEstimation) async {
    try {
      await firestore.collection('recipe').doc(docID).update({
        'title': title,
        'description': description,
        'instructions': instructions, // Update data instructions
        'ingredients': ingredients, // Update data ingredients
        'time_estimation': timeEstimation, // Update data time estimation
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed updating data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    instructionsController =
        TextEditingController(); // Initialize controller untuk instructions
    ingredientsController =
        TextEditingController(); // Initialize controller untuk ingredients
    timeEstimationController =
        TextEditingController(); // Initialize controller untuk time estimation
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    instructionsController.dispose(); // Dispose controller untuk instructions
    ingredientsController.dispose(); // Dispose controller untuk ingredients
    timeEstimationController
        .dispose(); // Dispose controller untuk time estimation
    super.onClose();
  }
}
