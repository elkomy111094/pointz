part of 'registeration_cubit.dart';

@immutable
abstract class RegisterationState {}

class RegisterationInitial extends RegisterationState {}

class Loading extends RegisterationState {}

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
