import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:picturn/ViewModels/asset_list_view_model.dart';
import 'package:provider/provider.dart';

import 'asset _thumbnail_view.dart';

class AssetGalleryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetGalleryView();
  }
}

class _AssetGalleryView extends State<AssetGalleryView> {
  AssetListViewModel assetListViewModel;

  @override
  Widget build(BuildContext context) {
    this.assetListViewModel =
          Provider.of<AssetListViewModel>(context, listen: false);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 8 : 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1, //(1 / 1),
      ),
      itemCount: this.assetListViewModel.assets.length,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            if (this.assetListViewModel.assets[index].type == AssetType.image) {
              this.assetListViewModel.currentIndex = index;
              //print(this.assetListViewModel.assets.toString());
            }
          },
          child:
              AssetThumbnailView(asset: this.assetListViewModel.assets[index], itemNumber: index,),
        );
      },
    );
  }
}
