import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class UrlPicker extends StatefulWidget {
  const UrlPicker({Key? key}) : super(key: key);

  @override
  _UrlPickerState createState() => _UrlPickerState();
}

class _UrlPickerState extends State<UrlPicker>
    with AutomaticKeepAliveClientMixin {
  Set<String> _links = {};

  @override
  bool get wantKeepAlive => _links.isNotEmpty;

  int get _linksCount => _links.length;

  String get _countString {
    switch (_linksCount) {
      case 0:
        return "No links selected";
      case 1:
        return "1 link selected";
      default:
        return "$_linksCount links selected";
    }
  }

  final _textController = TextEditingController();

  void _addUrl(String text) {
    if (!isURL(text)) {
      return;
    }

    setState(() {
      _links.add(text);
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _addUrl,
                  decoration:
                      const InputDecoration.collapsed(hintText: 'Enter your link here'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _addUrl(_textController.text),
              ),
            ],
          ),
          Text(_countString),
        ],
      ),
    );
  }
}
