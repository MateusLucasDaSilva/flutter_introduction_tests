import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_introduction/item.dart';
import 'package:flutter_testes_introduction/item_repository.dart';
import 'package:flutter_testes_introduction/item_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'item_service_test.mocks.dart';

@GenerateMocks(<Type>[ItemRepository])
void main() {
  late ItemService service;
  final ItemRepository mokeRepository = MockItemRepository();

  setUp(
    () {
      service = ItemService(repository: mokeRepository);
    },
  );

  test('fazendo a chamada buscar todos', () async {
    final Item item = Item(name: 'Celular', value: 2000);
    when(service.getAll()).thenAnswer(
      (_) async => <Item>[item],
    );

    final List<Item> result = await service.getAll();

    expect(result, isList);
    expect(result, isNotEmpty);
    expect(result, contains(item));
  });
  test('deve retornar uma exception quando chamar buscar todos', () async {
    when(service.getAll()).thenThrow(Exception());

    final Future<List<Item>> Function() call = service.getAll;

    expect(() async => await call(), throwsException);
  });
  test('deve retornar um item através do nome', () async {
    when(service.getByName('arroz')).thenReturn(Item(name: 'arroz', value: 5));

    /// O PARÂMETRO PASSADO NO MÉTODO DEVE SER IGUAL AO DO WHEN
    final Item result = service.getByName('arroz');

    expect(result, isNotNull);
    expect(result.value, 5);
  });
  test('deve retornar um item através do nome passando qualquer parâmetro',
      () async {
    when(service.getByName('arroz')).thenReturn(Item(name: 'arroz', value: 5));

    /// O PARÂMETRO PASSADO NO MÉTODO DEVE SER IGUAL AO DO WHEN
    final Item result = service.getByName('arroz');

    expect(result, isNotNull);
    expect(result.value, 5);
  });
  test('deve verificar se o repository esta sendo chamado', () async {
    when(service.getByName('arroz')).thenReturn(Item(name: 'arroz', value: 5));

    /// O PARÂMETRO PASSADO NO MÉTODO DEVE SER IGUAL AO DO WHEN
    final Item result = service.getByName('arroz');

    /// O PARÂMETRO PASSADO NO MÉTODO DEVE SER IGUAL AO DO WHEN
    verify(mokeRepository.getByName('arroz')).called(1);
    expect(result, isNotNull);
  });
}
