import 'package:firebase_auth/firebase_auth.dart';
import 'package:plane_app/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'userId': transaction.userId,
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      String uid = currentUser!.uid;
      QuerySnapshot result =
          await _transactionReference.where("userId", isEqualTo: uid).get();

      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();

      return transaction;
    } catch (e) {
      throw e;
    }
  }
}
