// ignore_for_file: file_names, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetAdminDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getAdminData(String uId) async {
    final QuerySnapshot adminData = await _firestore
        .collection('Admins')
        .where('uId', isEqualTo: uId)
        .get();
    return adminData.docs;
  }
}
