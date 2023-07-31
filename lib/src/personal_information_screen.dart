import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:queue_number/src/common_widget/custom_text_field_widget.dart';
import 'package:queue_number/src/personal_information_controller.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final PersonalInformationController personalInformationController =
      Get.put(PersonalInformationController());
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
      'Tomorrow, ${DateFormat('dd-MMM-yyyy').format(DateTime.now().add(const Duration(days: 1)))}';
  String? _visitDate;
  String? _schedule;
  String? _scheduleStatus;
  String? _visitTime;
  bool _isOpen = false;
  String _medicalComplaints = '';
  String _flgField = '';

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _medicalComplaintsController.dispose();
    Get.delete<PersonalInformationController>();
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
              Center(
                child: Text(
                  'Please fill all of the field!',
                  style: getRubikTextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Obx(
                () => LinearProgressIndicator(
                  value: personalInformationController.count.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                controller: _fullNameController,
                labelName: 'Full Name*',
                hintText: 'write your name',
                flgField: 'flgFullName',
              ),
              CustomTextFieldWidget(
                controller: _ageController,
                labelName: 'Age*',
                hintText: 'write your age',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                flgField: 'flgAge',
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
                          _flgField = 'flgSex';
                          personalInformationController.raiseFlag(_flgField);
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
                          _flgField = 'flgSex';
                          personalInformationController.raiseFlag(_flgField);
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
                      _flgField = 'flgVisitDate';
                      personalInformationController.raiseFlag(_flgField);
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
                      _flgField = 'flgSchedule';
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
                        personalInformationController.resetFlag(_flgField);
                      } else {
                        personalInformationController.raiseFlag(_flgField);
                      }
                    },
                  );
                },
                value: _schedule,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFieldWidget(
                controller: _medicalComplaintsController,
                labelName: 'Medical Complaints*',
                hintText: 'write your medical complaints',
                maxLines: 5,
                flgField: 'flgMedicalComplaints',
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
                        Navigator.pushReplacementNamed(
                          context,
                          '/queueNumberScreen',
                          arguments: _fullName,
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
