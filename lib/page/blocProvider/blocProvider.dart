import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrisnap_mobile/core/injection/injection.dart';
import 'package:nutrisnap_mobile/page/cubit/predict_cubit.dart';

class GlobalStateProvider extends StatelessWidget {
  final Widget child;
  const GlobalStateProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PredictCubit>()),
      ],
      child: child,
    );
  }
}
