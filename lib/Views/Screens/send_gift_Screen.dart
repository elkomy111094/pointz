import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/views_models/gifts/gifts_cubit.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/custom_drop_down_menu.dart';
import '../Widgets/simple_Header.dart';
import '../Widgets/square_text_field.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({Key? key}) : super(key: key);

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  @override
  void initState() {
    GiftsCubit inst = GiftsCubit.get(context);
    inst.getAllBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GiftsCubit, GiftsState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is GiftLoading) {
          showProgressIndicator(context);
        }
        if (state is SuccessSend) {
          pop(context);
          showToast(context, "تم إرسال الهديه بنجاح");
        }
        if (state is FailedSend) {
          pop(context);
          showToast(context, "لم يتم إرسال الهديه لحدوث خطأ ما");
        }
      },
      builder: (context, state) {
        GiftsCubit inst = GiftsCubit.get(context);
        return SafeArea(
          child: Directionality(
            textDirection: getDirection(context),
            child: Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 14.h),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Form(
                              key: inst.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: "Gift Value".tr(),
                                            style: TextStyle(
                                              letterSpacing: 0,
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: "Taga",
                                            )),
                                      ),
                                    ],
                                  ),
                                  SquareTextField(
                                    controller: inst.giftValue,
                                    validator: (giftValue) {
                                      if (inst.giftValue.text.isEmpty ||
                                          inst.giftValue.text == "") {
                                        return "يجب إدخال قيمه الهديه";
                                      } else if (double.parse(
                                              inst.giftValue.text) <
                                          10) {
                                        return "يجب أن تكون قيمه الهديه أكبر من 10 SR";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSubmit: (giftValue) {
                                      print(inst.giftValue.text);
                                    },
                                    maxLength: 10,
                                    textLetterSpaceing: 2,
                                    suffixWidget: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.7.h),
                                      child: Text(
                                        "SR",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15..sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    hintText: "",
                                    fillColor: kBackGroundColor,
                                    onChanged: (phone) {},
                                    keyBoardType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  //--------------------------------------------
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: "الرساله",
                                            style: TextStyle(
                                              letterSpacing: 0,
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: "Taga",
                                            )),
                                      ),
                                    ],
                                  ),
                                  SquareTextField(
                                    maxLength: 100,
                                    validator: (giftMessage) {
                                      if (inst.giftMessage.text.isEmpty ||
                                          inst.giftMessage.text == "") {
                                        return "من فضلك قم بكتابه رساله للمستلم";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSubmit: (giftMessage) {
                                      print(inst.giftMessage.text);
                                    },
                                    controller: inst.giftMessage,
                                    fillColor: kBackGroundColor,
                                    hintText: "",
                                    onChanged: (phone) {},
                                    maxLines: 2,
                                    keyBoardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  //--------------------------------------------
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: "رقم هاتف المستلم",
                                            style: TextStyle(
                                              letterSpacing: 0,
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: "Taga",
                                            )),
                                      ),
                                    ],
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: SquareTextField(
                                      fillColor: kBackGroundColor,
                                      textLetterSpaceing: 2,
                                      prefixText: "+9665 ",
                                      onSubmit: (phone) {
                                        print(inst.receiverPhoneNumber.text);
                                      },
                                      maxLength: 8,
                                      hintText: "",
                                      validator: (phoneVal) {
                                        RegisterationCubit Rinst =
                                            RegisterationCubit.get(context);
                                        String currentUserphoneNumber = Rinst
                                            .userResponse!
                                            .result!
                                            .responseResult!
                                            .phoneNumber!;

                                        if (phoneVal!.isEmpty) {
                                          return "pleaseEnterYourPhoneNumber"
                                              .tr();
                                        } else if (("+9665" +
                                                inst.receiverPhoneNumber
                                                    .text) ==
                                            currentUserphoneNumber) {
                                          return "لايمكنك إرسال الهدايا للرقم الخاص بك";
                                        } else if (!RegExp(
                                                r'(^(?:[+0]9)?[0-9]{8,8}$)')
                                            .hasMatch(phoneVal)) {
                                          return "pleaseEnterCorrectPhoneNumber"
                                              .tr();
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: inst.receiverPhoneNumber,
                                      onChanged: (phone) {},
                                      keyBoardType: TextInputType.phone,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  //--------------------------------------------
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: "اسم المستلم",
                                            style: TextStyle(
                                              letterSpacing: 0,
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontFamily: "Taga",
                                            )),
                                      ),
                                    ],
                                  ),
                                  SquareTextField(
                                    maxLength: 25,
                                    validator: (name) {
                                      if (inst.giftReceiverName.text.isEmpty ||
                                          inst.giftReceiverName.text == "") {
                                        return "من فضلك أدخل إسم أو لقب لمستلم الهديه";
                                      }
                                    },
                                    controller: inst.giftReceiverName,
                                    fillColor: kBackGroundColor,
                                    hintText: "",
                                    onChanged: (phone) {},
                                    keyBoardType: TextInputType.name,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  //--------------------------------------------
                                  Container(
                                    height: 13.h,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "إختر المتجر",
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontFamily: "Taga",
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              CustomDropDownMenu(
                                                items: inst.allBusinesses != []
                                                    ? (inst.allBusinesses)
                                                        .map((business) =>
                                                            checkRTL(context)
                                                                ? business
                                                                    .nameAr
                                                                    .toString()
                                                                : business
                                                                    .nameEn
                                                                    .toString())
                                                        .toList()
                                                    : null,
                                                hint: "",
                                                dropdownvalue:
                                                    inst.choosenBusiness,
                                                onchanged: (val) {
                                                  inst.setChoosenBussiness(val);
                                                  inst.getBusinessId(
                                                      val, context);
                                                },
                                              ),

                                              /* SizedBox(
                                            height: 8.h,
                                            child: SquareTextField(
                                              hintText: "",
                                              suffixWidget: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.arrow_drop_down_sharp),
                                              ),
                                              onChanged: (phone) {},
                                              keyBoardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),*/
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomTextButton(
                                      buttonColor: kMainColor,
                                      textColor: Colors.white,
                                      buttonHorizontalPaddingval: 20.w,
                                      roundedBorder: 1.h,
                                      textSize: 12.sp,
                                      onPressed: () async {
                                        /*pushToStack(context, GiftPaymentScreen());*/
                                        if (inst.formKey.currentState!
                                            .validate()) {
                                          if (inst.choosenBusiness == null ||
                                              inst.choosenBusiness == "") {
                                            showToast(context,
                                                "من فضلك إختار متجر هديتك");
                                          } else {
                                            RegisterationCubit regInst =
                                                RegisterationCubit.get(context);

                                            await inst.sendGift(regInst
                                                .userResponse!
                                                .result!
                                                .responseResult!
                                                .id!);
                                          }
                                        }
                                      },
                                      text: "متابعه"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SimpleHeader(
                          headerTitle: 'إرسال بطاقه إهداء',
                        ),
                        /*Center(
                          child: GiftItemCard(),
                        ),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
