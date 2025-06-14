import 'package:test/test.dart';
import '../../lib/data_structures/list/doubly_linked_list/doubly_linked_list.dart';

void main() {
  group('DoublyLinkedList Tests', () {
    final list = DoublyLinkedList<int>();

    test('Insert and verify order', () {
      list.insertAtHead(10);
      list.insertAtTail(20);
      list.insertAt(1, 15);

      expect(list.getAt(0), equals(10));
      expect(list.getAt(1), equals(15));
      expect(list.getAt(2), equals(20));
    });

    test('Delete and verify contents', () {
      list.delete(15);
      expect(list.getAt(1), equals(20));
      expect(list.contains(15), isFalse);
    });

    test('Length correctness', () {
      expect(list.length(), equals(2));
      list.insertAtHead(5);
      expect(list.length(), equals(3));
    });

    test('Forward/backward print matches expected order', () {
      list.printForward();
      list.printBackward();
    });

    test('Boundary checks', () {
      expect(list.getAt(5), isNull);
      expect(list.delete(99), isFalse);
    });
  });
}
