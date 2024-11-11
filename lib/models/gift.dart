// models/gift.dart
class Gift {
  String id;
  String name;
  String status; // 'Idea', 'To Buy', 'Bought'
  String notes;

  Gift({required this.id, required this.name, required this.status, this.notes = ''});
}
