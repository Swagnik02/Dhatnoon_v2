// ignore_for_file: implementation_imports

import 'package:dhatnoon_v2/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';

class SendReqView extends StatefulWidget {
  const SendReqView({super.key});

  @override
  State<SendReqView> createState() => _SendReqViewState();
}

class _SendReqViewState extends State<SendReqView> {
  var _selectedNavIndex = 0;
  final _formKey = GlobalKey<FormState>();

  // Variables to store checkbox values
  bool _cameraSelected = false;
  bool _audioSelected = false;
  bool _gpsSelected = false;

  // Variable to store selected time
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: ColorConstants.authBackground,
        title: const Text(
          "Name of the user",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedNavIndex = value;
          });
          if (_selectedNavIndex == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } else if (_selectedNavIndex == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendReqView(),
                ));
          }
        },
        currentIndex: _selectedNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Send Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task_rounded),
            label: 'Accept Request',
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              "Users",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Select Your Choice",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text("Camera"),
                    value: _cameraSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _cameraSelected = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text("Audio"),
                    value: _audioSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _audioSelected = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text("GPS"),
                    value: _gpsSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        _gpsSelected = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(_selectedTime == null
                        ? 'Select Time'
                        : 'Selected Time: ${_selectedTime!.format(context)}'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
