import 'package:flutter/material.dart';

import 'gallery_picker.dart';
import 'url_picker.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: [
                Tab(text: "Gallery"),
                Tab(text: "URL"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              GalleryPicker(),
              UrlPicker(),
            ],
          ),
        );
      }),
    );
  }
}
