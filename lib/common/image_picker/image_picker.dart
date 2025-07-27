import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../permission_manager/permission_manager.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ILuciImagePicker {
  Future<XFile?> pickImage({required ImageSource imageSource});
  Future<XFile?> pickVideo({required ImageSource imageSource});
  Future<List<XFile>> pickMultiImage();
  Future<XFile?> pickMedia();
  Future<List<XFile>> pickMultipleMedia();
}

class LuciImagePicker implements ILuciImagePicker {
  LuciImagePicker({
    required this.locale,
    required this.context,
    ImagePicker? picker,
    PermissionManager? permissionManager,
  })  : _picker = picker ?? ImagePicker(),
        _permissionManager = permissionManager ??
            PermissionManager(context: context, locale: locale);

  final ImagePicker _picker;
  final BuildContext context;
  final PermissionManager _permissionManager;
  final Locale locale;

  Future<bool> _checkPermissionForSource(
    ImageSource source, {
    bool willPickVideo = false,
  }) async {
    if (source == ImageSource.camera) {
      return _permissionManager.checkStatus(Permission.camera);
    }

    if (Platform.isIOS) {
      return _permissionManager.checkStatus(Permission.photos);
    }

    if (Platform.isAndroid) {
      final photosOk = await _permissionManager.checkStatus(Permission.photos);
      final storageOk =
          await _permissionManager.checkStatus(Permission.storage);

      return photosOk || storageOk;
    }

    return false;
  }

  @override
  Future<XFile?> pickImage({required ImageSource imageSource}) async {
    final allowed = await _checkPermissionForSource(imageSource);
    if (!allowed) return null;

    try {
      final pickedFile = await _picker.pickImage(source: imageSource);
      if (pickedFile == null) return null;
      return pickedFile;
    } catch (e, s) {
      debugPrint('pickImage error: $e\n$s');
      return null;
    }
  }

  @override
  Future<XFile?> pickVideo({required ImageSource imageSource}) async {
    final allowed =
        await _checkPermissionForSource(imageSource, willPickVideo: true);
    if (!allowed) return null;

    try {
      final pickedFile = await _picker.pickVideo(source: imageSource);
      if (pickedFile == null) return null;
      return pickedFile;
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
      final pickedFile = await _picker.pickMedia();
      if (pickedFile == null) return null;
      return pickedFile;
    } catch (e, s) {
      debugPrint('pickMedia error: $e\n$s');
      return null;
    }
  }

  @override
  Future<List<XFile>> pickMultipleMedia() async {
    final camOk = await _checkPermissionForSource(ImageSource.camera);
    final galOk = await _checkPermissionForSource(ImageSource.gallery,
        willPickVideo: true);
    if (!camOk && !galOk) return <XFile>[];

    try {
      return await _picker.pickMultipleMedia();
    } catch (e, s) {
      debugPrint('pickMultipleMedia error: $e\n$s');
      return <XFile>[];
    }
  }

  Future<XFile?> pickImageFromCamera() =>
      pickImage(imageSource: ImageSource.camera);
  Future<XFile?> pickImageFromGallery() =>
      pickImage(imageSource: ImageSource.gallery);
  Future<XFile?> pickVideoFromCamera() =>
      pickVideo(imageSource: ImageSource.camera);
  Future<XFile?> pickVideoFromGallery() =>
      pickVideo(imageSource: ImageSource.gallery);
}
