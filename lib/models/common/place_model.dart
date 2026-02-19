class PlaceModel {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  /// FROM JSON
  factory PlaceModel.fromJson(
      Map<String, dynamic> json) {
    return PlaceModel(
      id: json['place_id'] ?? '',

      name: json['name'] ?? '',

      address:
      json['formatted_address'] ??
          json['vicinity'] ??
          '',

      latitude: (json['geometry']
      ?['location']
      ?['lat'] ??
          0)
          .toDouble(),

      longitude: (json['geometry']
      ?['location']
      ?['lng'] ??
          0)
          .toDouble(),
    );
  }

  /// TO JSON
  Map<String, dynamic> toJson() {
    return {
      'place_id': id,
      'name': name,
      'formatted_address': address,
      'lat': latitude,
      'lng': longitude,
    };
  }

  /// COPY WITH
  PlaceModel copyWith({
    String? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return 'PlaceModel('
        'id: $id, '
        'name: $name, '
        'address: $address, '
        'lat: $latitude, '
        'lng: $longitude'
        ')';
  }
}
