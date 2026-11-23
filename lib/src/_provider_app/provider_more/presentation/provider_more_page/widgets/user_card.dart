part of '../provider_more_page.dart';

String _formatSaudiMobile(String mobile) {
  final local = mobile.startsWith('0') ? mobile.substring(1) : mobile;
  return '+966$local';
}

class _UseCard extends StatelessWidget {
  const _UseCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: LoggedUserCheckerWidget(
        loggedBuilder: (user) {
          return _LoggedUserCard(user: user);
        },
      ),
    );
  }
}

class _LoggedUserCard extends StatelessWidget {
  const _LoggedUserCard({required this.user});

  final CachedUser user;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlideWithOpacityWidget(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.providerPersonalProfile);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.enabledBorderColor),
          ),
          child: Row(
            spacing: 10,
            children: [
              () {
                if (user.avatar.isNotEmpty) {
                  return AppImage.circle(
                    path: user.avatar,
                    dimension: 54,
                    border: Border.all(color: AppColors.primary50),
                    placholderWidget: AppSvgIcon(path: AppIcons.userOutline, size: 24),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary50),
                    ),
                    child: AppSvgIcon(path: AppIcons.userOutline, size: 35),
                  );
                }
              }(),
              Expanded(
                child: Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyles.medium16.copyWith(color: AppColors.black900),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        AppSvgIcon(path: ""),
                        Flexible(
                          child: Text(
                            _formatSaudiMobile(user.mobile),
                            textDirection: TextDirection.ltr,
                            style: TextStyles.medium14.copyWith(color: AppColors.grey, height: 1.6),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}

// class _GuestCard extends StatelessWidget {
//   const _GuestCard();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSlideWithOpacityWidget(
//       child: Bounce(
//         onTap: () {
//           AppAuthenticationBloc.of(context).add(const LoggedOutEvent());
//         },
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(12), boxShadow: [AppColors.boxShadow]),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   spacing: 4,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(appLocalizer.userName, style: TextStyles.light14),
//                     Text(appLocalizer.phoneNumber, style: TextStyles.light12.copyWith(color: AppColors.primary800)),
//                   ],
//                 ),
//               ),
//               AppSvgIcon(path: AppIcons.loginIc, size: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
