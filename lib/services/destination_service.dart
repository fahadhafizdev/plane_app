import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plane_app/models/destination_model.dart';

class DestinationService {
  CollectionReference _destinationsReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationsReference.get();

      List<DestinationModel> destinations = result.docs.map(
        (e) {
          return DestinationModel.fromJson(
            e.id,
            e.data() as Map<String, dynamic>,
          );
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
