import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {

  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String npm, String nama, String prodi, String fakultas) async{
    CollectionReference products = firestore.collection('mahasiswa_21312064');

    try{
      await products.add({
        "nama_21312064" : nama,
        "npm_21312064" : npm,
        "prodi_21312064" : prodi,
        "fakultas_21312064" : fakultas
        });
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data product",
          onConfirm: () {
            cNPM.clear();
            cNama.clear();
            cProdi.clear();
            cFakultas.clear();
            Get.back();
            Get.back();
            textConfirm: "OK";
          }
        );
    }catch(e){
      
        print(e);
        Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Product.",
        );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
  cNPM = TextEditingController();
  cNama=TextEditingController();
  cProdi=TextEditingController();
  cFakultas=TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();

    super.onClose();
  }
}
