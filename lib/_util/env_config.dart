import 'package:stack_overflow/_util/enum.dart';

class EnvConfig {
  final String appTitle;
  final Flavor flavor;
  final String baseUrl;

  EnvConfig({
    required this.appTitle,
    required this.flavor,
    required this.baseUrl,
  });

  factory EnvConfig.fromJson(Map<String, dynamic> json) {
    return EnvConfig(
      appTitle: json["appTitle"],
      flavor: json["flavor"],
      baseUrl: json["baseUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "appTitle": appTitle,
      "flavor": flavor,
      "baseUrl": baseUrl,
    };
  }
}

final development = EnvConfig(
  appTitle: "Brewary Spot Development",
  flavor: Flavor.dev,
  baseUrl: "https://api.openbrewerydb.org",
);

final production = EnvConfig(
  appTitle: "Brewary Spot Production",
  flavor: Flavor.prod,
  baseUrl: "http://orientdemo.netcarrots.in",
);

final uat = EnvConfig(
  appTitle: "Brewary Spot UAT",
  flavor: Flavor.uat,
  baseUrl: "https://api.openbrewerydb.org",
);
