part of 'wether_bloc_bloc.dart';

sealed class WetherBlocEvent extends Equatable {
  const WetherBlocEvent();

  @override
  List<Object> get props => [];

  get position => null;
}

class FetchWether extends WetherBlocEvent {
  @override
  final Position position;

  const FetchWether(this.position);

  @override
  List<Object> get props => [position];
}
