// ignore_for_file: public_member_api_docs, sort_constructors_first

class Item {
  final String name;
  final double value;
  Item({
    required this.name,
    required this.value,
  });

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
