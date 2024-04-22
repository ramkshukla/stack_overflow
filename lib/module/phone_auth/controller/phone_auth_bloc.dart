import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_overflow/module/home/view/home_view.dart';
import 'package:stack_overflow/module/phone_auth/controller/phone_auth_event.dart';
import 'package:stack_overflow/module/phone_auth/controller/phone_auth_state.dart';
import 'package:stack_overflow/module/phone_auth/repo/phone_auth_repo.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  PhoneAuthBloc() : super(PhoneAuthState.initial()) {
    on<ChangePhoneNumber>(
      (event, emit) {
        emit(state.copyWith(phoneNumber: event.phoneNumber));
      },
    );

    on<VerifyPhoneEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, verificationId: ""));

        final result = await PhoneAuthRepoImpl().verifyPhoneNumber(
          phoneNumber: "+91${state.phoneNumber}",
        );

        final updatedState = result.fold(
          (l) => state.copyWith(isLoading: false),
          (r) => state.copyWith(
            isLoading: false,
            isOtpGenerated: true,
            verificationId: r,
          ),
        );

        emit(updatedState);
      },
    );

    on<ChangeOTP>(
      (event, emit) {
        emit(state.copyWith(otp: event.value));
      },
    );

    on<VerifyOTP>(
      (event, emit) async {
        emit(state.copyWith(isFetching: true));

        final result = await PhoneAuthRepoImpl().signInWithSmsCode(
          verificationCode: state.verificationId,
          smsCode: state.otp,
        );

        final updatedState = result.fold(
          (l) {
            SnackBar(
              content: Text("Invalid OTP"),
            );

            return state.copyWith(
              isFetching: false,
              otp: "",
              isInvalidOTP: l.code == "invalid-verification-code",
            );
          },
          (r) {
            if (r.isNotEmpty) {
              Navigator.push(
                event.context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
              SnackBar(
                content: Text("Sign In Successfull"),
              );
            }

            return state.copyWith(
              isLoading: false,
              signInSuccessfull: r,
            );
          },
        );

        emit(updatedState);
      },
    );
  }
}
