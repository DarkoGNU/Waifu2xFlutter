import 'package:flutter/material.dart';

const _pickers = [
  _GalleryPicker(),
];

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pickers.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;

        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // To get index of current tab use tabController.index
          }
        });

        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _pickers.map((picker) => Tab(text: picker.label)).toList(),
            ),
          ),
          body: TabBarView(
            children: _pickers.map((picker) {
              return Center(
                child: Text(
                  '${picker.label} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

class _GalleryPicker extends StatefulWidget {
  final label = "Gallery";

  const _GalleryPicker({Key? key}) : super(key: key);

  @override
  _GalleryPickerState createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<_GalleryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
