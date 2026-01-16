class Responsive {
  static bool isMobile(double width) => width < 600;
  static bool isTablet(double width) => width >= 600 && width < 1000;
  static bool isDesktop(double width) => width >= 1000;
}
