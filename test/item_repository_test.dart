import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_introduction/item.dart';
import 'package:flutter_testes_introduction/item_repository.dart';

void main() {
  group('Teste repository real', () {
    test('Testar buscar todos async forma 1', () async {
      ///PREPARAÇÃO
      final ItemRepositoryImpl repository = ItemRepositoryImpl();

      ///AÇÃO/EXECUÇÃO
      final List<Item> items = await repository.getAll();

      ///VALIDAÇÃO
      expect(items, isA<List<Item>>());
      expect(items, isNotEmpty);
    });
    test('Testar buscar todos async forma 2', () {
      ///PREPARAÇÃO
      final ItemRepositoryImpl repository = ItemRepositoryImpl();

      ///AÇÃO/EXECUÇÃO
      final Future<List<Item>> Function() getAll = repository.getAll;

      ///VALIDAÇÃO

      expect(getAll(), completion(isNotEmpty));
    });
    test('BUscar item por nome', () {
      ///PREPARAÇÃO
      final ItemRepositoryImpl repository = ItemRepositoryImpl();

      ///AÇÃO/EXECUÇÃO
      final Item item = repository.getByName('Feijão');

      ///VALIDAÇÃO

      expect(
        item.name,
        allOf(
          <Object>[
            'Feijão',
            isA<String>(),
          ],
        ),
      );
    });
  });
}
