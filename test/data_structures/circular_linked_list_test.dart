import 'package:dsa_dart/data_structures/list/circular_linked_list/circular_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('CircularLinkedList Tests', () {
    test('Insert and cycle check', () {
      final list = CircularLinkedList<String>();
      list.insert("A");
      list.insert("B");
      list.insert("C");
      expect(list.length(), 3);
      expect(list.contains("B"), true);
    });

    test('GetAt returns correct values', () {
      final list = CircularLinkedList<int>();
      list.insert(1);
      list.insert(2);
      list.insert(3);
      expect(list.getAt(0), 1);
      expect(list.getAt(2), 3);
    });

    test('Delete and circular integrity', () {
      final list = CircularLinkedList<int>();
      list.insert(5);
      list.insert(10);
      list.insert(15);
      expect(list.delete(10), true);
      expect(list.contains(10), false);
      expect(list.length(), 2);
    });

    test('Traversal only loops once', () {
      final list = CircularLinkedList<int>();
      list.insert(1);
      list.insert(2);
      list.insert(3);

      var counter = 0;
      var current = list.getAt(0);
      do {
        current = list.getAt(counter);
        counter++;
      } while (counter < list.length());

      expect(counter, 3);
    });

    test('Edge cases: empty list', () {
      final list = CircularLinkedList<int>();
      expect(list.getAt(0), null);
      expect(list.contains(1), false);
      expect(list.delete(1), false);
    });

    test('Delete all nodes', () {
      final list = CircularLinkedList<int>();
      list.insert(1);
      list.delete(1);
      expect(list.length(), 0);
      expect(list.contains(1), false);
    });
  });
}
