<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Starlight Country Picker

starlight_country_picker is a country picker.

## Features

☑️ Add New Country <br>
☑️ Search Your Country
⭐ Our package was not use setState ❤️


![Watch the video](https://user-images.githubusercontent.com/26484667/143597358-be0a314b-1dd5-4113-b48b-88bec5ee2e02.mp4)

## Installation

Add starlight_country_picker as dependency to your pubspec file.

```dart
starlight_country_picker: 
    git:
      url: https://github.com/YeMyoAung/starlight_country_picker.git
```

## Usage

First of all you need to import our package.

```dart
import 'package:starlight_country_picker/country_picker.dart';
```

## Country Picker

The Starlight Country Picker is used as any other dialog function.

```dart
import 'package:flutter/material.dart';
import 'package:starlight_country_picker/country_picker.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () async {
          final Country? _country = await countryPicker(
                        context,///required
                        selectedColor: Colors.green,///optional
                        unSelectedColor: Colors.black,///optional
                        supportedCountry: [],///optional
                        addNewSupportedCountry: [],///optional
                        width: 100,///optional
                        height: 100,///optional
                        backgroundColor: Colors.white,///optional
                        hintStyle: TextStyle(),///optional
                        barrierDismissible: true,///optional
                        barrierColor: Colors.black54,///optional
                    );
          print(_country.toString());
        },
        child: const Text(
          "Country Picker",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}
```

## Contact Us

[Starlight Studio](https://www.facebook.com/starlightstudio.of/)
