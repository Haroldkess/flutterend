import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterend/model/control.dart';
import 'package:flutterend/model/user_model.dart';

final firebase = FirebaseFirestore.instance;

class DatabaseService {
  static Future<bool> addUser(BuildContext context, UserModel user) async {
    late bool isDone;

    try {
      firebase.runTransaction((transaction) async {
        transaction.set(firebase.collection("users").doc(), {
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
        });
      }).whenComplete(() => isDone = true);
    } catch (e) {
      isDone = false;
    }

    return isDone;
  }

  static Future<Control> getControl(BuildContext context) async {
    late Control control;

    try {
      await firebase
          .collection("controls")
          .doc("oneGod1997")
          .get()
          .then((value) {
        print(value.data()!['pubkey']);
        control = Control(
            amount: double.tryParse(value.data()!['amount'].toString()),
            pubKey: value.data()!['pubkey'],
            isError: false);
      }).whenComplete(() => print('done'));
    } catch (e) {
      print(e);
      control = Control(isError: true, amount: 0, pubKey: null);
    }

    return control;
  }
}
