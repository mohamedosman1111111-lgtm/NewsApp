class FormatData {
 static String formatPublishedAt(String? iso) {
    final dt = DateTime.tryParse(iso ?? "")?.toLocal();
    if (dt == null) return "";
    const months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final amPm = dt.hour >= 12 ? "PM" : "AM";
    final minute = dt.minute.toString().padLeft(2, '0');
    return "${months[dt.month - 1]} ${dt.day}, ${dt.year}, $hour:$minute $amPm";
  }

}
