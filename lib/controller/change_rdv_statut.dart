import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/rdv_stat_model.dart';
import '../service/base_service.dart';

class ChangeStatusController extends GetxController {
  BaseService baseService = BaseService();
  final GetStorage box = GetStorage();

  final GlobalKey<State> keyLoader = GlobalKey<State>();

  RxBool loading = false.obs;
Rx<RdvStatusModel?> selectedStatus = RdvStatusModel(id: 0, name: "Refusé").obs;
RxString statutId = "".obs;

  // controller de telephone
  Rx<TextEditingController> messageEditingController =
      TextEditingController().obs;


  // Récuperation de l'OTP
  Future<void> changeStatus(int rdvId) async {
    loading(true);
    try {
      Map<String, dynamic> data = {
        "id": rdvId,
        "statut": statutId.value,
        "observation": messageEditingController.value.text
      };
      final response = await baseService.postAllWithToken(
          url: "valide-rdv-medecin", body: data);

      if (response.statusCode == 200) {
     
     messageEditingController.value.clear();
      Get.back(); 
          Get.snackbar(
              'Succès', 
              'Statut modifié avec succès', 
              backgroundColor: Colors.green, 
              colorText: Colors.white,
              borderRadius: 20,
              margin: const EdgeInsets.all(10), 
              duration: const Duration(seconds: 3),
              icon: const Icon(Icons.check_circle, color: Colors.white), 
            );

      } else {
        loading(false);

        Get.snackbar(
          "Erreur",
          "Une erreur s'est produite",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 20,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
      }
    } catch (e) {
      loading(false);
      if (e is SocketException) {
        Get.snackbar(
          'Internet indisponible',
          'Vérifiez votre connexion internet svp.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 20,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
      } else {
        Get.snackbar(
          "Erreur",
          "Erreur",
          messageText: Text(e.toString()),
          backgroundColor: Colors.red,
        );
        rethrow;
      }
    } finally {
      loading(false);
    }
  }
}
