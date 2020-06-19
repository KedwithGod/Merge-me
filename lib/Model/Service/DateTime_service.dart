import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// format time of the day

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm();  //"6:00 AM"
  return format.format(dt);
}

// current time

 currentTime(){
   DateTime now = DateTime.now();
   TimeOfDay timeNow = TimeOfDay.fromDateTime(now);
    var time=formatTimeOfDay(timeNow);
    return time;
 }

// current date
  currentDate(value){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE d, MMMM y ').format(now);
    String dayMonth= DateFormat('EEEE d, MMMM ').format(now);
    String justMonth = DateFormat('MMMM ').format(now);
    String justYear=  DateFormat(' y ').format(now);
    String monthYear=  DateFormat(' MMMM y ').format(now);
    if (value=='full date')return formattedDate;
    if (value=='year')return justYear;
    if (value=='month') return justMonth;
    if (value=='day and month') return dayMonth;
    if (value=='month and year') return monthYear;
  }

