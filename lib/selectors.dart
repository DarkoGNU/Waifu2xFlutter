import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;

        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // To get index of current tab use tabController.index
          }
        });

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
              _GalleryPicker(),
              _UrlPicker(),
            ],
          ),
        );
      }),
    );
  }
}

class _GalleryPicker extends StatefulWidget {
  const _GalleryPicker({Key? key}) : super(key: key);

  @override
  _GalleryPickerState createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<_GalleryPicker> {
  final ImagePicker _picker = ImagePicker();

  List<XFile>? _images;
  int get _imagesCount => _images?.length ?? 0;

  void _handleButtonPress() async {
    List<XFile>? newImages = await _picker.pickMultiImage();

    setState(() {
      _images = newImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            color: Colors.blue,
            child: const Text("Pick image from gallery"),
            onPressed: () => setState(() => _handleButtonPress()),
          ),
          Text(
            "$_imagesCount images picked",
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _UrlPicker extends StatefulWidget {
  const _UrlPicker({Key? key}) : super(key: key);

  @override
  _UrlPickerState createState() => _UrlPickerState();
}

class _UrlPickerState extends State<_UrlPicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
