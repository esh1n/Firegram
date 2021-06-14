

import 'package:flutter/widgets.dart';

class UiUtils{
  static Image getIconByPath(String url,{String fallbackAsset = "res/images/no_avatar.png"}) {
    if(url==null||url.isEmpty||url.startsWith("res/images/")){
      return Image.asset(fallbackAsset);
    }else{
      return Image.network(url);
    }
  }
}