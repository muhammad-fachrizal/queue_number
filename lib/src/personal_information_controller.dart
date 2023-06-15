import 'package:get/get.dart';

class PersonalInformationController extends GetxController {
  final count = 0.0.obs;
  final flgFields = <String, double>{
    'flgFullName': 0.0,
    'flgAge': 0.0,
    'flgSex': 0.0,
    'flgVisitDate': 0.0,
    'flgSchedule': 0.0,
    'flgMedicalComplaints': 0.0,
  };
  raiseFlag(String flgField) {
    flgFields.forEach(
      (key, value) {
        if (key == flgField) {
          flgFields.update(key, (value) => 1.0);
        }
      },
    );
    getTotalCount(flgFields);
  }

  resetFlag(String flgField) {
    flgFields.forEach(
      (key, value) {
        if (key == flgField) {
          flgFields.update(key, (value) => 0.0);
        }
      },
    );
    getTotalCount(flgFields);
  }

  getTotalCount(Map flgFields) {
    count.value = 0.0;
    flgFields.forEach(
      (key, value) {
        count.value += value;
      },
    );
    count.value /= flgFields.length;
  }
}
