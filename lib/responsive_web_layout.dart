library responsive_web_layout;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ResponsiveWebLayout {
  static Widget buildPlatformSpecificLayout({
    required BuildContext context,
    required quadHDLayout,
    required fullHDLayout,
    required hdLayout,
    required sdLayout,
    required largeMobileLayout,
    required mediumMobileLayout,
    required smallMobileLayout,
    required highResTabletLayout,
    required standardTabletLayout,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (kIsWeb) {
      if (screenWidth >= 1024 && screenWidth<=2560) {
        return buildDesktopLayout(
            context: context,
            quadHDLayout: quadHDLayout,
            fullHDLayout: fullHDLayout,
            hdLayout: hdLayout,
            sdLayout: sdLayout
        );
      }
      if (screenWidth >= 768 && screenWidth < 1024 || screenWidth == 2048) {
        return buildTabletLayout(
            context: context,
            highResTabletLayout: highResTabletLayout,
            standardTabletLayout: standardTabletLayout
        );
      }
      if (screenWidth >= 320 && screenWidth < 375 ||
          screenWidth >= 375 && screenWidth < 425 ||
          screenWidth >= 425 && screenWidth < 768) {
        return buildMobileLayout(
            context: context,
            largeMobileLayout: largeMobileLayout,
            mediumMobileLayout: mediumMobileLayout,
            smallMobileLayout: smallMobileLayout
        );
      }
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return buildMobileLayout(
            context: context,
            largeMobileLayout: largeMobileLayout,
            mediumMobileLayout: mediumMobileLayout,
            smallMobileLayout: smallMobileLayout,
          );
        case TargetPlatform.iOS:
          return buildMobileLayout(
              context: context,
              largeMobileLayout: largeMobileLayout,
              mediumMobileLayout: mediumMobileLayout,
              smallMobileLayout: smallMobileLayout);
        case TargetPlatform.macOS:
          return buildDesktopLayout(
              context: context,
              quadHDLayout: quadHDLayout,
              fullHDLayout: fullHDLayout,
              hdLayout: hdLayout,
              sdLayout: sdLayout);
        case TargetPlatform.linux:
          return buildDesktopLayout(
              context: context,
              quadHDLayout: quadHDLayout,
              fullHDLayout: fullHDLayout,
              hdLayout: hdLayout,
              sdLayout: sdLayout);
        case TargetPlatform.windows:
          return buildDesktopLayout(
              context: context,
              quadHDLayout: quadHDLayout,
              fullHDLayout: fullHDLayout,
              hdLayout: hdLayout,
              sdLayout: sdLayout);
        case TargetPlatform.fuchsia:
          return buildMobileLayout(
              context: context,
              largeMobileLayout: largeMobileLayout,
              mediumMobileLayout: mediumMobileLayout,
              smallMobileLayout: smallMobileLayout);
        default:
          debugPrint(
              "Unsupported platform: ${defaultTargetPlatform.toString()}");
          return const SizedBox.shrink();
      }
    } else {
      debugPrint(
          "Unsupported configuration: screenWidth=$screenWidth, platform=${defaultTargetPlatform.toString()}");
      return const SizedBox.shrink();
    }
  }

  static Widget buildDesktopLayout({
    required BuildContext context,
    required Widget quadHDLayout,

    /// 1440p
    required Widget fullHDLayout,

    /// 1080p
    required Widget hdLayout,

    /// 720p
    required Widget sdLayout,

    /// 480p
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 2560) {
      /// Quad HD and higher resolutions (2560x1440 and up)
      return quadHDLayout;
    } else if (screenWidth >= 1920 && screenWidth < 2560) {
      /// Full HD (1920x1080)
      return fullHDLayout;
    } else if (screenWidth >= 1366 && screenWidth < 1920) {
      /// HD (1366x768)
      return hdLayout;
    } else if (screenWidth >= 1024 && screenWidth < 1366) {
      /// SD (1024x768)
      return sdLayout;
    }
    debugPrint("Unsupported desktop screen width: $screenWidth");
    return const SizedBox.shrink();
  }

  static Widget buildTabletLayout({
    required BuildContext context,
    required Widget highResTabletLayout,

    /// High resolution tablets
    required Widget standardTabletLayout,

    /// Standard resolution tablets
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth == 2048) {
      /// High resolution tablets (e.g., iPad Pro 2048x2732)
      return highResTabletLayout;
    } else if (screenWidth >= 768 && screenWidth < 1024) {
      /// Standard resolution tablets (e.g., iPad 1024x768)
      return standardTabletLayout;
    }
    debugPrint("Unsupported tablet screen width: $screenWidth");
    return const SizedBox.shrink();
  }

  static Widget buildMobileLayout({
    required BuildContext context,
    required Widget largeMobileLayout,

    /// Large smartphones
    required Widget mediumMobileLayout,

    /// Medium smartphones
    required Widget smallMobileLayout,

    /// Small smartphones
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 425 && screenWidth < 768) {
      /// Large smartphones (e.g., iPhone 13 Pro Max 428x926)
      return largeMobileLayout;
    } else if (screenWidth >= 375 && screenWidth < 425) {
      /// Medium smartphones (e.g., iPhone 11 Pro 375x812)
      return mediumMobileLayout;
    } else if (screenWidth >= 320 && screenWidth < 375) {
      /// Small smartphones (e.g., older iPhone models)
      return smallMobileLayout;
    }
    debugPrint("Unsupported mobile screen width: $screenWidth");
    return const SizedBox.shrink();
  }

  static bool isQuadHDLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 2560) {
      return true;
    } else {
      return false;
    }
  }

  static bool isFullHDLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1920 && screenWidth < 2560) {
      return true;
    } else {
      return false;
    }
  }

  static bool isHdLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1366 && screenWidth < 1920) {
      return true;
    } else {
      return false;
    }
  }

  static bool isSdLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024 && screenWidth < 1366) {
      return true;
    } else {
      return false;
    }
  }

  static bool isSmallMobileLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 320 && screenWidth < 375) {
      return true;
    } else {
      return false;
    }
  }

  static bool isMediumMobileLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 375 && screenWidth < 425) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLargeMobileLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 425 && screenWidth < 768) {
      return true;
    } else {
      return false;
    }
  }

  static bool isStandardTabletLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 768 && screenWidth < 1024) {
      return true;
    } else {
      return false;
    }
  }

  static bool isHighResTabletLayout({required BuildContext context}) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth == 2048) {
      return true;
    } else {
      return false;
    }
  }
}
