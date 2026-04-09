import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrisnap_mobile/app.dart';
import 'package:nutrisnap_mobile/data/datasource/detail_gizi_datasource.dart';
import 'package:nutrisnap_mobile/data/datasource/predict_datasource.dart';
import 'package:nutrisnap_mobile/data/repositories/gizi_detail_repository.dart';
import 'package:nutrisnap_mobile/data/repositories/predict_repository.dart';
import 'package:nutrisnap_mobile/page/cubit/gizi_detail_cubit.dart';
import 'package:nutrisnap_mobile/page/cubit/predict_cubit.dart';

final GetIt getIt = GetIt.instance;

// set up get it
void setup() {
  // Register dependencies
  getIt.registerLazySingleton<PredictDataSource>(() => PredictDataSource());
  getIt.registerLazySingleton<DetailGiziDatasource>(
      () => DetailGiziDatasource());
  // Register repositories
  getIt.registerLazySingleton<PredictRepository>(
      () => PredictRepository(getIt<PredictDataSource>()));
  getIt.registerLazySingleton<DetailGiziRepository>(
      () => DetailGiziRepository(getIt<DetailGiziDatasource>()));
  // Register cubits
  getIt.registerFactory(() => PredictCubit(getIt<PredictRepository>()));
  getIt.registerFactory(() => DetailGiziCubit(getIt<DetailGiziRepository>()));
}

void main() {
  setup();
  runApp(App());
}
