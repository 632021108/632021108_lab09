import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  GoogleSignIn googleSignin = GoogleSignIn();
  Future<void> signinbygoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignin.signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    print(googleUser?.displayName);
    print(googleAuth?.accessToken);
    print(googleAuth?.idToken);


    final Credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(Credential);
    print(userCredential.user);
  }
  

  Future<void> googlesignout()  async{
    await FirebaseAuth.instance.signOut().then((value){
      googleSignin.signOut();
    });

    
  }
}