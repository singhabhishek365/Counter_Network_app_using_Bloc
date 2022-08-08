import 'package:counter_app_bloc/bloc/internet_bloc.dart';
import 'package:counter_app_bloc/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectivity extends StatelessWidget {
  const MyConnectivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(child:
          BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
        // For checking Value
        // For checking Data Types
        // exp int a=2; (a==2) correct (a is int) correct
        if (state is InternetGainedState) {
          return const Text("Connected");
        } else if (state is InternetLostState) {
          return const Text("NotConnected!");
        }

        return const  CircularProgressIndicator();
      })),
    ));
  }
}
