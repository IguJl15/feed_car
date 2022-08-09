import 'dart:convert';

class Vehicle {
  final bool automatic;
  final String brand;
  final int id;
  final String model;
  final int year;
  Vehicle({
    required this.automatic,
    required this.brand,
    required this.id,
    required this.model,
    required this.year,
  });

  Vehicle copyWith({
    bool? automatic,
    String? brand,
    int? id,
    String? model,
    int? year,
  }) {
    return Vehicle(
      automatic: automatic ?? this.automatic,
      brand: brand ?? this.brand,
      id: id ?? this.id,
      model: model ?? this.model,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'automatic': automatic,
      'brand': brand,
      'id': id,
      'model': model,
      'year': year,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      automatic: map['automatic'] as bool,
      brand: map['brand'] as String,
      id: map['id'].toInt() as int,
      model: map['model'] as String,
      year: map['year'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) => Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vehicle(automatic: $automatic, brand: $brand, id: $id, model: $model, year: $year)';
  }

  @override
  bool operator ==(covariant Vehicle other) {
    if (identical(this, other)) return true;
  
    return 
      other.automatic == automatic &&
      other.brand == brand &&
      other.id == id &&
      other.model == model &&
      other.year == year;
  }

  @override
  int get hashCode {
    return automatic.hashCode ^
      brand.hashCode ^
      id.hashCode ^
      model.hashCode ^
      year.hashCode;
  }
}