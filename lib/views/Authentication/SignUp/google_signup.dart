import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth_components/OTP/otp.dart';

class AuthService {

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
    clientId: '226463894084-q3agpl9lmakco0u5u83cqs7e7t1rcpqi',
  );

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    try {

      // Link the Google credential with the existing user using OTPDailogue.mobileUser
      await OtpDailogue.mobileUser?.linkWithCredential(credential);
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Sign in with the Google credential
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
      // See the API reference for the full list of error codes.
        default:
          print("Unknown error.");
      }

      // Return null or handle the error accordingly
      return null;
    }

    /* await OtpDailogue.mobileUser?.linkWithCredential(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);*/
  }

  signOutWithGoogle() async{
    await _googleSignIn.signOut();
  }

}