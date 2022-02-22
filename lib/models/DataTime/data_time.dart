import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages("de", timeago.DeMessages());
  timeago.setLocaleMessages("de_short", timeago.DeShortMessages());
}
class DataTime extends StatefulWidget {
  const DataTime({Key? key}) : super(key: key);

  @override
  _DataTimeState createState() => _DataTimeState();
}
class _DataTimeState extends State<DataTime> {
  @override
  Widget build(BuildContext context) {
    DateTime minAgo = DateTime.now().subtract(const Duration(minutes: 2));
    DateTime dayAgo = DateTime.now().subtract(const Duration(days: 1));
    DateTime monthAgo = DateTime.now().subtract(const Duration(days: 1));
    return Scaffold(
      appBar: AppBar(title: const Text("appBar"),),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text(timeago.format(minAgo)),
          Text(timeago.format(dayAgo,locale: "en_short")),
          Text(timeago.format(monthAgo,locale:"en_short")),

        ],
      ),
    );
  }
}
