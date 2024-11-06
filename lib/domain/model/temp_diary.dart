class TempDiary {
  final String id;
  final DateTime entryDate;
  final String contents;
  final String title;
  final DateTime updatedAt;

  TempDiary(
      {required this.id,
      required this.entryDate,
      required this.contents,
      required this.title,
      required this.updatedAt});
}
