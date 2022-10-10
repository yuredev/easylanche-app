import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;

  const ShimmerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Cores.cinzaShimmer,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
