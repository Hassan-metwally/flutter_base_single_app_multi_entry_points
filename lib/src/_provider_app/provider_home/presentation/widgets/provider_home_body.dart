part of '../provider_home_page.dart';

class _ProviderHomeBody extends StatefulWidget {
  const _ProviderHomeBody();

  @override
  State<_ProviderHomeBody> createState() => _ProviderHomeBodyState();
}

class _ProviderHomeBodyState extends State<_ProviderHomeBody> {
  Future<void> Function()? _refreshAds;
  Future<void> _onRefresh() {
    return Future.wait([_refreshAds?.call() ?? Future<void>.value()]);
  }

  void _bindAds(Future<void> Function()? refresh) => _refreshAds = refresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: AppColors.backgroundColor,
      backgroundColor: AppColors.primary,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AdsWidget(onBindRefresh: _bindAds)),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
