part of starlight_country_picker;

_StarlightState _starlightState = _StarlightState.instance();

///country picker will return [Country]
Future<Country?> countryPicker(
  BuildContext context, {
  List<Country>? supportedCountry,
  List<Country>? addNewSupportedCountry,
  double? width,
  double? height,
  Color? backgroundColor,
  Color? selectedColor,
  Color? unSelectedColor,
  TextStyle? hintStyle,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
}) {
  _starlightState._supportedCountry.clear();

  _starlightState._supportedCountry.addAll(
    supportedCountry ?? _supported.map((e) => Country.fromJson(e)).toList(),
  );

  if (addNewSupportedCountry != null) {
    _starlightState._supportedCountry.addAll(addNewSupportedCountry);
  }

  return showDialog(
    context: context,
    builder: (_) => _CountryPicker(
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
      hintStyle: hintStyle,
    ),
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
  );
}
