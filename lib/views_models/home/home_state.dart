part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesResponseOptainedSuccessfully extends HomeState {}

class FavState extends HomeState {}

class ActiveadvertisementsResponseIsOptained extends HomeState {}

class CategorySomeItemsOptained extends HomeState {}
