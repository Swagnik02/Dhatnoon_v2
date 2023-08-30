import 'package:dhatnoon_v2/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_btn_ui.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dhatnoon_v2/views/Authentication/permission/permission_model.dart';
import '../../../widgets.dart';

class PermissionUI extends StatelessWidget {
  final Model model;

  const PermissionUI({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (model.permissionType == PermissionType.getPermission) {
        // Request permissions immediately after the UI is built
        model.requestPermission(Permission.camera, Permission.photos);
      } else if (model.permissionType == PermissionType.noPermission) {
        //request again
        showToast(
            "We need to request your permission in order to perform functions in the app.");
        Future.delayed(const Duration(seconds: 4), () {
          model.requestPermission(Permission.camera, Permission.photos);
        });
      } else if (model.permissionType == PermissionType.noPermissionPermanent) {
        //open app settings to request permission
        showToast("Please allow the required permissions in the app settings");
        Future.delayed(const Duration(seconds: 2), () async {
          await openAppSettings();
        });
      } else if (model.permissionType == PermissionType.permission) {
        (model.pno == 2)
            ? model.requestPermission(
            Permission.microphone, Permission.microphone)
            : (model.pno == 3)
            ? model.requestPermission(
            Permission.storage, Permission.storage)
            : model.requestPermission(
            Permission.location, Permission.locationWhenInUse);
      }
    });
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 60, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Enable app permission to make sign up easy",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: ColorConstants.authText,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      shape: BoxShape.rectangle,
                      color: Colors.white60)),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Tap \" Allow \" when prompted",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstants.authText,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              AuthBtnUI(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserRequest()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
