class HelperMethods {


  static  String formatDate(DateTime date) {
    return "${monthName(date.month)} ${date.day}";
  }

  static String monthName(int month) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }
}