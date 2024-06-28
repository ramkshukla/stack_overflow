import 'package:dartz/dartz.dart';
import 'package:stack_overflow/_util/api_endpoint.dart';
import 'package:stack_overflow/_util/api_call.dart';
import 'package:stack_overflow/_util/api_response.dart';
import 'package:stack_overflow/_util/enum.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/brewary/model/brewary_model.dart';
import 'package:stack_overflow/module/brewary/model/orient_model.dart';

abstract class BrewaryRepo {
  Future<Either<Failure, List<BrewaryDTO>>> getBrewaryData(String cityName);
  Future<Either<Failure, OrientDTO>> getOrientData(
      {String? pageIndex, String fromDate, String toDate});
}

class BrewaryRepoImpl extends BrewaryRepo {
  @override
  Future<Either<Failure, List<BrewaryDTO>>> getBrewaryData(
      String cityName) async {
    return await ApiCall<List<BrewaryDTO>>().handleAPI(
      endpoint: APIEndPoint.brewary(cityName),
      handleSuccess: (responseBody) async {
        List<BrewaryDTO> brewaryData = responseBody
            .map<BrewaryDTO>((element) => BrewaryDTO.fromJson(element))
            .toList();
        "List Brewary Data: $brewaryData".logIt;
        return right(brewaryData);
      },
    );
  }

  @override
  Future<Either<Failure, OrientDTO>> getOrientData({
    pageIndex = "1",
    fromDate = "06-Mar-2022",
    toDate = "06-Mar-2024",
  }) async {
    return await ApiCall<OrientDTO>().handleAPI(
      endpoint: APIEndPoint.orient,
      body: {
        "LoginMobileNo": "8500000015",
        "LoginMemberType": "W",
        "CustomerId": "20086",
        "BUID": "1",
        "Fromdate": fromDate,
        "Todate": toDate,
        "PageIndex": pageIndex,
        "PageSize": "5"
      },
      callType: APICallType.POST,
      handleSuccess: (responseBody) async {
        OrientDTO orientDTO =
            OrientDTO.fromJson(responseBody as Map<String, dynamic>);
        return right(orientDTO);
      },
    );
  }
}
