import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutrisnap_mobile/data/models/model_predict.dart';
import 'package:nutrisnap_mobile/data/repositories/predict_repository.dart';

class PredictCubitState {
  final GiziBuah? giziBuah;
  final String? error;

  PredictCubitState({this.giziBuah, this.error});
}

class PredictCubitInitial extends PredictCubitState {
  PredictCubitInitial() : super();
}

@injectable
class PredictCubit extends Cubit<PredictCubitState> {
  final PredictRepository _predictRepository;

  PredictCubit(this._predictRepository) : super(PredictCubitInitial());

  Future<void> predictBuah(String buah) async {
    //emit(PredictCubitState(giziBuah: null, error: null, isLoading: true));
    emit(PredictLoading());
    try {
      final giziBuah = await _predictRepository.predictBuah(buah);
      emit(PredictCubitState(giziBuah: giziBuah));
    } catch (e) {
      emit(PredictCubitState(error: e.toString()));
    }
  }
}

class PredictLoading extends PredictCubitState {}
