import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class HomeBodyShimmer extends StatelessWidget {
  const HomeBodyShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            shimmerBox(height: 44, width: double.infinity, radius: 12),
            const SizedBox(height: 18),
            shimmerBox(height: 140, width: double.infinity, radius: 18),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(height: 18, width: 110),
                shimmerBox(height: 14, width: 60),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, _) => const SizedBox(width: 12),
                itemBuilder: (context, _) {
                  return Column(
                    children: [
                      shimmerCircle(size: 64),
                      const SizedBox(height: 8),
                      shimmerBox(height: 10, width: 48),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(height: 18, width: 110),
                shimmerBox(height: 14, width: 60),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, _) => const SizedBox(width: 12),
                itemBuilder: (context, _) {
                  return shimmerProductCard();
                },
              ),
            ),
            const SizedBox(height: 20),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(height: 18, width: 110),
                shimmerBox(height: 14, width: 60),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, _) => const SizedBox(width: 12),
                itemBuilder: (context, _) {
                  return shimmerProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerProductCard() {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerBox(height: 120, width: double.infinity, radius: 10),
          const SizedBox(height: 10),
          shimmerBox(height: 12, width: 120),
          const SizedBox(height: 8),
          shimmerBox(height: 12, width: 80),
          const SizedBox(height: 10),
          Row(
            children: [
              shimmerBox(height: 10, width: 32),
              const SizedBox(width: 8),
              shimmerBox(height: 10, width: 48),
            ],
          ),
        ],
      ),
    );
  }

  Widget shimmerBox({
    required double height,
    required double width,
    double radius = 6,
  }) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 300),
      color: Colors.grey.shade400,
      colorOpacity: 0.3,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget shimmerCircle({required double size}) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      color: Colors.grey.shade400,
      colorOpacity: 0.3,
      enabled: true,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget shimmerRounded({required double size}) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      color: Colors.grey.shade300,
      colorOpacity: 0.3,
      enabled: true,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

