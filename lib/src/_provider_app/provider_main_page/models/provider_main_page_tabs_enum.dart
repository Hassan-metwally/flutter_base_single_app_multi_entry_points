import '../../../../core/core.dart';

enum ProviderMainPageTabsEnum {
  home,
  myOrders,
  wallet,
  more;

  String get filledIc {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return "";
      case ProviderMainPageTabsEnum.myOrders:
        return "";
      case ProviderMainPageTabsEnum.wallet:
        return "";
      case ProviderMainPageTabsEnum.more:
        return "";
    }
  }

  String get outlineIc {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return "";
      case ProviderMainPageTabsEnum.myOrders:
        return "";
      case ProviderMainPageTabsEnum.wallet:
        return "";
      case ProviderMainPageTabsEnum.more:
        return "";
    }
  }

  String get title {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return appLocalizer.home;
      case ProviderMainPageTabsEnum.myOrders:
        return appLocalizer.myOrders;
      case ProviderMainPageTabsEnum.wallet:
        return appLocalizer.wallet;
      case ProviderMainPageTabsEnum.more:
        return appLocalizer.more;
    }
  }
}
