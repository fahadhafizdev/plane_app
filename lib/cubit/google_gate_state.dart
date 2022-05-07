part of 'google_gate_cubit.dart';

abstract class GoogleGateState extends Equatable {
  const GoogleGateState();

  @override
  List<Object> get props => [];
}

class GoogleGateInitial extends GoogleGateState {}

class GoogleGateLoading extends GoogleGateState {}

class GoogleGateSuccess extends GoogleGateState {}

class GoogleGateFailed extends GoogleGateState {
  final String message;
  GoogleGateFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
