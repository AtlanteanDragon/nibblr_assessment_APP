class Dinner {
  final int id;
  final int userdataid;
  final DateTime startdate;
  final int duration;
  final String title;
  final String description;
  Dinner(this.id, this.userdataid, this.startdate, this.duration, this.title,
      this.description);
  factory Dinner.fromJson(Map<String, dynamic> json) {
    return Dinner(
      json['id'],
      json['user_data_id'],
      json['start_date'],
      json['duration'],
      json['title'],
      json['description'],
    );
  }
}
