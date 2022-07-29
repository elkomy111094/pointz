import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  TextEditingController categorySearchController =
      TextEditingController(text: "");

  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO-------------------getting instance from cubit--------------------------
  //TODO:-----------------------------------------------------------------------
  static CategoryCubit get(context) => BlocProvider.of(context);
}
