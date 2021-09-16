import 'package:equatable/equatable.dart';
import 'package:plane_app/models/destination_model.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final String userId;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    required this.userId,
    this.price = 0,
    this.amountOfTraveler = 0,
    this.grandTotal = 0,
    this.insurance = false,
    this.refundable = false,
    this.selectedSeats = '',
    this.vat = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        destination,
        price,
        amountOfTraveler,
        grandTotal,
        insurance,
        refundable,
        selectedSeats,
        vat,
      ];
}
