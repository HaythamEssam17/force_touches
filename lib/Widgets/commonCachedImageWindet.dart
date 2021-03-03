import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonCachedImaeWidget {
  static Widget cachedImage(
      BuildContext context, String imageUrl, double height, double width) {
    String image = imageUrl == null
        ? 'https://images.squarespace-cdn.com/content/v1/5a82af66268b96b3d21c138e/1519903540592-RIH0UM4MCAUNW5AVS2XL/ke17ZwdGBToddI8pDm48kDlC8Rw7UeXJ0JdOUDyQap9Zw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVF500tWi5wZN_7a_4AhdqIXVhFzgNFCXvXCGvRLULd7_m0nsU3dfn6w--du8-EjPUE/ICON-Corp-Wellness-01.png'
        : imageUrl;
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      placeholder: (context, img) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => ClipOval(
      //   child: Image.asset(
      //     'images/logo.jpg',
      //     fit: BoxFit.fill,
      //     height: height,
      //     width: width,
      //   ),
      // ),
    );
  }
}
