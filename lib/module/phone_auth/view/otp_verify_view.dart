// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:stack_overflow/module/home/view/home_view.dart';
// import 'package:stack_overflow/module/phone_auth/controller/phone_auth_bloc.dart';
// import 'package:stack_overflow/module/phone_auth/controller/phone_auth_event.dart';
// import 'package:stack_overflow/module/phone_auth/controller/phone_auth_state.dart';

// class OtpVeriyf extends StatefulWidget {
//   const OtpVeriyf({super.key});

//   @override
//   State<OtpVeriyf> createState() => _OtpVeriyfState();
// }

// class _OtpVeriyfState extends State<OtpVeriyf> {
//   final OtpFieldController controller = OtpFieldController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("Please enter otp sent on your device"),
//         OTPTextField(
//           controller: controller,
//           length: 6,
//           width: MediaQuery.of(context).size.width,
//           style: TextStyle(fontSize: 17),
//           textFieldAlignment: MainAxisAlignment.spaceAround,
//         ),
//         ElevatedButton(
//           onPressed: () async {},
//           child: Text("Verify OTP"),
//         )
//       ],
//     );
//   }
// }
