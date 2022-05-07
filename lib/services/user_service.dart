import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:plane_app/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      throw e;
    }
  }

  Future<bool> checkUserById(String id, String name, String email) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      // print('ini snapshot ${snapshot['email']}');
      if (snapshot.exists) {
        getUserById(id);
        print('checkUsrByEmail : ada data');
      } else {
        UserModel user = UserModel(
          id: id,
          name: name,
          email: email,
          balance: 1000000,
          hobby: '',
        );
        await setUser(user);
        print('checkUsrByEmail : tidak ada data');
      }
      return true;
    } catch (e) {
      print('Error check email by id $e');
      throw Exception('Error check email by id $e');
    }
  }
}
