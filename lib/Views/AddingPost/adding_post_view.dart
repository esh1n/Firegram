import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:picturn/ViewModels/gallery_list_view_model.dart';
import 'package:picturn/Views/AddingPost/full_size_image_asset_view.dart';
import 'package:picturn/Views/AddingPost/image_asset_gallery_view.dart';
import 'package:picturn/Views/Camera/camera_view.dart';
import 'package:picturn/Views/CustomWidgets/stroke_text.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

class AddingPostView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddingPostView();
  }
}

class _AddingPostView extends State<AddingPostView> {
  GalleryListViewModel galleryListViewModel;

  @override
  void initState() {
    this.galleryListViewModel = GalleryListViewModel();
    this._fetchAssets();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => this.galleryListViewModel,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, height / 2 - 50),
            child: FullSizeImageAssetView(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, height / 2 - 50, 0, 0),
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            alignment: Alignment.topCenter,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StrokeText('Галерея',
                    strokeColor: Colors.black,
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    strokeWidth: 0.5),
                Material(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        splashRadius: 20,
                        icon: Icon(Icons.camera_alt),
                        iconSize: 30,
                        onPressed: () {
                          print('camera');
                          this.getCameraImage();
                        },
                      ),
                      IconButton(
                        splashRadius: 20,
                        icon: Icon(Icons.arrow_upward),
                        iconSize: 30,
                        onPressed: () {
                          print('add post');
                          setState((){});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, height / 2, 0, 0),
            child: ImageAssetGalleryView(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, height / 2 - 50, 0, 0),
            child: Divider(
              thickness: 2,
              height: 0,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, height / 2, 0, 0),
            child: Divider(
              thickness: 2,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }

  _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );
    this.galleryListViewModel.currentIndex = 0;

    setState(() => this.galleryListViewModel.imageAssets = recentAssets
        .where((element) => element.type == AssetType.image)
        .toList());
  }

  getCameraImage() async {
    PickedFile imageFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 100);

    if (imageFile == null) return;

    setState(() {});

    File _imageFile = File(imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    print('111 папка приложения с данными:     ' + appDir.path.toString());
    final fileName = basename(_imageFile.path);
    print('222: имя картинки    ' + fileName.toString());
    final savedImage = await _imageFile.copy('${appDir.path}/$fileName');
  }
}
