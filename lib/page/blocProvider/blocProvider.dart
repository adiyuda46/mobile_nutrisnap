import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrisnap_mobile/bloc/tes/tes_bloc.dart';
import 'package:nutrisnap_mobile/bloc/tes1/tes1_bloc.dart';

class GlobalStateProvider extends StatelessWidget {
  final Widget child;
  const GlobalStateProvider({super.key , required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TesBloc(),
        ),
        BlocProvider(
          create: (context) => Tes1Bloc(),
        ),
      ],
      child: child,
    );
  }
}