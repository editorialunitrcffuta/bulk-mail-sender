import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OADpImageWidget extends StatelessWidget {
  final String placeholderAsset;
  final String? imageUrl;
  final File? imageFile;
  // final void Function()? editCallback;
  final bool hasError;
  final bool editable;
  final double frameRadius;
  final bool isCircular;
  final double borderRadius;
  final double? height;
  final double? width;

  const OADpImageWidget({
    Key? key,
    required this.placeholderAsset,
    this.imageUrl,
    this.imageFile,
    // this.editCallback,
    this.hasError = false,
    this.editable = true,
    this.frameRadius = 30.0,
    this.isCircular = true,
    this.borderRadius = 12,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: (context) {
          final frameDecoration = BoxDecoration(
            color: Colors.grey,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                !isCircular ? BorderRadius.circular(borderRadius) : null,
          );
          final _PlaceHolder placeholder = _PlaceHolder(
            isCircular: isCircular,
            borderRadius: borderRadius,
            placeholderAsset: placeholderAsset,
            height: height,
            frameRadius: frameRadius,
            width: width,
          );

          if (imageFile != null) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                borderRadius:
                    !isCircular ? BorderRadius.circular(borderRadius) : null,
              ),
              height: height ?? frameRadius * 2,
              width: width ?? frameRadius * 2,
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            );
          } else if (imageUrl == null) {
            return placeholder;
          } else {
            return Container();
            // CachedNetworkImage(
            //   imageUrl: imageUrl!,
            //   imageBuilder: (context, imageProvider) {
            //     return Container(
            //       clipBehavior: Clip.hardEdge,
            //       decoration: frameDecoration,
            //       height: height ?? frameRadius * 2,
            //       width: width ?? frameRadius * 2,
            //       child: Image(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            //   placeholder: (context, url) => placeholder,
            //   errorWidget: (context, url, error) => placeholder.copyWith(
            //     hasError: true,
            //     errorMessage:
            //         (error is HandshakeException) ? "Connection Error" : null,
            //   ),
            // );
          }
        }),
      ],
    );
  }
}

class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder({
    Key? key,
    required this.isCircular,
    required this.borderRadius,
    required this.placeholderAsset,
    required this.height,
    required this.frameRadius,
    required this.width,
    this.hasError = false,
    this.errorMessage,
  }) : super(key: key);

  _PlaceHolder copyWith({bool hasError = false, String? errorMessage}) {
    return _PlaceHolder(
      isCircular: isCircular,
      borderRadius: borderRadius,
      placeholderAsset: placeholderAsset,
      height: height,
      frameRadius: frameRadius,
      width: width,
      hasError: hasError,
      errorMessage: errorMessage,
    );
  }

  final bool isCircular;
  final double borderRadius;
  final String placeholderAsset;
  final double? height;
  final double frameRadius;
  final double? width;
  final bool hasError;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              !isCircular ? BorderRadius.circular(borderRadius) : null,
          image: DecorationImage(
              image: AssetImage(placeholderAsset),
              colorFilter: hasError
                  ? ColorFilter.mode(
                      Colors.red.withOpacity(0.4), BlendMode.modulate)
                  : null,
              fit: BoxFit.fill)),
      height: height ?? frameRadius * 2,
      width: width ?? frameRadius * 2,
      child: hasError
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  errorMessage ?? "An Error Occurred",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          : null,
    );
  }
}
