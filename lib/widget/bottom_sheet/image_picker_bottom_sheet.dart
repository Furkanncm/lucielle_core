import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/image_picker/image_picker.dart';
import '../../lucielle.dart';
import '../../utils/constants/string_constants.dart';

final class ImagePickerBottomSheet {
 

  ILuciImagePicker? imagePicker;

  Future<XFile?> showImagePickerBottomSheet({
    required BuildContext context,
    required Locale locale,
    Color? bottomSheetBackgroundColor,
    Color? textColor,
    Color? buttonBackgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) {
    imagePicker = LuciImagePicker(context: context, locale: locale);
    return showModalBottomSheet<XFile?>(
      context: context,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
      elevation: elevation ?? 1,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: clipBehavior,
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      backgroundColor: bottomSheetBackgroundColor ?? Colors.white,
      builder: (sheetContext) {
        return Padding(
          padding: LuciPadding.horizontalMedium(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _BottomSheetButton(
                imagePicker: imagePicker,
                label: StringConstants.fromCamera.value,
                imageSource: ImageSource.camera,
                icon: const Icon(Icons.camera_alt_outlined),
                textColor: textColor,
                buttonBackgroundColor: buttonBackgroundColor,
                onPicked: (file) => Navigator.of(sheetContext).pop(file),
              ),
              verticalBox12,
              _BottomSheetButton(
                imagePicker: imagePicker,
                label: StringConstants.fromGallery.value,
                imageSource: ImageSource.gallery,
                icon: const Icon(Icons.photo_library_outlined),
                textColor: textColor,
                buttonBackgroundColor: buttonBackgroundColor,
                onPicked: (file) => Navigator.of(sheetContext).pop(file),
              ),
              verticalBox24,
            ],
          ),
        );
      },
    );
  }
}

@immutable
final class _BottomSheetButton extends StatelessWidget {
  const _BottomSheetButton({
    required this.imagePicker,
    required this.label,
    required this.imageSource,
    required this.icon,
    required this.onPicked,
    this.textColor,
    this.buttonBackgroundColor,
  });

  final ILuciImagePicker? imagePicker;
  final Color? textColor;
  final Color? buttonBackgroundColor;
  final String label;
  final ImageSource imageSource;
  final Icon icon;

  final ValueChanged<XFile?> onPicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          iconColor: textColor, backgroundColor: buttonBackgroundColor),
      onPressed: () async {
        final file = await imagePicker?.pickImage(imageSource: imageSource);
        onPicked(file);
      },
      icon: icon,
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(child: LuciText.bodyMedium(label, textColor: textColor)),
      ),
    );
  }
}
