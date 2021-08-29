class UserEntity {
  final String uid;
  final String name;
  final int age;
  UserEntity(this.uid, this.name, this.age);

  @override
  String toString() => '$name, $age';
}