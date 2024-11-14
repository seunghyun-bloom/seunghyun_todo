import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/routes/splash/splash_route_controller.dart';

class SplashRoute extends StatelessWidget {
  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SplashRouteController(),
        builder: (controller) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeInLeft(
                  duration: const Duration(seconds: 1),
                  delay: const Duration(seconds: 0),
                  child: Text(
                    'T',
                    style: AppTheme.textStyles.semibold18Black,
                  ),
                ),
                FadeInUp(
                  duration: const Duration(seconds: 1),
                  delay: const Duration(seconds: 1),
                  child: Text(
                    'O',
                    style: AppTheme.textStyles.semibold18Black,
                  ),
                ),
                FadeInDown(
                  duration: const Duration(seconds: 1),
                  delay: const Duration(seconds: 2),
                  child: Text(
                    'D',
                    style: AppTheme.textStyles.semibold18Black,
                  ),
                ),
                FadeInRight(
                  duration: const Duration(seconds: 1),
                  delay: const Duration(seconds: 3),
                  child: Text(
                    'O',
                    style: AppTheme.textStyles.semibold18Black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
