import 'package:flutter/widgets.dart';

class LuciSizedBox extends SizedBox {
    const LuciSizedBox({super.child, super.width, super.height, super.key});

  const LuciSizedBox.shrink({super.key, super.child}) : super.shrink();

  const LuciSizedBox.expand({super.key, super.child}) : super.expand();
}