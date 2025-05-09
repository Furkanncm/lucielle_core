import 'package:flutter/material.dart';
import 'package:lucielle/widget/button/elevated_button.dart';
import 'package:lucielle/widget/button/outlined_button.dart';
import 'package:lucielle/widget/sized_box/space_box.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Button Examples', home: ButtonExamples());
  }
}

@immutable
final class ButtonExamples extends StatelessWidget {
  const ButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            LuciElevatedButton(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.amber,
              onPressed: () {},
              borderRadius: BorderRadius.circular(20),
              child: Text("Elevated Button "),
            ),
            verticalBox12,
            LuciElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              child: Text("Elevated Icon Button"),
            ),
            verticalBox12,
            LuciOutlinedButton(
              onPressed: () {},
              borderColor: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              backgroundColor: Colors.amber,
              borderSide: BorderSide(width: 5, color: Colors.green),
              child: Text("Outlined Button"),
            ),
            verticalBox12,
            LuciOutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              child: Text("Outlined Icon Button "),
            ),
          ],
        ),
      ),
    );
  }
}
