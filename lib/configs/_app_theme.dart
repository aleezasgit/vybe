part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    // PRIMARY group
    primary: ColorShades(
      main: const Color(0xFF8D43EF), // primary
      shade100: const Color(0xFFF4ECFD),
      shade200: const Color(0xFFEEE3FD),
      shade300: const Color(0xFFDCC5FA),
      shade500: const Color(0xFF7F3CD7),
      shade600: const Color(0xFF6A32B3),
      shade700: const Color(0xFF3F1E6C),
      shade800: const Color(0xFF311754),
    ),

    // SECONDARY group
    secondary: ColorShades(
      main: const Color(0xFF0EF0FC), // secondary
      shade100: const Color(0xFFE7FEFF),
      shade200: const Color(0xFFDBFDFF),
      shade300: const Color(0xFFB4FAFE),
      shade500: const Color(0xFF0DD8E3),
      shade600: const Color(0xFF089097),
      shade700: const Color(0xFF089097),
      shade800: const Color(0xFF055458),
    ),

    // ACCENT group
    accent: AccentColors(
      yellowLight: const Color(0xFFFEFAEB),
      yellow: const Color(0xFFF2CE3A),
      green: const Color(0xFF0A6A2B),
      greenLight: const Color(0xFFE7F0EA),
      red: const Color(0xFFF65555),
    ),

    // BACKGROUND group
    background: ColorShades(
      shade100: const Color(0xFF232A3E), //
      shade200: const Color(0xFF1D2334), //
      shade400: const Color(0xFF121620), //
      shade500: const Color(0xFF090B10), //
      

      main: const Color(0xFF141824), // background
    ),

    // TEXT group
    text: ColorShades(
      main: const Color(0xFF96969C), // grey
      shade100: const Color(0xFF29292B), //
      shade200: const Color(0xFF46464A), //
      shade300: const Color(0xFF5E5E62), //
      shade600: const Color(0xFFD4D4D6), //
      shade700: const Color(0xFFEAEAEB), //
      shade800: const Color(0xFFFFFFFF), //
    ),

    // LIGHT GREY group
    lightGrey: ColorShades(
      main: const Color(0xFF242C42), // lightGrey
      shade300: const Color(0xFF1D2335), //
      shade200: const Color(0xFFFBFAFF), //
      shade100: const Color(0xFFFDFCFF), //
      shade400: const Color(0xFFD9D9D9), //
      shade500: const Color(0xFF8697AC), //
      shade600: const Color(0xFFE7ECF0), //
    ),

    //Error Group
    error: ColorShades(
      main: Color(0xFFF65555),
      shade100: Color(0xFFFEE6E6),
      shade800: Color(0xFFDF1C41),
    ),

    //Primary Gradient
    primaryGradient: PrimaryGradient(
      startColor: const Color(0xFF05F9FE), // primary.main
      endColor: const Color(0xFF8E43EF), // secondary.main
    ),

    // SINGLE COLORS (no shades)
    white: const Color(0xFFFFFFFF), //
    black: const Color(0xFF1B1A1F), //
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static void init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
