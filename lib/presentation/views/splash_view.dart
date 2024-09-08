import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gettest/src/assets/colors/colors.dart';
import 'package:gettest/src/assets/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: AppImages.logo.imgAsset(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: AppImages.gettest.imgAsset(),
                ),
                const SizedBox(height: 120)
              ],
            ),
          ),
          const Positioned(
            bottom: 56,
            child: Column(
              children: [
                SpinKitCircle(
                  size: 52,
                  color: green,
                ),
                SizedBox(height: 12),
                Text(
                  '© All rights reserved',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
