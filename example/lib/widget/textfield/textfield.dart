import 'package:flutter/material.dart';
import 'package:lucielle/lucielle.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Textfield());
  }
}

class Textfield extends StatelessWidget {
  const Textfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: LuciPadding.symetric(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LuciEmailTextFormField(
                // prefixIcon: Icon(Icons.ac_unit_outlined),
                // suffixIcon: Icon(Icons.abc),
                // labelText: "Test",
                // maxLength: 2,
              ),
              verticalBox12,
              // LuciPasswordTextFormField(
              //   // suffixIcon: Icons.e_mobiledata,
              //   // reverseSuffix: Icons.ac_unit_sharp,
              // ),
              verticalBox12,
              LuciPhoneTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
