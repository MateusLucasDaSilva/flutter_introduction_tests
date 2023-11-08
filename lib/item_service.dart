import 'package:flutter_testes_introduction/item.dart';
import 'package:flutter_testes_introduction/item_repository.dart';

class ItemService {
  final ItemRepository repository;

  ItemService({required this.repository});

  Future<List<Item>> getAll() => repository.getAll();

  List<Item> getAllSync() => repository.getAllSync();

  Item getByName(String name) => repository.getByName(name);
}
