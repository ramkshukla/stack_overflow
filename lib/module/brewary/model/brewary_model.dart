class BrewaryDTO {
  final String id;
  final String name;
  final String brewaryType;
  final String address_1;
  final String address_2;
  final String address_3;
  final String city;
  final String stateProvince;
  final String postalCode;
  final String country;
  final String longitude;
  final String latitude;
  final String phone;
  final String websiteUrl;
  final String state;
  final String street;

  factory BrewaryDTO.initial() => BrewaryDTO(
        id: "",
        name: "",
        brewaryType: "",
        address_1: "",
        address_2: "",
        address_3: "",
        city: "",
        stateProvince: "",
        postalCode: "",
        country: "",
        latitude: "",
        longitude: "",
        phone: "",
        state: "",
        street: "",
        websiteUrl: "",
      );

  BrewaryDTO({
    required this.id,
    required this.name,
    required this.brewaryType,
    required this.address_1,
    required this.address_2,
    required this.address_3,
    required this.city,
    required this.stateProvince,
    required this.postalCode,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.state,
    required this.street,
    required this.websiteUrl,
  });

  factory BrewaryDTO.fromJson(Map<String, dynamic> json) {
    return BrewaryDTO(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        brewaryType: json["brewery_type"] ?? "",
        address_1: json["address_1"] ?? "",
        address_2: json["address_2"] ?? "",
        address_3: json["address_3"] ?? "",
        city: json["city"] ?? "",
        stateProvince: json["state_province"] ?? "",
        postalCode: json["postal_code"] ?? "",
        country: json["country"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        phone: json["phone"] ?? "",
        state: json["state"] ?? "",
        street: json["street"] ?? "",
        websiteUrl: json["website_url"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "brewery_type": brewaryType,
      "address_1": address_1,
      "address_2": address_2,
      "address_3": address_3,
      "city": city,
      "state_province": stateProvince,
      "postal_code": postalCode,
      "country": country,
      "latitude": latitude,
      "longitude": longitude,
      "phone": phone,
      "state": state,
      "street": street,
      "website_url": websiteUrl,
    };
  }
}
