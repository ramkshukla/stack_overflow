class ProgramAccountStatementDetails {
  final String transactionType;
  final String transactionId;
  final String transactionDate;
  final String invoiceNo;
  final String buName;
  final String skuCode;
  final String primaryQRCode;
  final String pointsEarned;
  final String tdsPoints;
  final String pointsRedeemed;
  final String campaignName;
  final String payoutReceived;
  final String payoutReturn;
  final String payOutTransactionId;
  final String externalReferenceId;
  final String payOutTransactionStatus;
  final String bankAccountNO;
  final String sourceType;
  final String reversalMainTransId;

  ProgramAccountStatementDetails({
    required this.transactionType,
    required this.transactionId,
    required this.transactionDate,
    required this.bankAccountNO,
    required this.buName,
    required this.campaignName,
    required this.externalReferenceId,
    required this.invoiceNo,
    required this.payOutTransactionId,
    required this.payOutTransactionStatus,
    required this.payoutReceived,
    required this.payoutReturn,
    required this.pointsEarned,
    required this.pointsRedeemed,
    required this.reversalMainTransId,
    required this.primaryQRCode,
    required this.skuCode,
    required this.sourceType,
    required this.tdsPoints,
  });

  factory ProgramAccountStatementDetails.initial() =>
      ProgramAccountStatementDetails(
        transactionType: "",
        transactionId: "",
        transactionDate: "",
        bankAccountNO: "",
        buName: "",
        campaignName: "",
        externalReferenceId: "",
        invoiceNo: "",
        payOutTransactionId: "",
        payOutTransactionStatus: "",
        payoutReceived: "",
        payoutReturn: "",
        pointsEarned: "",
        pointsRedeemed: "",
        reversalMainTransId: "",
        primaryQRCode: "",
        skuCode: "",
        sourceType: "",
        tdsPoints: "",
      );

  factory ProgramAccountStatementDetails.fromJson(Map<String, dynamic> json) {
    return ProgramAccountStatementDetails(
      transactionType:
          json["TransactionType"].isNotEmpty ? json["TransactionType"] : "",
      transactionId:
          json["TransactionId"].isNotEmpty ? json["TransactionId"] : "",
      transactionDate:
          json["TransactionDate"].isNotEmpty ? json["TransactionDate"] : "",
      bankAccountNO:
          json["BankAccountNO"].isNotEmpty ? json["BankAccountNO"] : "",
      buName: json["BUName"].isNotEmpty ? json["BUName"] : "",
      campaignName: json["CampaignName"].isNotEmpty ? json["CampaignName"] : "",
      externalReferenceId: json["ExternalReferenceId"].isNotEmpty
          ? json["ExternalReferenceId"]
          : "",
      invoiceNo: json["InvoiceNo"].isNotEmpty ? json["InvoiceNo"] : "",
      payOutTransactionId: json["PayOutTransactionId"].isNotEmpty
          ? json["PayOutTransactionId"]
          : "",
      payOutTransactionStatus: json["PayOutTransactionStatus"].isNotEmpty
          ? json["PayOutTransactionStatus"]
          : "",
      payoutReceived:
          json["PayoutReceived"].isNotEmpty ? json["PayoutReceived"] : "",
      payoutReturn: json["PayoutReturn"].isNotEmpty ? json["PayoutReturn"] : "",
      pointsEarned: json["PointsEarned"].isNotEmpty ? json["PointsEarned"] : "",
      pointsRedeemed:
          json["PointsRedeemed"].isNotEmpty ? json["PointsRedeemed"] : "",
      reversalMainTransId: json["ReversalMainTransId"].isNotEmpty
          ? json["ReversalMainTransId"]
          : "",
      primaryQRCode:
          json["PrimaryQRCode"].isNotEmpty ? json["PrimaryQRCode"] : "",
      skuCode: json["SKUCode"].isNotEmpty ? json["SKUCode"] : "",
      sourceType: json["SourceType"].isNotEmpty ? json["SourceType"] : "",
      tdsPoints: json["TDSPoints"].isNotEmpty ? json["TDSPoints"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "TransactionType": transactionType,
      "TransactionId": transactionId,
      "TransactionDate": transactionDate,
      "BankAccountNO": bankAccountNO,
      "BUName": buName,
      "CampaignName": campaignName,
      "ExternalReferenceId": externalReferenceId,
      "InvoiceNo": invoiceNo,
      "PayOutTransactionId": payOutTransactionId,
      "PayOutTransactionStatus": payOutTransactionStatus,
      "PayoutReceived": payoutReceived,
      "PayoutReturn": payoutReturn,
      "PointsEarned": pointsEarned,
      "PointsRedeemed": pointsRedeemed,
      "ReversalMainTransId": reversalMainTransId,
      "PrimaryQRCode": primaryQRCode,
      "SKUCode": skuCode,
      "SourceType": sourceType,
      "TDSPoints": tdsPoints,
    };
  }
}
