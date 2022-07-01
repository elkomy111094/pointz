import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pointz/core/services/home_services.dart';
import 'package:pointz/models/active_advertisement.dart';

import '../../models/category.dart';
import '../../models/services_provider_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Category>? categoriesList;

  Map<String, List<ServicesProvider>> CategorieSomeServicesProviders = {};

  List<Advertisment>? addsList;

  static HomeCubit get(context) => BlocProvider.of(context);

  fillInMap() {
    categoriesList!.forEach((category) async {
      String code = category.code!;
      print(code);
      await getCategorySomeServicesProviders(code);
    });
    emit(CategorySomeItemsOptained());
  }

  Future getAllCategories() async {
    HomeServices().getAllCategories().then((value) {
      if (value != false) {
        categoriesList = value;
        emit(CategoriesResponseOptainedSuccessfully());
      }
    });
  }

  Future getCategorySomeServicesProviders(String code) async {
    HomeServices().getSomeServicesProviders(code).then((value) {
      if (value != false) {
        emit(CategorySomeItemsOptained());
        CategorieSomeServicesProviders.addAll({code: value});
      }
    });
  }

  Future getAllActiveAdvertisements() async {
    HomeServices().getAllActiveAdvertisements().then((value) {
      if (value != false) {
        addsList = value;
        emit(ActiveadvertisementsResponseIsOptained());
      }
    });
  }
}
