part of starlight_country_picker;

class Country {
  final String _flag;
  final String _name;
  final String _dialCode;
  const Country({
    required String flag,
    required String dialCode,
    required String name,
  })  : _flag = flag,
        _dialCode = dialCode,
        _name = name;

  String get name => _name;
  String get flag => _flag;
  String get dialCode => _dialCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'] as String,
        flag: json['flag'] as String,
        dialCode: json['dial_code'] as String,
      );

  @override
  String toString() =>
      '''{"flag": $_flag, "dial_code": $_dialCode, "name": $_name}''';

  @override
  bool operator ==(covariant Country other) => other._dialCode == _dialCode;

  @override
  int get hashCode => _dialCode.hashCode;
}
