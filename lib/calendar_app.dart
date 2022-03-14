import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_playground/company_colors.dart';
import 'package:flutter_playground/intranet/alert_dialog.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

// void main() {
//   return runApp(CalendarApp());
// }

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          SfGlobalLocalizations.delegate
        ],
        supportedLocales: [Locale('en'), Locale('km')],
        locale: const Locale('km'),
        theme: ThemeData(
            fontFamily: 'KhmerOSBattambang',
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
  final tooltipKey = GlobalKey<State<Tooltip>>();

  bool isShow = false;

  CalendarView calendarView = CalendarView.month;
  final calendarCon = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Something"),
        ),
        body: SafeArea(
          child: SfCalendar(
            key: UniqueKey(),
            view: calendarView,
            todayTextStyle: TextStyle(
              color: CompanyColors.yellow,
              fontFamily: 'KhmerOSBattambang',
              // fontSize: 11
            ),
            controller: calendarCon,
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: TextStyle(
                  color: Colors.black, fontFamily: 'KhmerOSBattambang'),
              dateTextStyle: TextStyle(fontFamily: 'KhmerOSBattambang'),
            ),
            headerStyle: CalendarHeaderStyle(
              textStyle: TextStyle(
                fontFamily: 'KhmerOSBattambang',
                fontSize: 18,
              ),
            ),

            // weekNumberStyle: WeekNumberStyle(
            //   textStyle: TextStyle(
            //     color: Colors.deepOrange
            //   )
            // ),
            dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: false,
              agendaViewHeight: 150,
            ),

            appointmentBuilder: (context, calendarAppointmentDetails) {
              List<Meeting> meetings =
                  calendarAppointmentDetails.appointments.toList().cast();
              return Container(
                color: CompanyColors.blue,
                padding: EdgeInsets.only(left: 2),
                child: Text(
                  meetings[0].eventName,
                  style: TextStyle(
                    fontFamily: 'KhmerOSBattambang',
                    fontSize: 10,
                    height: 1.5,
                    color: Colors.white,
                    // backgroundColor: Colors.red
                  ),
                ),
              );
            },
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],

            showNavigationArrow: true,
            showDatePickerButton: true,
            onTap: (calendarTapDetails) {
              print(calendarTapDetails.appointments);
              List<Meeting> meetings =
                  calendarTapDetails.appointments!.toList().cast();

              // Widget okButton = TextButton(
              //   child: Text("Ok".tr),
              //   onPressed: () {
              //     Get.back();
              //   },
              // );
              // AlertDialog alert = AlertDialog(
              //   title: Text("${meetings[0].eventName}"),
              //   actions: [
              //     okButton,
              //   ],
              // );
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return alert;
              //   },
              // );
            },
          ),
        ));
  }

  void onTap(CalendarTapDetails calendarTapDetails) {
    final dynamic tooltip = tooltipKey.currentState;
    tooltip?.ensureTooltipVisible();
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
