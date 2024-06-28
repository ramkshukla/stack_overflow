import 'package:flutter/material.dart';

abstract class PhoneAuthEvent {}

class OtpSent extends PhoneAuthEvent {
  BuildContext? context;
  OtpSent({required this.context});
}

class VerifyOtp extends PhoneAuthEvent {
  BuildContext? context;
  VerifyOtp({required this.context});
}

class VerifyPhoneEvent extends PhoneAuthEvent {
  VerifyPhoneEvent();
}

class ChangePhoneNumber extends PhoneAuthEvent {
  final String phoneNumber;
  ChangePhoneNumber({required this.phoneNumber});
}

class ChangeOTP extends PhoneAuthEvent {
  final String value;
  ChangeOTP({required this.value});
}

class VerifyOTP extends PhoneAuthEvent {
  final BuildContext context;
  VerifyOTP({required this.context});
}
