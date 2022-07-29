import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pointz/core/services/home_services.dart';
import 'package:pointz/models/active_advertisement.dart';

import '../../models/category.dart';
import '../../models/services_provider_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  BuildContext? mainContext;

  setMainContext(BuildContext ctx) {
    mainContext = ctx;
    emit(FavState());
  }

  List<Category>? categoriesList;
  List<Advertisment>? adsList;
  List<CategoriesTopsRespons>? catTopsList;
  /*Map<String, List<ServicesProvider>?> CategorieSomeServicesProviders = {};*/

  changeFavState() {
    emit(FavState());
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------------Add Store To My Favorites-----------------------
  //TODO:-----------------------------------------------------------------------
  changeFavoriteState(int id) {}

  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO-------------------getting instance from cubit--------------------------
  //TODO:-----------------------------------------------------------------------
  static HomeCubit get(context) => BlocProvider.of(context);
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------filling Map of Category and its Items-----------------
  //TODO:-----------------------------------------------------------------------
  fillInMap({required int customerID}) async {
    await HomeServices().getSomeServicesProviders(customerID).then((value) {
      catTopsList = value;
      emit(CategorySomeItemsOptained());
    });
  }

  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO-----------------------getting all Categories---------------------------
  //TODO:-----------------------------------------------------------------------
  Future getAllCategories() async {
    HomeServices().getAllCategories().then((value) {
      if (value != false) {
        categoriesList = value;
        emit(CategoriesResponseOptainedSuccessfully());
      }
    });
  }

  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO----------------------------getting All Ads-----------------------------
  //TODO:-----------------------------------------------------------------------
  Future getAllActiveAdvertisements() async {
    HomeServices().getAllActiveAdvertisements().then((value) {
      if (value != false) {
        adsList = value;
        emit(ActiveadvertisementsResponseIsOptained());
      }
    });
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------------Add Store To My Favorites-----------------------
  //TODO:-----------------------------------------------------------------------
  Future addToMyFavorites(
      {required int customerID, required int businessID}) async {
    changeFavState();
    return await HomeServices()
        .addToMyFavorites(customerID: customerID, businessID: businessID);
  }
}
