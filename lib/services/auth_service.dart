import 'package:firebase_auth/firebase_auth.dart';
import 'package:plane_app/models/user_model.dart';
import 'package:plane_app/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      if (email.isEmpty) {
        throw "Pastikan semua form terisi";
      }
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        balance: 280000000,
        hobby: hobby,
      );

      await UserService().setUser(user);

      return user;
    } on FirebaseAuthException catch (errorFirebaseAuth) {
      if (errorFirebaseAuth.code == 'email-already-in-use') {
        throw 'Email sudah pernah digunakan';
      }
      throw 'error tidak diketahui';
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
