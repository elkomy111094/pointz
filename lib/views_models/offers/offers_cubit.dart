import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());

  //TODO:-----------------------------------------------------------------------
  //TODO-------------------getting instance from cubit--------------------------
  //TODO:-----------------------------------------------------------------------
  static OffersCubit get(context) => BlocProvider.of(context);

  int categorySelectedId = 0;
  String categorySelectedCode = "";

  setCategorySelectedId(int id, String code) {
    categorySelectedCode = code;
    categorySelectedId = id;
    emit(Refresh());
  }
}
