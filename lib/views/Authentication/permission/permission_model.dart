import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

enum PermissionType {
  noPermission, // Permission denied, but not forever
  noPermissionPermanent, // Permission denied forever
  getPermission, //UI to ask permission
  permission, // got permission
}

class Model extends ChangeNotifier {
  PermissionType _type = PermissionType.getPermission;
  int _pno = 1;

  PermissionType get permissionType => _type;

  set permissionType(PermissionType value) {
    if (value != _type) {
      _type = value;
      notifyListeners();
    }
  }

  get pno => _pno;

  set pno(value) {
    if (value != _pno) {
      _pno = value;
      notifyListeners();
    }
  }

  Future<bool> requestPermission(Permission p1, Permission p2) async {
    // In Android we need to request the storage permission,
    // while in iOS is the photos permission
    PermissionStatus result = await (Platform.isAndroid ? p1 : p2).request();
    print("stATatus = ${result}");

    if (result.isGranted) {
      permissionType = PermissionType.permission;
      int prev = pno;
      pno = prev + 1;
      print("type = ${permissionType}");
      return true;
    } else if (Platform.isIOS || result.isPermanentlyDenied) {
      permissionType = PermissionType.noPermissionPermanent;
    } else if (result.isDenied) {
      permissionType = PermissionType.noPermission;
    }
    return false;
  }
}
