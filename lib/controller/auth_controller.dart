import 'package:blockchain_app/controller/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var profile_verified = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final currentUser = FirebaseAuth.instance.currentUser.obs;

  @override
  void onInit() {
    currentUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<String> createUser(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      await DatabaseService(uid: authResult.user!.uid).addUserData('Simpy',
          'Swap', '74 Monroe Avenue', 'Fort Myers', '33901', 'United States');

      return authResult.user!.uid;
    } catch (e) {
      return '';
    }
  }

  Future<String> login(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return authResult.user!.uid;
    } catch (e) {
      return '';
    }
  }

  Future<String> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _auth.signInWithCredential(credential).then((value) {
        if ('' == value.user!.uid || value.user!.uid == null) {
          return "Error Authenticating";
        } else {
          return '';
        }
      });
      // Future.delayed(const Duration(milliseconds: 1000), () async{
      //   bool isNew = await Database().isNewUser(_auth.currentUser);
      //   UserModel _user = UserModel(id: _auth.currentUser!.uid, name: _auth.currentUser!.displayName, email: _auth.currentUser!.email, imageUrl: _auth.currentUser!.photoURL, createdAt: Timestamp.now(), bio: "Your Bio");
      //   if(isNew){
      //     if(await Database().createUserInDatabase(_user)){
      //       Get.put(UserController()).currentUser.value = _user;
      //     }else{
      //       Get.put(UserController()).currentUser.value = _user;
      //     }
      //   }
      // });
    } catch (e) {
      Get.snackbar("Error login Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      return 'Error Authenticating';
    }
    return 'Error Authenticating';
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;

    try {
      var authCredentials = EmailAuthProvider.credential(
          email: firebaseUser!.email.toString(), password: password);
      var authResult =
          await firebaseUser.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logOut() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error Signing Out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    firebaseUser!.updatePassword(password);
  }
}
