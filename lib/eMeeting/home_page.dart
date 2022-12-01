import 'package:flutter/material.dart';

class EMeetingHomePage extends StatefulWidget {
  const EMeetingHomePage({Key? key}) : super(key: key);

  @override
  State<EMeetingHomePage> createState() => _EMeetingHomePageState();
}

class _EMeetingHomePageState extends State<EMeetingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("eMeeting"),
      ),
      body: ListView(
        children: [
          EmployeeListExpansionRow(),
        ],
      ),
    );
  }
}

class EmployeeListExpansionRow extends StatefulWidget {
  const EmployeeListExpansionRow({
    Key? key,
    this.employeeProfile,
    this.canViewMore = true,
  }) : super(key: key);

  final Object? employeeProfile;
  final bool canViewMore;

  @override
  State<EmployeeListExpansionRow> createState() =>
      _EmployeeListExpansionRowState();
}

class _EmployeeListExpansionRowState extends State<EmployeeListExpansionRow>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  final titleTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          title: Text(
            "asdasdasdasdas",
            style: titleTextStyle,
          ),
          subtitle:
          Text("menuListItem(title: employeeProfile?.officialId ?? " ")"),
          iconColor: Colors.black,
          textColor: Colors.black,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            const SizedBox(height: 4),
            menuListItem(
              icon: Icons.add,
              title: "employeeProfile?.position",
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget menuListItem({
    IconData? icon,
    String? title,
    VoidCallback? onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.badge_outlined,
          color: Colors.yellow,
          size: 28,
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GestureDetector(
            onTap: onTap,
            onLongPress: () async {},
            child: RichText(
              text: TextSpan(
                text: title ?? "",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'KhmerOSBattambang',
                  color: Colors.black,
                  decoration: (onTap == null) ? null : TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}