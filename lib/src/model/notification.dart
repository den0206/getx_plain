class NotificationMessage {
  String title;
  String content;
  String? iconURL;
  int? progress;
  int goal;
  bool isRead;
  bool isDirect;
  DateTime date;

  NotificationMessage({
    required this.title,
    required this.content,
    this.iconURL,
    this.progress,
    this.goal = 100,
    this.isRead = true,
    this.isDirect = true,
    required this.date,
  });

  NotificationMessage copyWith({
    String? title,
    String? content,
    int? progress,
    int? goal,
    bool? isRead,
    bool? isDirect,
    DateTime? date,
  }) {
    return NotificationMessage(
      title: title ?? this.title,
      content: content ?? this.content,
      progress: progress ?? this.progress,
      goal: goal ?? this.goal,
      isRead: isRead ?? this.isRead,
      isDirect: isDirect ?? this.isDirect,
      date: date ?? this.date,
      iconURL: '',
    );
  }
}
