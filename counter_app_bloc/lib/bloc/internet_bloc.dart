// This file will create connection between Event and State

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:counter_app_bloc/bloc/internet_event.dart';
import 'package:counter_app_bloc/bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final _connectivity = Connectivity();
  // Created Beacuse we need to off listen when app closes
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    // Super Use for inherit from parent class we need to initilize it with  initial state


    on<InternetGainedEvent>((event, emit) {
      return  emit(InternetGainedState());
    });

    on<InternetLostEvent>((event, emit) {
      return emit(InternetLostState());
    });

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
