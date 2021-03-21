import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picturn/ViewModels/asset_list_view_model.dart';
import 'package:provider/provider.dart';

class FullSizeAssetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AssetListViewModel>(
      builder: (context, AssetListViewModel, _) {
        return AssetListViewModel.currentIndex != null
            ? FutureBuilder<File>(
                future: AssetListViewModel
                    .assets[AssetListViewModel.currentIndex].file,
                builder: (_, snapshot) {
                  final file = snapshot.data;
                  if (file == null)
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  return Image.file(file, fit: BoxFit.scaleDown);
                },
              )
            : Container();
      },
    );
  }
}
