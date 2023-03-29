import 'dart:convert';
import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> coursesNames;
  final List<Course> courses;
  final Address address;

  Student({
    this.id,
    required this.name,
    this.age,
    required this.coursesNames,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'coursesNames': coursesNames,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) map['age'] = age;

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      coursesNames: List<String>.from((map['coursesNames']  ?? <String>[])),
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
      courses: map['courses']
        ?.map<Course>((courseMap) => Course.fromMap(courseMap))
        .toList() ?? <Course>[],
    );
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));

  /*
  @override
  String toString() {
    return 'Student: $name($id)';
  }*/
}