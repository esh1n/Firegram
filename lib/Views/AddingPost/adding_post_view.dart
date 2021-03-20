import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picturn/Views/AddingPost/full_size_image_view.dart';
import 'package:picturn/Views/CustomWidgets/stroke_text.dart';
import 'package:photo_manager/photo_manager.dart';

import 'asset _thumbnail.dart';

class AddingPostView extends StatefulWidget {
  @override
  _AddingPostView createState() => _AddingPostView();
}

class _AddingPostView extends State<AddingPostView> {
  List<AssetEntity> assets = [];
  int currentIndex;

  @override
  void initState() {
    super.initState();
    this._fetchAssets();
  }

  _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );
    this.currentIndex = 0;

    setState(() => this.assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        //TODO сделать вьюмодель для фул сайз картинки, которую м.б. юзать через Changenotifierprovider, для управления состоянием
        Container(
          child: FullSizeImageView(
            imageFile: this.currentIndex != null
                ? this.assets[currentIndex].file
                : null,
          ),
        ),
        //

        Container(
          margin: EdgeInsets.fromLTRB(0, height / 2 - 50, 0, 0),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 2.0, color: Colors.black),
            ),
          ),
          alignment: Alignment.topCenter,
          child: StrokeText('Галерея',
              strokeColor: Colors.black,
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
              strokeWidth: 0.5),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, height / 2, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 2.0, color: Colors.black),
            ),
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 8
                      : 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1, //(1 / 1),
            ),
            itemCount: this.assets.length,
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  if (this.assets[index].type == AssetType.image)
                    currentIndex = index;
                },
                child: AssetThumbnail(asset: this.assets[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
