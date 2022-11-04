import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String loginScreenSvgUrl = 'assets/svgs/Mysterious-man-reading-newspaper.svg';
final Widget loginScreenSvg = SvgPicture.asset(
  loginScreenSvgUrl,
  semanticsLabel: 'A man reading a newspaper in a park',
);
