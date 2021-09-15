import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (isSelected(id) == false) {
      state.add(id);
    } else {
      state.remove(id);
      print('state : $id have been removed');
    }

    print(state);
    emit(List.from(state));
  }

  //NOTE: mengecek ketersediaan id seat didalam list
  bool isSelected(String id) {
    int index = state.indexOf(id);
    print('index : $index');
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
