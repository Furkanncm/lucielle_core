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

    switch (permissionStatus) {
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:
        permissionStatus = await type.request();
        if (permissionStatus == PermissionStatus.granted) {
          return true;
        } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
          await _showDialog(type);
          return false;
        }
        return false;

      case PermissionStatus.permanentlyDenied:
        await _showDialog(type);
        return false;

      case PermissionStatus.restricted:
        return false;
    }
  }

  Future<void> _showDialog(Permission type) {
    return _showPermissionDialog(
      context: context,
      title: CoreLocalizations.get('${_getPrefix(type)}PermissionTitle'),
      content:
          CoreLocalizations.get('${_getPrefix(type)}PermissionDescription'),
      positiveButtonLabel: CoreLocalizations.get('permissionSettingsButton'),
      negativeButtonLabel: CoreLocalizations.get('deny'),
    );
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
