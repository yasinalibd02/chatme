class AppUtils {
  static String formatDateTime(DateTime dateTime) {
    // Format DateTime object to a human-readable string
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  static bool isValidEmail(String email) {
    // Perform email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  // Other utility methods can be added here
}
