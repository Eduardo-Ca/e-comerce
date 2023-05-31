import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatefulWidget {
  double heigth,width;
   Skeleton({
    super.key,
    required this.heigth,
    required this.width
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.orange,
      highlightColor: Colors.deepOrangeAccent,
      child: Container(
        width: widget.width,
        height: widget.heigth,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:Colors.black.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}


