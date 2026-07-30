import 'package:flutter/material.dart';

import '../../core/config/router/app_routes.dart';
import '../../core/core.dart';
import '../../material/buttons/app_button.dart';
import '../../material/media/app_image.dart';
import '../../material/media/svg_icon.dart';
import '../../material/toast/app_toast.dart';
import '../../material/widgets/animated_slide_opacity_widget.dart';
import 'app_role.dart';

class SelectAppRolePage extends StatefulWidget {
  const SelectAppRolePage({super.key});

  @override
  State<SelectAppRolePage> createState() => _SelectAppRolePageState();
}

class _SelectAppRolePageState extends State<SelectAppRolePage> {
  AppRoleEnum? appRole;

  void _onNextTapped() {
    switch (appRole) {
      case AppRoleEnum.client:
        CurrentAppRole.setAppRole(appRole!);
        AppRouter.pushNamed(AppRoutes.clientLoginPage);
        break;
      case AppRoleEnum.provider:
        CurrentAppRole.setAppRole(appRole!);
        AppRouter.pushNamed(AppRoutes.providerLoginPage);
        break;
      default:
        AppToasts.hint(context, message: appLocalizer.pleaseSelectRoleFirst);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppSvgIcon(path: ""),
                const SizedBox(height: 16),
                Text(
                  appLocalizer.chooseUserType,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold18.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 16),
                Text(
                  appLocalizer.selectRoleDescreption,
                  textAlign: TextAlign.center,
                  style: TextStyles.medium14.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 32),
                AnimatedSlideWithOpacityWidget(
                  slideDirection: AlignmentDirectional.centerStart,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        appRole = AppRoleEnum.client;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(4).copyWith(top: 43),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [AppColors.boxShadow],
                            color: appRole == AppRoleEnum.client ? AppColors.primary100 : AppColors.white,
                            border: appRole == AppRoleEnum.client ? Border.all(color: AppColors.primary, width: 1.5) : null,
                          ),
                          child: Text("", textAlign: TextAlign.end, style: TextStyles.medium18),
                        ),
                        Positioned.directional(
                          start: 16,
                          bottom: 14,
                          textDirection: Directionality.of(context),
                          child: AppImage(path: "", height: 100, width: 100),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSlideWithOpacityWidget(
                  slideDirection: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        appRole = AppRoleEnum.provider;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(3).copyWith(top: 42),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [AppColors.boxShadow],
                            color: appRole == AppRoleEnum.provider ? AppColors.primary100 : AppColors.white,
                            border: appRole == AppRoleEnum.provider ? Border.all(color: AppColors.primary, width: 1.5) : null,
                          ),
                          child: Text("", textAlign: TextAlign.start, style: TextStyles.medium18),
                        ),
                        Positioned.directional(
                          end: 16,
                          bottom: 12,
                          textDirection: Directionality.of(context),
                          child: AppImage(path: "", height: 100, width: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: (appRole != null)
          ? AnimatedSlideWithOpacityWidget(
              slideDirection: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 28),
                  child: AppButton(text: appLocalizer.next, onPressed: _onNextTapped),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
