import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucielle/common/image_picker/image_picker.dart';
import 'package:lucielle/lucielle.dart';
import 'package:lucielle/utils/constants/string_constants.dart';

@immutable
final class ImagePickerBottomSheet {
  final ILuciImagePicker _imagePicker = LuciImagePicker();

  Future<void> showImagePickerBottomSheet({
    required BuildContext context,
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
  }) async {
    await showModalBottomSheet(
      context: context,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
      elevation: elevation ?? 1,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      builder: (context) {
        return Padding(
          padding: LuciPadding.horizontalMedium(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(indent: context.width / 3, endIndent: context.width / 3),
              verticalBox12,
              _BottomSheetButton(
                imagePicker: _imagePicker,
                label: StringConstants.fromCamera.value,
                imageSource: ImageSource.camera,
                icon: Icon(Icons.camera_alt_outlined),
                textColor: textColor,
                buttonBackgroundColor: buttonBackgroundColor,
              ),
              verticalBox12,
              _BottomSheetButton(
                imagePicker: _imagePicker,
                label: StringConstants.fromGallery.value,
                imageSource: ImageSource.gallery,
                icon: Icon(Icons.photo_library_outlined),
                textColor: textColor,
                buttonBackgroundColor: buttonBackgroundColor,
              ),
            ],
          ),
        );
      },
    );
  }
}

@immutable
final class _BottomSheetButton extends StatelessWidget {
  _BottomSheetButton({
    Key? key,
    required this.imagePicker,
    this.textColor,
    this.buttonBackgroundColor,
    required this.label,
    required this.imageSource,
    required this.icon,
  }) : super(key: key);

  final ILuciImagePicker imagePicker;
  final Color? textColor;
  final Color? buttonBackgroundColor;
  final String label;
  final ImageSource imageSource;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(iconColor: textColor, backgroundColor: buttonBackgroundColor),
      onPressed: () => imagePicker.pickImage(imageSource: imageSource),
      icon: icon,
      label: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: LuciText.bodyMedium(label),
        ),
      ),
    );
  }

  _BottomSheetButton copyWith({
    ILuciImagePicker? imagePicker,
    ValueGetter<Color?>? textColor,
    ValueGetter<Color?>? buttonBackgroundColor,
    String? label,
    ImageSource? imageSource,
  }) {
    return _BottomSheetButton(
      imagePicker: imagePicker ?? this.imagePicker,
      textColor: textColor != null ? textColor() : this.textColor,
      buttonBackgroundColor:
          buttonBackgroundColor != null ? buttonBackgroundColor() : this.buttonBackgroundColor,
      label: label ?? this.label,
      imageSource: imageSource ?? this.imageSource,
      icon: this.icon,
    );
  }
}
