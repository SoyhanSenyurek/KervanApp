import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImageWidget extends StatefulWidget {
  List<String> _imageList;
  bool _deleteButtonActive;

  ImageWidget(List<String> imageList, bool deleteButtonActive) {
    this._imageList = imageList;
    this._deleteButtonActive = deleteButtonActive;
  }

  @override
  _ImageWidgetState createState() =>
      _ImageWidgetState(_imageList, _deleteButtonActive);
}

class _ImageWidgetState extends State<ImageWidget> {
  List<String> _imageList;
  bool _deleteButtonActive = false;

  _ImageWidgetState(List<String> imageList, bool deleteButtonActive) {
    this._imageList = imageList;
    this._deleteButtonActive = deleteButtonActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
        ),
        items: _imageList
            .map((e) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Visibility(
                        visible: _deleteButtonActive,
                        child: Container(
                          color: Colors.red,
                          child: Center(
                            child: IconButton(
                                icon: Icon(MdiIcons.delete), onPressed: () {}),
                          ),
                        ),
                      ),
                      Image.network(
                        e,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
