import 'package:stack_overflow/module/brewary/model/program_account_detail.dart';

class OrientDTO {
  final String errorCode;
  final String errorMessage;
  final String earnPoints;
  final String redeemPoints;
  final String balance;
  final String totalQrCodeScan;
  final String totalQRcodeEarnPoints;
  final String buFansPoint;
  final String buFansname;
  final String buAppliancespoint;
  final String buAppliancesname;
  final String buLightpoint;
  final String buLightname;
  final String buSwitchgearpoint;
  final String bsSwitchgearname;
  final ResponseDTO response;

  OrientDTO({
    required this.errorCode,
    required this.errorMessage,
    required this.earnPoints,
    required this.redeemPoints,
    required this.balance,
    required this.totalQrCodeScan,
    required this.totalQRcodeEarnPoints,
    required this.buFansPoint,
    required this.buFansname,
    required this.buLightpoint,
    required this.buLightname,
    required this.bsSwitchgearname,
    required this.buSwitchgearpoint,
    required this.buAppliancesname,
    required this.buAppliancespoint,
    required this.response,
  });

  factory OrientDTO.initial() => OrientDTO(
        errorCode: "",
        errorMessage: "",
        earnPoints: "",
        redeemPoints: "",
        balance: "",
        totalQrCodeScan: "",
        totalQRcodeEarnPoints: "",
        buFansPoint: "",
        buFansname: "",
        buLightpoint: "",
        buLightname: "",
        bsSwitchgearname: "",
        buSwitchgearpoint: "",
        buAppliancesname: "",
        buAppliancespoint: "",
        response: ResponseDTO.initial(),
      );

  factory OrientDTO.fromJson(Map<String, dynamic> json) {
    return OrientDTO(
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      earnPoints: json["earnPoints"],
      redeemPoints: json["redeemedPoints"],
      balance: json["balance"],
      totalQrCodeScan: json["TotalQRcodeScan"],
      totalQRcodeEarnPoints: json["TotalQRcodeEarnPoints"],
      buFansPoint: json["BUFanspoint"],
      buFansname: json["BUFansname"],
      buLightpoint: json["BULightpoint"],
      buLightname: json["BULightname"],
      bsSwitchgearname: json["BsSwitchgearname"],
      buSwitchgearpoint: json["BUSwitchgearpoint"],
      buAppliancesname: json["BUappliancesname"],
      buAppliancespoint: json["BUAppliancespoint"],
      response: json["Response"] != null
          ? ResponseDTO.fromJson(json["Response"])
          : ResponseDTO.initial(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "ErrorCode": errorCode,
      "ErrorMessage": errorMessage,
      "earnPoints": earnPoints,
      "redeemedPoints": redeemPoints,
      "balance": balance,
      "TotalQRcodeScan": totalQrCodeScan,
      "TotalQRcodeEarnPoints": totalQRcodeEarnPoints,
      "BUFanspoint": buFansPoint,
      "BUFansname": buFansname,
      "BUAppliancespoint": buAppliancespoint,
      "BUappliancesname": buAppliancesname,
      "BULightpoint": buAppliancespoint,
      "BULightname": buLightname,
      "BUSwitchgearpoint": buSwitchgearpoint,
      "BsSwitchgearname": bsSwitchgearname,
      "Response": response.toJson(),
    };
  }
}

class ResponseDTO {
  final List<ProgramAccountStatementDetails> programAccountStatementDetails;
  ResponseDTO({required this.programAccountStatementDetails});

  factory ResponseDTO.initial() => ResponseDTO(
        programAccountStatementDetails: [],
      );

  factory ResponseDTO.fromJson(Map<String, dynamic> json) {
    return ResponseDTO(
      programAccountStatementDetails: json["ProgramAccountStatementDetails"]
          .map<ProgramAccountStatementDetails>(
              (e) => ProgramAccountStatementDetails.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "ProgramAccountStatementDetails": programAccountStatementDetails,
    };
  }
}
