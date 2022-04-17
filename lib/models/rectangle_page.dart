import 'package:flutter/material.dart';
import 'next_days_status.dart';

class FiveNextDaysStatusPage extends StatefulWidget {
  const FiveNextDaysStatusPage({Key? key}) : super(key: key);

  @override
  State<FiveNextDaysStatusPage> createState() => _FiveNextDaysStatusPageState();
}

class _FiveNextDaysStatusPageState extends State<FiveNextDaysStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        height: 249,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NextdaysStatus(),
          ],
        ),
      ),
    );
  }
}
