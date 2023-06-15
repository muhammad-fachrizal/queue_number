# Queue Number

A simple android application to make an appointment and get a queue number with 3 available screens: Make Appointment, Personal Information, Queue Number. Created using Flutter Framework to learn and practice about widget, input, navigation, and state management with GetX.

Created to complete the course of 
["Belajar Membuat Aplikasi Flutter untuk Pemula"](https://www.dicoding.com/academies/159) from Dicoding.

**Screenshot** <br/>
- Make Appoinment <br/>
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/make_appoinment.png" width="50%" height="50%"> <br/>
</p>

- Personal Information <br/>
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_1.png" width="40%" height="40%"> 
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_2.png" width="40%" height="40%"> 
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_3.png" width="40%" height="40%"> 
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_4.png" width="40%" height="40%"> 
</p>

For Personal Information screen, there are some validations, such as checking whether the selected schedule is open or not and if it is closed, the app will show a snackbar warning at the bottom of the screen.
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_5.png" width="50%" height="50%"> <br/>
</p>

There is also a validation on the submit button, such as if all of the fields are filled in but the selected schedule is closed, the app will show a pop-up dialog.
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_6.png" width="50%" height="50%"> <br/>
</p>

The other validation on the submit button is to check if all of the fiels are filled in or not, and if not, then the app will show a pop-up dialog.
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/personal_information_7.png" width="50%" height="50%"> <br/>
</p>

- Queue Number <br/>
<p float="left">
  <img src="https://github.com/muhammad-fachrizal/queue_number/blob/main/screenshot/queue_number.png" width="50%" height="50%"> <br/>
</p>


**Installation** <br/>
you can install "app-release.apk" file to your android device or run it from the desktop with below step:<br/>
1. Clone the repo<br/>
git clone https://github.com/muhammad-fachrizal/queue_number.git <br/>
cd queue_number <br/>
2. Run pub get <br/>
flutter pub get <br/>
4. Run the app <br/>
flutter run <br/>
