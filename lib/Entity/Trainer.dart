class Trainer {
  String id;
  String name;
  String email;
  String age;
  String speciality;
  String about;

  Trainer(
      {required this.id,
      required this.name,
      required this.email,
      required this.age,
      required this.speciality,
      required this.about});

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['trainer_id'] as String,
      name: json['trainer_name'] as String,
      email: json['trainer_email'] as String,
      age: json['trainer_age'] as String,
      speciality: json['trainer_speciality'] as String,
      about: json['trainer_about'] as String,
    );
  }
}
