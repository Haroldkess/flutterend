import 'package:cloud_firestore/cloud_firestore.dart';

class Control {
  late String? pubKey;
  late double? amount;
  late bool? isError;
  Control({this.amount, this.pubKey,  this.isError});

  factory Control.fromDoc(DocumentSnapshot doc) {
    return Control(pubKey: doc['pubkey'], amount: doc['amount']);
  }
}
