import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user_model.dart';


// provider auth email, password
class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential =  await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    
    
  }  
}
class AuthServices {
  signInWithGoogle() async {
    //begin interface sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn().catchError((onError) => print(onError));
    if (gUser == null){
      return null;
    }
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    //create a new credential for user
    final credential = auth.GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //sign in
    return await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }
}



