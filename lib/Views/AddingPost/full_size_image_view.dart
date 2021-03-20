import 'dart:io';

import 'package:flutter/cupertino.dart';

class FullSizeImageView extends StatefulWidget {
  final Future<File> imageFile;

  FullSizeImageView({@required this.imageFile});

  State<StatefulWidget> createState() {
    return _FullSizeImageView(imageFile: this.imageFile);
  }
}

class _FullSizeImageView extends State<FullSizeImageView> {
  final Future<File> imageFile;

  _FullSizeImageView({@required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FutureBuilder<File>(
        future: this.imageFile,
        builder: (_, snapshot) {
          final file = snapshot.data;
          if (file == null) return Container();
          return Image.file(file);
        },
      ),
    );
  }
}
