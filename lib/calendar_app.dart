import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_playground/company_colors.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// void main() {
//   return runApp(CalendarApp());
// }

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [Locale('en'), Locale('km')],
        theme: ThemeData(
            // fontFamily: 'KhmerOSBattambang',
            primarySwatch: CompanyColors.blue,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: CompanyColors.blue,
                  displayColor: Colors.red,
                ),
            iconTheme: Theme.of(context).iconTheme.copyWith(
                  color: hexToColor("#ef7c00"),
                ),
            // backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                  ),
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
            )),
        title: 'Calendar Demo',
        home: MyHomePage());
  }
}

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: UniqueKey(),
        body: SafeArea(
      child: SfCalendar(
        key: UniqueKey(),
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: false,
        ),
        allowedViews: [
          CalendarView.day,
          CalendarView.month,
          CalendarView.schedule,
        ],
        showNavigationArrow: true,
        showDatePickerButton: true,
        showCurrentTimeIndicator: true,
        onTap: (calendarTapDetails) {
          print(calendarTapDetails.appointments);
          showDatePicker(
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
              context: context,
              initialDate: DateTime.now(),
              // fieldLabelText: "asdasd",
              // fieldHintText: "fieldHintText",
              // cancelText: "myCancel",
              // helpText: "myASdasd",
              locale: Locale("km"));
        },
      ),
    ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  @override
  String toString() {
    return 'Meeting{eventName: $eventName, from: $from, to: $to, background: $background, isAllDay: $isAllDay}';
  }
}
