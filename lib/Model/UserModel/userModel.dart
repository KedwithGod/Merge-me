class User {
  final String name;
  final String surname;
  final int age;

  User({this.name, this.surname, this.age});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        age = json['age'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['age'] = this.age;
    return data;
  }
}