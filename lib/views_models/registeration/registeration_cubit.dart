import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/models/user_details_Response.dart';

import '../../core/services/user_registeration_services.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(RegisterationInitial());
  late String verificationId;
  String? userFirebaseId;
  bool termsAndConditionsAgreement = false;
  int? myResendToken;
  String userBirthDate = "";
  DateTime? _userDateOfBirth;
  String userGender = "male";
  User? user;
  String? refereshedFirebaseToken;
  UserDeatailsResponse? userResponse;

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _phoneRegisterationFormKey = GlobalKey<FormState>();
  final _completeRegisterationFormKey = GlobalKey<FormState>();

  static RegisterationCubit get(context) => BlocProvider.of(context);
  TextEditingController get phoneNumberController => _phoneNumberController;
  GlobalKey get phoneRegisterationFormKey => _phoneRegisterationFormKey;
  GlobalKey get completeRegisterationFormKey => _completeRegisterationFormKey;
  DateTime? get designerDateOfBirth => _userDateOfBirth;

  setUserGender(String userGenderStatus) {
    userGender = userGenderStatus;
    emit(UserGenderSelected());
  }

  setUserDateOfBirth(var val) {
    _userDateOfBirth = val;
    emit(UserBirthOfDateIsSelected(_userDateOfBirth));
  }

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
    /*myResendToken = resendToken;*/
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
      case "NETWORK-REQUEST-FAILED":
        errorMessage = "تأكد من إتصالك بالأنترنت";
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
    /*myResendToken = resendToken;*/
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    emit(Loading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        user = value.user!;
        await getUserDetails(
            phoneNumber: phoneNumberController.text, UID: user!.uid.toString());
      });
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
        case "network-request-failed":
          errorMessage = "تأكد من إتصالك بالأنترنت";
          break;
        default:
          errorMessage = "خطأ غير معروف";
      }

      emit(OTPErrorOccurred(errorMsg: errorMessage));
    }
  }

  /*Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await FirebaseAuth.instance
          .signInWithPhoneNumber(phoneNumber)
          .then((value) {
        value.verificationId;
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
        case "network-request-failed":
          errorMessage = "تأكد من إتصالك بالأنترنت";
          break;
        default:
          errorMessage = "خطأ غير معروف";
      }

      emit(OTPErrorOccurred(errorMsg: errorMessage));
    }
  }*/

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  //Todo:----------------------------------Complete Registeration---------------------------------------------------
//Todo:-----------------------------------------------------------------------------------------------------------
//Todo:-----------------------------------------------------------------------------------------------------------
//Todo:-----------------------------------------------------------------------------------------------------------

  validateCompleteRegisterationForm(BuildContext context) {
    _completeRegisterationFormKey.currentState!.save();
    if (_completeRegisterationFormKey.currentState!.validate()) {
      if (_userDateOfBirth == null) {
        showToast(context, "من فضلك إختر تاريخ ميلاد");
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  String getGenderCode() {
    if (userGender == "male") {
      return "M";
    } else {
      return "F";
    }
  }

  Future<bool> postNewUser(BuildContext context) async {
    emit(CompleteRegisterationLoading());
    user!.refreshToken;
    await user!.getIdTokenResult().then((idToken) async {
      await UserRegisterationServices()
          .postNewUser(
              firebaseToken: idToken.token!,
              user: {
                "firstName": firstNameController.text.toString(),
                "lastName": lastNameController.text.toString(),
                "email": emailController.text.toString(),
                "phoneNumber": "+9665" + phoneNumberController.text,
                "genderCode": getGenderCode(),
                "birthDate": _userDateOfBirth!.toIso8601String(),
                "firebaseUID": user!.uid.toString(),
              },
              context: context)
          .then((value) async {
        if (value == "true") {
          await getUserDetails(
                  phoneNumber: phoneNumberController.text,
                  UID: user!.uid.toString())
              .then((value) => emit(SuccessRegisteration()));
        } else {
          emit(FailedRegisteration(errorMsg: value));
        }
        return value;
      });
    });
    return false;
  }

  Future<bool> getUserDetails(
      {required String phoneNumber, required String UID}) async {
    if (phoneNumber.contains("+9665")) {
      phoneNumber = phoneNumber.replaceAll("+9665", "");
    }
    FirebaseAuth.instance.currentUser?.refreshToken;
    await FirebaseAuth.instance.currentUser
        ?.getIdTokenResult()
        .then((idToken) async {
      refereshedFirebaseToken = idToken.token;

      await UserRegisterationServices().getUserDetails(
        firebaseToken: idToken.token!,
        user: {
          "phoneNumber": "+9665" + phoneNumber,
          "firebaseUID": user?.uid ?? UID,
        },
      ).then((value) {
        if (value == false) {
          emit(UserNotRegisteredBefore());
        } else {
          userResponse = value;
          emit(UserRegisteredBefore());
        }
        return value;
      });
    });
    return false;
  }

  getRefereshedToken() {
    user!.refreshToken;
    return user!.getIdToken().then((value) => value);
  }
}
