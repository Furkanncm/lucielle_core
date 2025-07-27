import 'package:permission_handler/permission_handler.dart';


 class PermissionManager  {
  PermissionStatus permissionStatus = PermissionStatus.denied;

  Future<bool> checkStatus(Permission type) async {
    permissionStatus = await type.status;

    if (permissionStatus.isGranted) return true;

    permissionStatus = await type.request();

    return permissionStatus.isGranted;
  }
}
