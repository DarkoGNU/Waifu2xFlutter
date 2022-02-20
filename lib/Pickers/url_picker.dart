import 'package:flutter/material.dart';

class UrlPicker extends StatefulWidget {
  const UrlPicker({Key? key}) : super(key: key);

  @override
  _UrlPickerState createState() => _UrlPickerState();
}

class _UrlPickerState extends State<UrlPicker>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // implement this

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container();
  }
}
