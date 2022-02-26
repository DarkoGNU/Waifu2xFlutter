import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class UrlPicker extends StatefulWidget {
  const UrlPicker({Key? key}) : super(key: key);

  @override
  _UrlPickerState createState() => _UrlPickerState();
}

class _UrlPickerState extends State<UrlPicker>
    with AutomaticKeepAliveClientMixin {
  final Set<String> _links = {};

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

  void _clearLinks() {
    setState(() {
      _links.clear();
    });
  }

  Widget get _urlInfo {
    if (_links.isEmpty) {
      return SizedBox(
        height: 25,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(_countString),
        ),
      );
    }

    return Row(
      children: [
        Flexible(
          child: Text(_countString),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 25,
          child: MaterialButton(
            color: Colors.blue,
            child: const Text("Show"),
            onPressed: _clearLinks,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 25,
          child: MaterialButton(
            color: Colors.blue,
            child: const Text("Clear"),
            onPressed: _clearLinks,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _addUrl,
                  decoration: const InputDecoration(
                      hintText: 'Enter your link here',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.all(10.0)),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _addUrl(_textController.text),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          _urlInfo,
        ],
      ),
    );
  }
}
