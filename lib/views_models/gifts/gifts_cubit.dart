import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pointz/core/services/gifts_Services.dart';
import 'package:pointz/helper/components.dart';

import '../../models/all_businesses_respponse.dart';

part 'gifts_state.dart';

class GiftsCubit extends Cubit<GiftsState> {
  GiftsCubit() : super(GiftsInitial());

  List<DropDownBusiness> allBusinesses = [];
  String? _choosenBusiness;
  int? choosenBusinessId = 0;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController receiverPhoneNumber = TextEditingController(text: "");
  TextEditingController giftValue = TextEditingController(text: "");
  TextEditingController giftMessage = TextEditingController(text: "");
  TextEditingController giftReceiverName = TextEditingController(text: "");

  //TODO:-----------------------------------------------------------------------
  //TODO-------------------getting instance from cubit--------------------------
  //TODO:-----------------------------------------------------------------------
  static GiftsCubit get(context) => BlocProvider.of(context);
  String? get choosenBusiness => _choosenBusiness;

  setChoosenBussiness(var val) {
    _choosenBusiness = val;
    emit(BusinessIsChoosen());
  }

  getBusinessId(var businessName, BuildContext context) {
    if (allBusinesses.isNotEmpty) {
      allBusinesses.forEach((bussiness) {
        if ((checkRTL(context) ? bussiness.nameAr : bussiness.nameEn) ==
            businessName) {
          choosenBusinessId = bussiness.id;
          print(choosenBusiness);
          emit(BusinessIdIsChoosen());
        }
      });
    } else {}
  }

  Future getAllBusinesses() async {
    GiftsServices().getAllBusinesses().then((value) {
      allBusinesses = value;
      emit(AllBussinessesGetten());
    });
  }

  Future sendGift(int senderId) async {
    emit(GiftLoading());
    Map<String, dynamic> gift = {
      "amount": double.parse(giftValue.text),
      "message": giftMessage.text,
      "receiverName": giftReceiverName.text,
      "receiverPhoneNumber": "+9665" + receiverPhoneNumber.text,
      "senderID": senderId,
      "businessID": choosenBusinessId,
    };
    await GiftsServices().sendGift(gift: gift).then((value) {
      if (value == true) {
        emit(SuccessSend());
      } else {
        emit(FailedSend());
      }
    });
  }
}
