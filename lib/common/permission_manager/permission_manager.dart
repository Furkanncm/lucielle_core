import 'package:flutter/material.dart';
import '../localization/luci_localization.dart';
import '../../lucielle.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class PermissionManager {
  PermissionStatus permissionStatus = PermissionStatus.denied;
  final BuildContext context;
  final Locale locale;

  PermissionManager({required this.context, required this.locale});

  Future<bool> checkStatus(Permission type) async {
    await CoreLocalizations.load(locale);
    permissionStatus = await type.status;

    if (permissionStatus.isGranted) return true;

    if (permissionStatus.isPermanentlyDenied) return false;

    permissionStatus = await type.request();

    if (permissionStatus.isPermanentlyDenied) {
      await _showPermissionDialog(
        context: context,
        title: CoreLocalizations.get('${_getPrefix(type)}PermissionTitle'),
        content:
            CoreLocalizations.get('${_getPrefix(type)}PermissionDescription'),
        positiveButtonLabel: CoreLocalizations.get('permissionSettingsButton'),
        negativeButtonLabel: CoreLocalizations.get('deny'),
      );
    }

    return permissionStatus.isGranted;
  }

  Future<void> _showPermissionDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String positiveButtonLabel,
    required String negativeButtonLabel,
  }) async {
    await LuciDialogs.showDialog(
      context: context,
      title: title,
      content: content,
      positiveButtonLabel: positiveButtonLabel,
      negativeButtonLabel: negativeButtonLabel,
      positiveButtonCallback: () {
        Navigator.of(context).pop();
        AppSettings.openAppSettings();
      },
    );
  }

  /// Verilen izne göre JSON key prefix döner
  String _getPrefix(Permission permission) {
    if (permission == Permission.camera) return 'camera';
    if (permission == Permission.photos ||
        permission == Permission.mediaLibrary) return 'gallery';
    if (permission == Permission.microphone) return 'microphone';
    if (permission == Permission.location ||
        permission == Permission.locationWhenInUse) return 'location';
    if (permission == Permission.notification) return 'notification';
    if (permission == Permission.storage) return 'storage';
    return 'required';
  }
}
