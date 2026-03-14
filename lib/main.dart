import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrisnap_mobile/app.dart';
import 'package:nutrisnap_mobile/data/datasource/predict_datasource.dart';
import 'package:nutrisnap_mobile/data/repositories/predict_repository.dart';
import 'package:nutrisnap_mobile/page/cubit/predict_cubit.dart';

final GetIt getIt = GetIt.instance;

// set up get it
void setup() {
  // Register dependencies
  getIt.registerLazySingleton<PredictDataSource>(() => PredictDataSource());
  // Register repositories
  getIt.registerLazySingleton<PredictRepository>(
      () => PredictRepository(getIt<PredictDataSource>()));
  // Register cubits
  getIt.registerFactory(() => PredictCubit(getIt<PredictRepository>()));
}

void main() {
  setup();
  runApp(App());
}
