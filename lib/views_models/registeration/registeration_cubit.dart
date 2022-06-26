import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pointz/helper/components.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(RegisterationInitial());
  late String verificationId;
  late String userFirebaseId;
  bool termsAndConditionsAgreement = false;
  int? myResendToken;
  TextEditingController _phoneNumberController = TextEditingController();
  final _phoneRegisterationFormKey = GlobalKey<FormState>();

  static RegisterationCubit get(context) => BlocProvider.of(context);
  TextEditingController get phoneNumberController => _phoneNumberController;
  GlobalKey get phoneRegisterationFormKey => _phoneRegisterationFormKey;

  //Todo:----------------------Phone Number Registeration And Otp Resend Methods------------------------------------
  //Todo:-----------------------------------------------------------------------------------------------------------
  //Todo:-----------------------------------------------------------------------------------------------------------
  //Todo:-----------------------------------------------------------------------------------------------------------
  changeTermsAndConditionsAgreemetState(bool state) {
    termsAndConditionsAgreement = state;
    emit(AgreementState());
  }

  bool validatePhoneNumber(BuildContext context) {
    _phoneRegisterationFormKey.currentState!.save();
    if (_phoneRegisterationFormKey.currentState!.validate()) {
      if (termsAndConditionsAgreement == true) {
        return true;
      } else {
        showToast(context, "من فضلك يجب الموافقه علي شروط وأحكام التطبيق");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$phoneNumber',
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      forceResendingToken: myResendToken,
    );
  }

  Future<void> resendOTP(String phoneNumber) async {
    emit(Loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$phoneNumber',
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeReSent,
      forceResendingToken: myResendToken,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void codeReSent(String verificationId, int? resendToken) {
    myResendToken = resendToken;
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneOTPResent());
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    String errorMessage = "";
    print(
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print('verificationFailed : ${error.code.toString().toUpperCase()}');

    switch (error.code.toString().toUpperCase()) {
      case "INVALID-EMAIL":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "WRONG-PASSWORD":
        errorMessage = "Your password is wrong.";
        break;
      case "USER-NOT-FOUND":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "USER-DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "TOO-MANY-REQUESTS":
        errorMessage =
            "عفوا : لقد أجريت العديد من المحاولات ، يرجي المحاوله لاحقا";
        break;
      case "OPERATION-NOT-ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    emit(PhoneNumberSubmitErrorOccurred(errorMsg: errorMessage));
  }

  void codeSent(String verificationId, int? resendToken) {
    myResendToken = resendToken;
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        log(value.user?.uid ?? "");
        userFirebaseId = value.user!.uid.toString();
      });
      emit(PhoneOTPVerified());
    } on FirebaseAuthException catch (error) {
      String errorMessage = "";

      log("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      log("${error.code}");

      switch (error.code.toString()) {
        case "invalid-verification-code":
          errorMessage = "كود تحقق غير صحيح";
          break;
        case "session-expired":
          errorMessage =
              "لقد إنتهت صلاحيه الكود الذي تم إرساله اليك ، من فضلك إضغط إعاده إرسال الكود";
          break;
        default:
          errorMessage = "خطأ غير معروف";
      }

      emit(OTPErrorOccurred(errorMsg: errorMessage));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
