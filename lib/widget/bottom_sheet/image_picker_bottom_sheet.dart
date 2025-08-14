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
    Color? iconColor,
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
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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
          padding: const LuciPadding.horizontalMedium(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LuciText.labelMedium(
                StringConstants.changeProfilePhoto.value,
                fontWeight: FontWeight.bold,
              ),
              verticalBox16,
              _BottomSheetButton(
                imagePicker: imagePicker,
                label: StringConstants.fromCamera.value,
                imageSource: ImageSource.camera,
                icon: Icons.camera_alt_outlined,
                iconColor: iconColor,
                buttonBackgroundColor: buttonBackgroundColor,
                onPicked: (file) => Navigator.of(sheetContext).pop(file),
              ),
              verticalBox12,
              _BottomSheetButton(
                imagePicker: imagePicker,
                label: StringConstants.fromGallery.value,
                imageSource: ImageSource.gallery,
                icon: Icons.photo_library_outlined,
                iconColor: iconColor,
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
    this.iconColor,
    this.buttonBackgroundColor,
  });

  final ILuciImagePicker? imagePicker;
  final Color? iconColor;
  final Color? buttonBackgroundColor;
  final String label;
  final ImageSource imageSource;
  final IconData icon;

  final ValueChanged<XFile?> onPicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .07,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () async {
          final file = await imagePicker?.pickImage(imageSource: imageSource);
          onPicked(file);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 32),
            horizontalBox8,
            LuciText.bodyLarge(label),
            const Spacer(),
            const Icon(Icons.chevron_right_outlined, size: 32),

            verticalBox4,
          ],
        ),
      ),
    );
  }
}
