
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async{
    DocumentReference docRef = firestore.collection("mahasiswa_21312064").doc(id);

    return docRef.get();
  }

  void updateProduct(String npm, String nama, String prodi,String fakultas, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa_21312064").doc(id);
    try {
      await productById.update({
        "nama_21312064" : nama,
        "npm_21312064" : npm,
        "prodi_21312064" : prodi,
        "fakultas_21312064" : fakultas
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Mahasiswa.",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cProdi.clear();
          cFakultas.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Mengubah Product.",
      );
    }
  }

  @override
  void onInit(){
  cNPM = TextEditingController();
  cNama=TextEditingController();
  cProdi=TextEditingController();
  cFakultas=TextEditingController();
  super.onInit();
  }

  void onClose() {

    cNPM.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();
    super.onClose();
  }
}
