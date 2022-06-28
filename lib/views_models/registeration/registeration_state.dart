part of 'registeration_cubit.dart';

@immutable
abstract class RegisterationState {}

class RegisterationInitial extends RegisterationState {}

class Loading extends RegisterationState {}

class CompleteRegisterationLoading extends RegisterationState {}

class SuccessRegisteration extends RegisterationState {}

class FailedRegisteration extends RegisterationState {
  final String errorMsg;

  FailedRegisteration({required this.errorMsg});
}

class PhoneNumberSubmitErrorOccurred extends RegisterationState {
  final String errorMsg;

  PhoneNumberSubmitErrorOccurred({required this.errorMsg});
}

class OTPResendErrorOccurred extends RegisterationState {
  final String errorMsg;

  OTPResendErrorOccurred({required this.errorMsg});
}

class OTPErrorOccurred extends RegisterationState {
  final String errorMsg;

  OTPErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends RegisterationState {}

class PhoneOTPVerified extends RegisterationState {}

class PhoneOTPResent extends RegisterationState {}

class AgreementState extends RegisterationState {}

class UserGenderSelected extends RegisterationState {}

class UserBirthOfDateIsSelected extends RegisterationState {
  UserBirthOfDateIsSelected(var dateOfBirth) {
    log("${dateOfBirth.toString()} : Is Selected");
  }
}
