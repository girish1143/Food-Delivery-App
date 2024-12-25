import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future<void> updateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({"Wallet": amount});
  }


  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfoMap);
  }
}
