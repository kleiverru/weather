import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:app_weather_pt/bloc/wether_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return Image.asset("assets/tormenta.gif");
    } else if (code >= 300 && code < 500) {
      return Image.asset("assets/lluvia.gif");
    } else if (code >= 500 && code < 600) {
      return Image.asset("assets/lluvia.gif");
    } else if (code >= 600 && code < 700) {
      return Image.asset("assets/frio.gif");
    } else if (code >= 700 && code < 800) {
      return Image.asset("assets/sol.gif");
    } else if (code >= 800 && code <= 804) {
      return Image.asset("assets/sol.gif");
    } else {
      return Image.asset(
          "assets/nublado.gif"); // default icon for unknown codes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 14, 14),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 123, 15, 211),
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 93, 34, 170),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 93, 34, 170),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(244, 245, 182, 9),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 125, 21, 223),
                  ),
                ),
              ),
              BlocBuilder<WetherBlocBloc, WetherBlocState>(
                builder: (context, state) {
                  if (state is WetherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.weather.areaName}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${state.weather.country}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              child: getWeatherIcon(state.weather.code ?? 0),
                            ),
                          ),
                          //Image.asset('assets/despejado.gif'),
                          Center(
                              child: Text(
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            state.weather.weatherMain!,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            DateFormat.yMMMMEEEEd()
                                .add_Hms()
                                .format(DateTime.now()),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: SizedBox(
                            width: 200,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _refreshData();
                                });
                              },
                              child: const Text('Actualizar'),
                            ),
                          ))
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _refreshData {}

extension on Weather {
  get code => null;
}
