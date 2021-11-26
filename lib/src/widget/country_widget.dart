part of starlight_country_picker;

final PageStorageBucket _countryBucket = PageStorageBucket();
const PageStorageKey _countryKey = PageStorageKey('country');

class _CountryPicker extends StatefulWidget {
  final double? _width;
  final double? _height;
  final Color? _backgroundColor;
  final Color? _selectedColor;
  final Color? _unSelectedColor;
  final TextStyle? _hintStyle;

  const _CountryPicker({
    Key? key,
    double? width,
    double? height,
    Color? backgroundColor,
    Color? selectedColor,
    Color? unSelectedColor,
    TextStyle? hintStyle,
  })  : _width = width,
        _height = height,
        _backgroundColor = backgroundColor,
        _selectedColor = selectedColor,
        _unSelectedColor = unSelectedColor,
        _hintStyle = hintStyle,
        super(key: key);

  @override
  State<_CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<_CountryPicker> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: widget._backgroundColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: SafeArea(
        child: SizedBox(
          width: widget._width ?? _size.width * 0.7,
          height: widget._height ?? _size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SelectCountryTitle(
                unSelectedColor: widget._unSelectedColor,
              ),
              _SearchCountry(
                hintStyle: widget._hintStyle,
              ),
              Expanded(
                child: _SearchList(
                  selectedColor: widget._selectedColor,
                  unSelectedColor: widget._unSelectedColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectCountryTitle extends StatelessWidget {
  final Color? _unSelectedColor;

  const _SelectCountryTitle({
    Key? key,
    Color? unSelectedColor,
  })  : _unSelectedColor = unSelectedColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 217,
      height: 23,
      margin: const EdgeInsets.only(
        top: 20,
        left: 21,
      ),
      child: Text(
        'Select Country/Region',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: _unSelectedColor ?? Colors.black,
        ),
      ),
    );
  }
}

class _SearchCountry extends StatelessWidget {
  final TextStyle? _hintStyle;
  const _SearchCountry({
    Key? key,
    TextStyle? hintStyle,
  })  : _hintStyle = hintStyle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: TextField(
        // onChanged: controller.searchSupportedCountry,
        onChanged: _starlightState.search,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: _hintStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
        ),
      ),
    );
  }
}

class _SearchList extends StatelessWidget {
  final Color? _selectedColor;
  final Color? _unSelectedColor;

  const _SearchList({
    Key? key,
    Color? selectedColor,
    Color? unSelectedColor,
  })  : _selectedColor = selectedColor,
        _unSelectedColor = unSelectedColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: context.overScroll,
      child: PageStorage(
        bucket: _countryBucket,
        child: StreamBuilder<List<Country>>(
            initialData: _starlightState._supportedCountry,
            stream: _starlightState.stream,
            builder: (_, snap) {
              final List<Country> _supportedCountry = snap.data ?? [];
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                key: _countryKey,
                itemCount: _supportedCountry.length,
                itemBuilder: (_, i) {
                  return InkWell(
                    key: ValueKey(_supportedCountry[i].name),
                    onTap: () {
                      Navigator.of(context).pop(
                        _starlightState.selectCountry(
                          _supportedCountry[i],
                        ),
                      );
                    },
                    child: Container(
                      width: 323,
                      height: 55,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(247, 247, 248, 1),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36.58,
                            height: 30,
                            margin:
                                const EdgeInsets.only(left: 21, right: 11.42),
                            child: Text(
                              _supportedCountry[i].flag,
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            child: Text(
                              _supportedCountry[i].name,
                              style: TextStyle(
                                color: _starlightState._selectedCountry ==
                                        _supportedCountry[i]
                                    ? _selectedColor ?? Colors.green
                                    : _unSelectedColor ?? Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
