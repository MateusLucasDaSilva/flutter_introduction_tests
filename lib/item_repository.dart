import 'package:flutter_testes_introduction/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getAll();
  List<Item> getAllSync();
  Item getByName(String name);
}

class ItemRepositoryImpl implements ItemRepository {
  final List<Item> items = <Item>[
    Item(name: 'Arroz', value: 5),
    Item(name: 'Feijão', value: 6),
    Item(name: 'Macarrão', value: 7)
  ];

  @override
  Future<List<Item>> getAll() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return items;
  }

  @override
  List<Item> getAllSync() {
    return items;
  }

  @override
  Item getByName(String name) {
    return items.firstWhere((Item e) => e.name == name);
  }
}
