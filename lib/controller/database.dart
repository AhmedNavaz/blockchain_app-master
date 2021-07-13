import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference personalInfoCollection =
      FirebaseFirestore.instance.collection('personalInfo');

  Future addUserData(String firstName, String lastName, String street,
      String city, String zip, String citizenship) async {
    return await personalInfoCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'street': street,
      'city': city,
      'zip': zip,
      'citizenship': citizenship,
    });
  }
}
