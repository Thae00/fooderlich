class AppLink {
  static const String homePath = '/home';
  static const String onboardingPath = '/onboarding';
  static const String loginPath = '/login';
  static const String profilePath = '/profile';
  static const String itemPath = '/item';

  static const String tabParam = 'tab';
  static const String idParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({this.location, this.currentTab, this.itemId});

  // TODO: Add fromLocation

// TODO: Add toLocation
}
