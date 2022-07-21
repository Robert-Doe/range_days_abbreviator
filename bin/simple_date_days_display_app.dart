import 'dart:math';

void main(List<String> arguments) {
  List<Map<String, dynamic>> schedules = [
    {
      "day": "Monday",
      /*"start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': false
    },
    {
      "day": "Tuesday",
      /* "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': true
    },
    {
      "day": "Wednesday",
      /* "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': true
    },
    {
      "day": "Thursday",
      /* "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': false
    },
    {
      "day": "Friday",
      /* "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': true
    },
    {
      "day": "Saturday",
      /* "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': true
    },
    {
      "day": "Sunday",
      /*  "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 17, minute: 0),*/
      'selected': true
    }
  ];

  List<List<String>> selectedDays = <List<String>>[];
  bool isContinuous = false;
  int lastTrueIndex = -2;
  String openDays='';

  schedules.asMap().forEach((index, element) {
    if (element['selected'] == true) {
      if ((lastTrueIndex - index).abs() == 1) {
        isContinuous = true;
      }
      if (isContinuous) {
        selectedDays[selectedDays.length - 1].add(element['day']);
      } else {
        selectedDays.add(<String>[element['day']]);
      }
      lastTrueIndex = index;
    } else {
      isContinuous = false;
    }
  });
  print(selectedDays);

  selectedDays.forEach((element) {
    if(element.length>1){
      if(openDays.isEmpty){
        openDays="${element.first}-${element.last}";
      }else{
        openDays="$openDays,${element.first}-${element.last}";
      }
    }else{
      if(openDays.isEmpty){
        openDays="${element.first}";
      }else{
        openDays="$openDays,${element.first}";
      }
    }
  });

  print(openDays);
}
