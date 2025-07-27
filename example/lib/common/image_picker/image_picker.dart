import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucielle/widget/bottom_sheet/image_picker_bottom_sheet.dart';
import 'package:lucielle/widget/text/luci_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePickerBottomSheet _imagePickerBottomSheet =
      ImagePickerBottomSheet();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: _BottomSheet(imagePickerBottomSheet: _imagePickerBottomSheet),
    );
  }
}

class _BottomSheet extends StatefulWidget {
  const _BottomSheet({required ImagePickerBottomSheet imagePickerBottomSheet})
    : _imagePickerBottomSheet = imagePickerBottomSheet;

  final ImagePickerBottomSheet _imagePickerBottomSheet;

  @override
  State<_BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_BottomSheet> {
  XFile? picked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              picked = await widget._imagePickerBottomSheet
                  .showImagePickerBottomSheet(
                    context: context,
                    locale: Locale('en', 'US'),
                    bottomSheetBackgroundColor: Colors.white,
                    textColor: Colors.grey,
                    buttonBackgroundColor: Colors.black,
                  );
            },
            child: LuciText.bodyMedium('asfafsafa', textColor: Colors.grey),
          ),
          FutureBuilder(
            future: picked!.readAsBytes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.memory(snapshot.data!);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
