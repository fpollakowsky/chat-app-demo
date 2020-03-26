import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_sign_in/utils/FirebaseGetter.dart';
import 'package:firebase_google_sign_in/utils/PageRoutes.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

signInWithGoogle(context) async {
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  FirebaseUser firebaseUser = (await _auth.signInWithCredential(credential)).user;
  getCurrentUserInfo();

  if(isUserSignedIn() == true){
    var usrID = firebaseUser.uid;
    NavigateTabBarMain(context, usrID);
  }
}

void signOutGoogle() async{
  await googleSignIn.signOut();
}