part of 'wether_bloc_bloc.dart';

sealed class WetherBlocState extends Equatable {
  const WetherBlocState();

  @override
  List<Object> get props => [];
}

final class WetherBlocInitial extends WetherBlocState {}

final class WetherBlocLoading extends WetherBlocState {}

final class WetherBlocFailure extends WetherBlocState {}

final class WetherBlocSuccess extends WetherBlocState {
  final Weather weather;

  const WetherBlocSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}
