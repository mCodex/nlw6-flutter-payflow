import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barCode;

  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barCode,
  });

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barCode,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barCode: barCode ?? this.barCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barCode': barCode,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barCode: map['barCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barCode: $barCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barCode == barCode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barCode.hashCode;
  }
}
