import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../model/user_model.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
// import 'package:stacked_services/stacked_services.dart';


// provider auth email, password
class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user){
    if (user == null){
      return null;
    }
    return User(user.uid,user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async{
    final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(String email,String password,)async{
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}

class AuthServices {
//Google sign in
  signInWithGoogle() async {
    //begin interface sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create a new credential for user
    final credential = auth.GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //sign in
    return await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }
}




// abstract class AuthenticationViewModel extends FormViewModel{
//   final NavigationService? navigationService = NavigationService();
//   final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();

//   late String successRoute;
//   AuthenticationViewModel({required this.successRoute});

//   @override
//   void setFormStatus(){}

//   Future saveData() async {
//     final result = await runBusyFuture(runAuthentication());
//     _handleAuthenticationResponse(result);    
//   }

//   Future<void> useGoogleAuthentication() async{
//     final result = await _firebaseAuthenticationService.signInWithGoogle();
//     _handleAuthenticationResponse(result);
//   }

//   Future<void> useAppleAuthentication() async{
//     final result = await _firebaseAuthenticationService.signInWithApple(
//       appleRedirectUri: "https://weather-c864b.firebaseapp.com/__/auth/handler", appleClientId: "");

//     _handleAuthenticationResponse(result);
//   }
   
  
//   Future<FirebaseAuthenticationResult> runAuthentication();

//   void _handleAuthenticationResponse(FirebaseAuthenticationResult authResult){
//     if(!authResult.hasError){
//       navigationService!.replaceWith(successRoute);
//     }else {
//       setValidationMessage(authResult.errorMessage);
//     };
//   }
//   }