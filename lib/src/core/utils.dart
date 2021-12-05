import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

const double defaultPadding = 30;
const colorizeColors = [
  Colors.deepOrange,
  Colors.indigo,
  Colors.purple,
  Colors.blue,
  Colors.red,
];

enum TypeToShow { color, afirmation }

final colorizeTextStyle = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w800,
    foreground: Paint()..shader = linearGradient);
final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.pink, Colors.purple],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);
bool switcherResult = false;
var backgroundStartColor = Color(0xFFFFD500);
var backgroundEndColor = Color(0xFFF6A00C);

final getVersionProvider = FutureProvider<String>((_) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  return version;
});
