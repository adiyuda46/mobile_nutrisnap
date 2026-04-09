import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutrisnap_mobile/data/models/model_detail_gizi.dart';
import 'package:nutrisnap_mobile/data/repositories/gizi_detail_repository.dart';

class DetailGiziCubitState {
  final ResultGiziDetail? giziBuahDetail;
  final String? error;

  DetailGiziCubitState({this.giziBuahDetail,this.error});
}

class GiziDetailInitial extends DetailGiziCubitState{
  GiziDetailInitial() : super();
}

class GiziDetailLoading extends  DetailGiziCubitState{}



@injectable
class DetailGiziCubit extends Cubit<DetailGiziCubitState> {
  DetailGiziCubit(this._giziDetailRepository) : super(GiziDetailInitial());

  final DetailGiziRepository _giziDetailRepository;

  Future<void>giziDetail(String detailBuah) async{
    emit(GiziDetailLoading());
    try {
      final giziBuahDetail = await _giziDetailRepository.giziDetail(detailBuah);
      emit(DetailGiziCubitState(giziBuahDetail: giziBuahDetail));
    } catch (e) {
      emit(DetailGiziCubitState(error: e.toString()));
    }
  }
  
}


