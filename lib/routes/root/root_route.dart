import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/routes/root/root_route_controller.dart';

class RootRoute extends StatelessWidget {
  const RootRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: RootRouteController(),
        builder: (controller) {
          return IndexedStack(
            index: controller.navIndex,
            children: controller.routes,
          );
        },
      ),
      bottomNavigationBar: GetBuilder(
        init: RootRouteController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF111111).withOpacity(0.2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppTheme.colors.lightGray,
              elevation: 30,
              unselectedLabelStyle: AppTheme.textStyles.medium12,
              selectedLabelStyle: AppTheme.textStyles.semibold14Gray,
              selectedItemColor: AppTheme.colors.black,
              unselectedItemColor: AppTheme.colors.gray,
              currentIndex: controller.navIndex,
              onTap: controller.setIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: AppTheme.colors.gray,
                  ),
                  activeIcon: Icon(
                    Icons.check_circle,
                    color: AppTheme.colors.black,
                  ),
                  label: '할일',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: AppTheme.colors.gray,
                  ),
                  activeIcon: Icon(
                    Icons.settings,
                    color: AppTheme.colors.black,
                  ),
                  label: '설정',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
