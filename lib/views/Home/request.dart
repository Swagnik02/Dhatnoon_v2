import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({super.key});

  @override
  State<SendRequest> createState() => _SendRequestState();
}

class _SendRequestState extends State<SendRequest> {
  // Variables to store checkbox values
  ValueNotifier cameraSelected = ValueNotifier(false);
  ValueNotifier audioSelected = ValueNotifier(false);
  ValueNotifier gpsSelected = ValueNotifier(false);

  // Variable to store selected time
  TimeOfDay? selectedTime;

//textfield controller
  TextEditingController phncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      //print(picked);
      if (picked != null && picked != selectedTime) {
        setState(() {
          selectedTime = picked;
        });
      }
    }

    @override
    void dispose() {
      // Dispose ValueNotifier instances to avoid memory leaks
      cameraSelected.dispose();
      audioSelected.dispose();
      gpsSelected.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Send Request",
              style: TextStyle(fontSize: 23, color: ColorConstants.authText),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phncontroller,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: ColorConstants.authText)),
              style: const TextStyle(color: ColorConstants.authText),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Select Your Choice",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstants.authText,
                ),
              ),
            ),
            _checkbox(cameraSelected, "Camera"),
            _checkbox(audioSelected, "Audio"),
            _checkbox(gpsSelected, "GPS"),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => selectTime(context),
                child: Text(selectedTime == null
                    ? 'Select Time'
                    : 'Selected Time: ${selectedTime!.format(context)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CheckboxListTile _checkbox(ValueNotifier selected, String text) {
    return CheckboxListTile(
      activeColor: ColorConstants.authButtonActive,
      title: Text(
        text,
        style: const TextStyle(fontSize: 19, color: ColorConstants.authText),
      ),
      value: selected.value,
      onChanged: (bool? value) {
        setState(() {
          selected.value = value ?? false;
        });
      },
    );
  }
}
