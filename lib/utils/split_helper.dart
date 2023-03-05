import 'package:intl/intl.dart';

import 'date_formatter.dart';

class SplitHelper{
  static String getFullName({required String value,String? splitPattern}){
    String? fullName;
    List<String> splitValue = [];
    RegExp regExp = RegExp(r'\d+');
    splitValue = value.split(splitPattern ?? regExp);
    fullName = splitValue[0];
    return fullName;
  }
  static String getAge(DateTime value){
    String? age;
    List<String> splitValue = [];
    List<String> currentYear = [];
    var dob = DateFormatter.dateFormatter(value);
    final thisYear = DateFormatter.dateFormatter(DateTime.now());
    splitValue = dob.split('/');
    currentYear = thisYear.split('/');
    final int calculateAge = int.parse(currentYear[2]) - int.parse(splitValue[2]);
    age = calculateAge.toString();
    return age;
  }
}