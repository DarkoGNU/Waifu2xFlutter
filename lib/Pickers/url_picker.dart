import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:waifu2x_flutter/themes.dart' as theming;
import 'url_list.dart';

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
  final _formKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addUrl(String text) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _links.add(text);
      _textController.clear();
    });
  }

  void _clearLinks() {
    setState(() => _links.clear());
  }

  void _rebuildWidget() {
    setState(() {});
  }

  Widget _buildUrlInfo() {
    if (_links.isEmpty) {
      return SizedBox(
        height: 25,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(_countString),
        ),
      );
    }

    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Flexible(
            child: Text(_countString),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            child: const Text("Show"),
            onPressed: () => showDialog(
                context: context,
                // The pop-up is handled by the UrlListPopUp class
                builder: (context) => UrlListPopUp(
                      links: _links,
                      changeCallback: _rebuildWidget,
                    )),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            child: const Text("Clear"),
            onPressed: _clearLinks,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  key: _formKey,
                  controller: _textController,
                  validator: (value) => isURL(value) ? null : "Invalid URL",
                  onFieldSubmitted: _addUrl,
                  decoration: InputDecoration(
                    hintText: 'Enter your link here',
                    border: const OutlineInputBorder(),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    suffixIconConstraints: const BoxConstraints(maxHeight: 40),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      iconSize: 24,
                      color: theming.iconColor,
                      onPressed: () => _addUrl(_textController.text),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          _buildUrlInfo(),
        ],
      ),
    );
  }
}
