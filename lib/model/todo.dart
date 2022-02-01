class Todo {
  int id = 0;
  String description;
  String label;
  bool completed = false;
  String deleteTimestamp = "";
  String createTimestamp = "";
  String updateTimeStamp = "";

  Todo(
      {required this.id,
      required this.description,
      required this.label,
      required this.completed,
      this.deleteTimestamp = "",
      required this.createTimestamp,
      required this.updateTimeStamp});

  Todo.creation(this.description, this.label);

  static Map<String, dynamic> todoToJson(Todo instance) {
    return <String, dynamic>{
      'description': instance.description,
      'label': instance.label,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        description: json['description'],
        label: json['label'],
        completed: json['completed'],
        deleteTimestamp: json['delete_at'] == null ? "" : json['delete_at'],
        createTimestamp: json['created_at'],
        updateTimeStamp: json['updated_at']);
  }
}
