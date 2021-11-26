part of starlight_country_picker;

const List<Map<String, dynamic>> _supported = [
  {"flag": "🇲🇲", "dial_code": "+95", "name": "Myanmar"},
  {"flag": "🇰🇷", "dial_code": "+82", "name": "South Korea"},
  {"flag": "🇯🇵", "dial_code": "+81", "name": "Japan"},
  {"flag": "🇻🇳", "dial_code": "+84", "name": "Vietnam"},
  {"flag": "🇮🇳", "dial_code": "+91", "name": "India"},
  {"flag": "🇮🇩", "dial_code": "+62", "name": "Indonesia"},
  {"flag": "🇦🇷", "dial_code": "+54", "name": "Argentina"},
  {"flag": "🇦🇺", "dial_code": "+61", "name": "Australia"},
  {"flag": "🇦🇹", "dial_code": "+43", "name": "Austria"},
  {"flag": "🇧🇷", "dial_code": "+55", "name": "Brazil"},
  {"flag": "🇸🇬", "dial_code": "+65", "name": "Singapore"},
  {"flag": "🇫🇷", "dial_code": "+33", "name": "France"},
  {"flag": "🇹🇭", "dial_code": "+66", "name": "Thailand"},
];

class _StarlightState {
  _StarlightState._();

  static _StarlightState? _starlightState;

  factory _StarlightState.instance() {
    _starlightState ??= _StarlightState._();
    return _starlightState!;
  }

  ///supported country
  final List<Country> _supportedCountry = [];

  ///Country controller [StreamController]
  final StreamController<List<Country>> _stateController =
      StreamController<List<Country>>.broadcast();

  ///Country stream [Stream]
  Stream<List<Country>> get stream => _stateController.stream;

  ///Country Search
  void search(String data) => _stateController.sink.add(
        _supportedCountry
            .where((element) =>
                element._name.validate.contains(data) ||
                element._dialCode.validate.contains(data))
            .toList(),
      );

  /// selected country
  Country? _selectedCountry;

  Country? selectCountry(Country? country) {
    _selectedCountry = country;
    return _selectedCountry;
  }

  ///Dispose
  void dispose() {
    _stateController.close();
  }
}
