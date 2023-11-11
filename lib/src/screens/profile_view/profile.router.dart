import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/profile_view/option_select_view/option_select_item.dart';
import 'package:amica/src/screens/profile_view/option_select_view/option_select_view.dart';
import 'package:amica/src/screens/profile_view/profile_edit_view/profile_edit_view.dart';
import 'package:amica/src/screens/profile_view/profile_photo_edit_view/profile_photo_edit_view.dart';
import 'package:amica/src/screens/profile_view/settings_view.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_detailed_view/user_profile_detailed.dart';
import 'package:amica/src/services/service_factory.service.dart';
import 'package:amica/src/shared/interests_list/interests_list.dart';
import 'package:amica/src/shared/theme.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final profileRouter = GoRoute(
  path: '/profile',
  builder: (context, state) => AmicaScaffold(
    title: 'Your Profile',
    scaffoldBody: UserProfileDetailed(
      profile: ServiceFactory.provideProfileService().userProfile!,
      isOwnProfile: true,
    ),
    selectedNavigationItemIndex: 3,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: 'edit-menu',
      builder: (context, state) => AmicaScaffold(
        title: 'Edit Profile',
        scaffoldBody: ProfileView(
          profile: ServiceFactory.provideProfileService().userProfile!,
        ),
        selectedNavigationItemIndex: 3,
        isDetailed: false,
      ),
      routes: profileEdit,
    ),
  ],
);

final profileEdit = <GoRoute>[
  GoRoute(
    path: 'edit',
    builder: (context, state) => AmicaScaffold(
      isDetailed: false,
      title: 'Edit Profile',
      scaffoldBody: ProfileEditView(
        profile: ServiceFactory.provideProfileService().userProfile!,
        profileService: ServiceFactory.provideProfileService(),
      ),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'interests',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: false,
      title: 'Edit interests',
      scaffoldBody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: InterestsListSelect(
          profileService: ServiceFactory.provideProfileService(),
        ),
      ),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'photos',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: false,
      title: 'Edit Profile',
      scaffoldBody: ProfilePhotoEditView(
        userProfile: ServiceFactory.provideProfileService().userProfile!,
      ),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'theme',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: false,
      selectedNavigationItemIndex: 3,
      title: 'Theme selection',
      scaffoldBody: OptionSelect(
        options: [
          OptionSelectItem("light", ThemeMode.light),
          OptionSelectItem("dark", ThemeMode.dark),
          OptionSelectItem("system", ThemeMode.system),
        ],
        onOptionSelect: (Object data) {
          final themeService =
              Provider.of<ThemeService>(context, listen: false);
          themeService.setThemeMode(data as ThemeMode);
        },
      ),
    ),
  ),
  GoRoute(
    path: 'language',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: false,
      selectedNavigationItemIndex: 3,
      title: 'Language selection',
      scaffoldBody: OptionSelect(
        options: [
          OptionSelectItem("English", "en-us"),
          OptionSelectItem("Українська", "ua-ua"),
        ],
        onOptionSelect: (Object data) {},
      ),
    ),
  ),
];
