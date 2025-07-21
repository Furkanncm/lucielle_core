import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ILuciImagePicker {
  Future<XFile?> pickImage({required ImageSource imageSource});
  Future<XFile?> pickVideo({required ImageSource imageSource});
  Future<List<XFile>> pickMultiImage();
  Future<XFile?> pickMedia();
  Future<List<XFile>> pickMultipleMedia();
}

class LuciImagePicker implements ILuciImagePicker {
  LuciImagePicker({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;


  Future<bool> _request(Permission p) async {
    final status = await p.status;
    if (status.isGranted) return true;
    final result = await p.request();
    return result.isGranted;
  }

  Future<bool> _checkPermissionForSource(ImageSource source) async {
    if (source == ImageSource.camera) {
      return _request(Permission.camera);
    } else {
      // Galeri
      if (Platform.isIOS) {
        return _request(Permission.photos);
      } else if (Platform.isAndroid) {
        return _request(Permission.storage);
      } else {
        return true;
      }
    }
  }

  @override
  Future<XFile?> pickImage({required ImageSource imageSource}) async {
    final allowed = await _checkPermissionForSource(imageSource);
    if (!allowed) return null;

    try {
      return await _picker.pickImage(source: imageSource);
    } catch (e, s) {
      debugPrint('pickImage error: $e\n$s');
      return null;
    }
  }

  @override
  Future<XFile?> pickVideo({required ImageSource imageSource}) async {
    final allowed = await _checkPermissionForSource(imageSource);
    if (!allowed) return null;

    try {
      return await _picker.pickVideo(source: imageSource);
    } catch (e, s) {
      debugPrint('pickVideo error: $e\n$s');
      return null;
    }
  }

  @override
  Future<List<XFile>> pickMultiImage() async {
    final allowed = await _checkPermissionForSource(ImageSource.gallery);
    if (!allowed) return <XFile>[];

    try {
      return await _picker.pickMultiImage();
    } catch (e, s) {
      debugPrint('pickMultiImage error: $e\n$s');
      return <XFile>[];
    }
  }

  @override
  Future<XFile?> pickMedia() async {
    final camOk = await _checkPermissionForSource(ImageSource.camera);
    final galOk = await _checkPermissionForSource(ImageSource.gallery);
    if (!camOk && !galOk) return null;

    try {
      return await _picker.pickMedia();
    } catch (e, s) {
      debugPrint('pickMedia error: $e\n$s');
      return null;
    }
  }

  @override
  Future<List<XFile>> pickMultipleMedia() async {
    final camOk = await _checkPermissionForSource(ImageSource.camera);
    final galOk = await _checkPermissionForSource(ImageSource.gallery);
    if (!camOk && !galOk) return <XFile>[];

    try {
      return await _picker.pickMultipleMedia();
    } catch (e, s) {
      debugPrint('pickMultipleMedia error: $e\n$s');
      return <XFile>[];
    }
  }

  Future<XFile?> pickImageFromCamera() => pickImage(imageSource: ImageSource.camera);
  Future<XFile?> pickImageFromGallery() => pickImage(imageSource: ImageSource.gallery);
  Future<XFile?> pickVideoFromCamera() => pickVideo(imageSource: ImageSource.camera);
  Future<XFile?> pickVideoFromGallery() => pickVideo(imageSource: ImageSource.gallery);
}
