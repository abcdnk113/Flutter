import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthServices {
//Google sign in
  signInWithGoogle() async {
    //begin interface sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

// class LoginController extends GetxController {
//   var _google_sign_in = GoogleSignIn();
//   var googleSignInAccount = Rx<GoogleSignInAccount?>(null);

//   login() async {
//     googleSignInAccount.value = await _google_sign_in.signIn();
//   }
// }

