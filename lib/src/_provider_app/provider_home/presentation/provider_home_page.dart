import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../core/core.dart';
import '../../../../material/auth_states/logged_user_checker_widget.dart';
import '../../../../material/media/app_image.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../ads/presentation/ads/ads_widget.dart';
import '../../../notifications/presentation/widgets/notification_button.dart';

part 'widgets/provider_home_app_bar.dart';
part 'widgets/provider_home_body.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProviderHomeAppBar(),
        Expanded(child: _ProviderHomeBody()),
      ],
    );
  }
}
