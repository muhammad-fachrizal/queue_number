import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:queue_number/src/queue_number_screen.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _medicalComplaintsController =
      TextEditingController();
  String _fullName = '';
  String _age = '';
  String? _sex;
  final String _today =
      'Today, ${DateTime.now().day}-${DateFormat("MMM").format(DateTime.now())}-${DateTime.now().year}';
  final String _tomorrow =
      'Tomorrow, ${DateTime.now().day + 1}-${DateFormat("MMM").format(DateTime.now())}-${DateTime.now().year}';
  String? _visitDate;
  String? _schedule;
  String? _scheduleStatus;
  String? _visitTime;
  bool _isOpen = false;
  String _medicalComplaints = '';

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _medicalComplaintsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Personal Information',
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name*',
                style: getRubikTextStyle(),
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'write your name',
                  hintStyle: getRubikTextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Age*',
                style: getRubikTextStyle(),
              ),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'write your age',
                  hintStyle: getRubikTextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Sex*',
                style: getRubikTextStyle(),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: _sex,
                    onChanged: (String? value) {
                      setState(
                        () {
                          _sex = value;
                        },
                      );
                    },
                  ),
                  Text(
                    'Male',
                    style: getRubikTextStyle(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Radio(
                    value: 'Female',
                    groupValue: _sex,
                    onChanged: (String? value) {
                      setState(
                        () {
                          _sex = value;
                        },
                      );
                    },
                  ),
                  Text(
                    'Female',
                    style: getRubikTextStyle(),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Select Date*',
                style: getRubikTextStyle(),
              ),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  'choose your visit date',
                  style: getRubikTextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: _today,
                    child: Text(
                      _today,
                      style: getRubikTextStyle(),
                    ),
                  ),
                  DropdownMenuItem(
                    value: _tomorrow,
                    child: Text(
                      _tomorrow,
                      style: getRubikTextStyle(),
                    ),
                  ),
                ],
                onChanged: (String? value) {
                  setState(
                    () {
                      _visitDate = value;
                    },
                  );
                },
                value: _visitDate,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Select Schedule*',
                style: getRubikTextStyle(),
              ),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  'choose your visit time',
                  style: getRubikTextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: '08:00-11:30 OPEN',
                    child: Row(
                      children: [
                        Text(
                          '08:00-11:30',
                          style: getRubikTextStyle(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'OPEN',
                            style: getRubikTextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '13:00-17:30 CLOSE',
                    child: Row(
                      children: [
                        Text(
                          '13:00-17:30',
                          style: getRubikTextStyle(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'CLOSE',
                            style: getRubikTextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '19:00-21:00 OPEN',
                    child: Row(
                      children: [
                        Text(
                          '19:00-21:00',
                          style: getRubikTextStyle(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'OPEN',
                            style: getRubikTextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                onChanged: (String? value) {
                  setState(
                    () {
                      _schedule = value;
                      List<String>? splitScheduleValue = _schedule?.split(' ');
                      _visitTime = splitScheduleValue?[0];
                      _scheduleStatus = splitScheduleValue?[1];
                      _isOpen =
                          _scheduleStatus?.toUpperCase().contains('OPEN') ??
                              false;
                      if (!_isOpen) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please choose an open schedule',
                              style: getRubikTextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
                value: _schedule,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Medical Complaints*',
                style: getRubikTextStyle(),
              ),
              TextField(
                controller: _medicalComplaintsController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'write your medical complaints',
                  hintStyle: getRubikTextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                maxLines: 5,
                minLines: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _fullName = _fullNameController.text;
                      _age = _ageController.text;
                      _medicalComplaints = _medicalComplaintsController.text;

                      if (_fullName.trim().isEmpty ||
                          _age.trim().isEmpty ||
                          _sex == null ||
                          _visitDate == null ||
                          _visitTime == null ||
                          _medicalComplaints.trim().isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Empty Field',
                                style: getRubikTextStyle(),
                              ),
                              content: Text(
                                'All field must be filled!',
                                style: getRubikTextStyle(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: Text(
                                    'OK',
                                    style: getRubikTextStyle(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (!_isOpen) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Closed Schedule',
                                style: getRubikTextStyle(),
                              ),
                              content: Text(
                                'Please choose an open schedule',
                                style: getRubikTextStyle(),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: Text(
                                    'OK',
                                    style: getRubikTextStyle(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QueueNumberScreen(
                                fullName: _fullName,
                              );
                            },
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style: getRubikTextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
