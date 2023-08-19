import 'package:dhatnoon_v2/views/Authentication/permission/permission_model.dart';
import 'package:dhatnoon_v2/views/Authentication/permission/permission_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  late Model _model;

  @override
  void initState() {
    super.initState();
    _model = Model();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _model,
        child: Consumer<Model>(builder: (context, model, child) {
          Widget widget;
          switch (model.permissionType) {
            case PermissionType.getPermission:
              widget = PermissionUI(model: model);
              break;
            case PermissionType.noPermission:
              widget = PermissionUI(model: model);
              break;
            case PermissionType.noPermissionPermanent:
              widget = PermissionUI(model: model);
              break;
            case PermissionType.permission:
              widget = PermissionUI(model: model);
              break;
          }
          return Scaffold(
            body: widget,
          );
        }));
  }
}
