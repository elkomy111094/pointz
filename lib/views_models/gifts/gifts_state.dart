part of 'gifts_cubit.dart';

@immutable
abstract class GiftsState {}

class GiftsInitial extends GiftsState {}

class BusinessIsChoosen extends GiftsState {}

class BusinessIdIsChoosen extends GiftsState {}

class AllBussinessesGetten extends GiftsState {}

class GiftLoading extends GiftsState {}

class SuccessSend extends GiftsState {}

class FailedSend extends GiftsState {}
