import 'dart:math';
import 'package:intl/intl.dart';

///This function generates a random ID, that takes into consideration the current date, milliseconds from epoch, and a random 7-digit number. IT's not 100% gauranteed to be unique, but the math is good enough, for every given day, millisecond, randomness, and only one user :p
String generateId() {
  int randomNumber = Random().nextInt(9999999);
  String secondsNow = DateTime.now().millisecondsSinceEpoch.toString().substring(7);
  String formattedDate = DateFormat('MMdh').format(DateTime.now());
  return randomNumber.toString() + formattedDate + secondsNow;
}
