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

  final _textController = TextEditingController();

  void _addUrl(String text) {
    if (!isURL(text)) {
      return;
    }

    setState(() {
      _links.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return  Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _addUrl,
              decoration: const InputDecoration.collapsed(hintText: 'Image link'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _addUrl(_textController.text),
          ),
        ],
      );
  }
}
