import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double height;
  final double width;

  const ImageFromNetwork(
      {super.key,
        required this.imageUrl,
        this.fit = BoxFit.cover,
        this.height = 40,
        this.width = 40});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        height: height,
        width: width,
        child: const Placeholder(
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline,
        color: Colors.black,
      ),
    );
  }
}