import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:meta/meta.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/models/user_details_Response.dart';

import '../../core/services/user_registeration_services.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(RegisterationInitial());

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO-----------------------------------Fields-------------------------------
  //TODO:-----------------------------------------------------------------------
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
  TextEditingController searchController = TextEditingController(text: "");
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
  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO--------------------------------Setters---------------------------------
  //TODO:-----------------------------------------------------------------------
  setUserGender(String userGenderStatus) {
    userGender = userGenderStatus;
    emit(UserGenderSelected());
  }

  setUserDateOfBirth(var val) {
    _userDateOfBirth = val;
    emit(UserBirthOfDateIsSelected(_userDateOfBirth));
  }

  changeTermsAndConditionsAgreemetState(bool state) {
    termsAndConditionsAgreement = state;
    emit(AgreementState());
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------------Phone Number Form Validator---------------------
  //TODO:-----------------------------------------------------------------------
  bool validatePhoneNumber(BuildContext context) {
    _phoneRegisterationFormKey.currentState!.save();
    if (_phoneRegisterationFormKey.currentState!.validate()) {
      if (termsAndConditionsAgreement == true) {
        return true;
      } else {
        showToast(context,
            "Please agree to the terms and conditions of the application".tr());
        return false;
      }
    } else {
      return false;
    }
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------Submit Phone And Recieve OTP -----------------------
  //TODO:-----------------------------------------------------------------------
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

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------------------Resend OTP Method -----------------------
  //TODO:-----------------------------------------------------------------------
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
            "Sorry, you made too many attempts, please try again later".tr();
        break;
      case "NETWORK-REQUEST-FAILED":
        errorMessage = "Make sure you connect to the Internet".tr();
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

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO----------------------For Submitting Recieved OTP-----------------------
  //TODO:-----------------------------------------------------------------------
  Future<void> submitOTP(String otpCode) async {
    emit(Loading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO--Firebase Sign In With Phone Number And Getting Firebase Current User--
  //TODO:-----------------------------------------------------------------------
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
          errorMessage = "Incorrect verification code".tr();
          break;
        case "session-expired":
          errorMessage =
              "The code that was sent to you has ended, please click Re -send the code."
                  .tr();
          break;
        case "network-request-failed":
          errorMessage = "Make sure you connect to the Internet".tr();
          break;
        default:
          errorMessage = "Unknown Error".tr();
      }

      emit(OTPErrorOccurred(errorMsg: errorMessage));
    }
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO--------------------Logout Firebase Current User------------------------
  //TODO:-----------------------------------------------------------------------
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO-------------Validate Complete Registeration Form ----------------------
  //TODO:-----------------------------------------------------------------------
  validateCompleteRegisterationForm(BuildContext context) {
    _completeRegisterationFormKey.currentState!.save();
    if (_completeRegisterationFormKey.currentState!.validate()) {
      if (_userDateOfBirth == null) {
        showToast(context, "Please choose the date of birth".tr());
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------Getting Gender Code(M or F)From Gender Type ---------------
  //TODO:-----------------------------------------------------------------------
  String getGenderCode() {
    if (userGender == "male") {
      return "M";
    } else {
      return "F";
    }
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO--------------------Add New User To The Backend  -----------------------
  //TODO:-----------------------------------------------------------------------
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

  //.
  //.
  //.
  //.
  //.
  //.
  //TODO:-----------------------------------------------------------------------
  //TODO------------ To Check If Your Registered Before Or Not  ---------------
  //TODO:-----------------------------------------------------------------------
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
