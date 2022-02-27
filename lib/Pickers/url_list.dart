import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

enum _ButtonChoice {
  remove,
  edit,
}

extension _ButtonChoiceExtension on _ButtonChoice {
  String get name {
    switch (this) {
      case _ButtonChoice.remove:
        return "Remove";
      case _ButtonChoice.edit:
        return "Edit";
    }
  }
}

class UrlListPopUp extends StatefulWidget {
  const UrlListPopUp(
      {Key? key, required this.links, required this.changeCallback})
      : super(key: key);

  final Set<String> links;
  final VoidCallback changeCallback;

  @override
  _UrlListPopUpState createState() => _UrlListPopUpState();
}

class _UrlListPopUpState extends State<UrlListPopUp> {
  void _clearLinks() {
    setState(() => widget.links.clear());

    widget.changeCallback();
  }

  void _removeLink(String link) {
    setState(() => widget.links.remove(link));

    widget.changeCallback();
  }

  Future<void> _showEditDialog(String link) async {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Edit a link"),
        content: Text("Test"),
      ),
    );
  }

  void _handleTap(_ButtonChoice choice, String link) {
    if (choice == _ButtonChoice.remove) {
      _removeLink(link);
      return;
    }
     _showEditDialog(link);
  }

  Widget _buildButton(String link) {
    return PopupMenuButton<_ButtonChoice>(
      itemBuilder: (context) => _ButtonChoice.values
          .map((entry) => PopupMenuItem<_ButtonChoice>(
                onTap: () => _handleTap(entry, link),
                child: Text(entry.name),
              ))
          .toList(),
    );
  }

  List<Padding> get _itemList => widget.links
      .map(
        (entry) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(entry)),
              Center(
                heightFactor: 0.4,
                child: _buildButton(entry),
              ),
            ],
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Entered links"),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: _itemList,
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Clear"),
          onPressed: _clearLinks,
        ),
        TextButton(
          child: const Text("Return"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
