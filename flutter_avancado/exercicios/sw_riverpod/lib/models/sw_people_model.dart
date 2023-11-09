class StarWarsPeopleModel {
  late String name;
  late String height;
  late String gender;

  StarWarsPeopleModel(
      {required this.name, required this.height, required this.gender});

  StarWarsPeopleModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.height = json['height'];
    this.gender = json['gender'];
  }
}
