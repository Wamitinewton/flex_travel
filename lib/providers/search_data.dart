
class Location {
  final String locationId;
  final String name;
  final Address address;

  Location({
    required this.locationId,
    required this.name,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationId: json['location_id'],
      name: json['name'],
      address: Address.fromJson(json['address_obj']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_id': locationId,
      'name': name,
      'address_obj': address.toJson(),
    };
  }
}

class Address {
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? country;
  final String? postalcode;
  final String addressString;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.postalcode,
    required this.addressString,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street1: json['street1'],
      street2: json['street2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalcode: json['postalcode'],
      addressString: json['address_string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
      'postalcode': postalcode,
      'address_string': addressString,
    };
  }
}

class LocationData {
  final List<Location> data;

  LocationData({required this.data});

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      data: (json['data'] as List).map((i) => Location.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((i) => i.toJson()).toList(),
    };
  }
}
