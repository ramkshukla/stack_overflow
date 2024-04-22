class PhoneAuthState {
  final bool isLoading;
  final String phoneNumber;
  final String verificationId;
  final bool isOtpGenerated;
  final String otp;
  final bool isInvalidOTP;
  final String signInSuccessfull;
  final bool isFetching;

  PhoneAuthState({
    required this.isLoading,
    required this.phoneNumber,
    required this.otp,
    required this.verificationId,
    required this.isOtpGenerated,
    required this.isInvalidOTP,
    required this.signInSuccessfull,
    required this.isFetching,
  });

  factory PhoneAuthState.initial() => PhoneAuthState(
        isLoading: false,
        phoneNumber: "",
        otp: "",
        verificationId: "",
        isOtpGenerated: false,
        isInvalidOTP: false,
        signInSuccessfull: "",
        isFetching: false,
      );

  PhoneAuthState copyWith({
    bool? isLoading,
    String? phoneNumber,
    String? verificationId,
    bool? isOtpGenerated,
    String? otp,
    bool? isInvalidOTP,
    String? signInSuccessfull,
    bool? isFetching,
  }) {
    return PhoneAuthState(
      isLoading: isLoading ?? this.isLoading,
      otp: otp ?? this.otp,
      isFetching: isFetching ?? this.isFetching,
      isInvalidOTP: isInvalidOTP ?? this.isInvalidOTP,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isOtpGenerated: isOtpGenerated ?? this.isOtpGenerated,
      signInSuccessfull: signInSuccessfull ?? this.signInSuccessfull,
      verificationId: verificationId ?? this.verificationId,
    );
  }
}
