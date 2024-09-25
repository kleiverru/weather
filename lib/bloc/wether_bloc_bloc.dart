import 'package:app_weather_pt/service/service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'wether_bloc_event.dart';
part 'wether_bloc_state.dart';

class WetherBlocBloc extends Bloc<WetherBlocEvent, WetherBlocState> {
  WetherBlocBloc() : super(WetherBlocInitial()) {
    on<WetherBlocEvent>((event, emit) async {
      emit(WetherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(KEY, language: Language.SPANISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WetherBlocSuccess(weather));
      } catch (e) {
        emit(WetherBlocFailure());
      }
    });
  }
}
