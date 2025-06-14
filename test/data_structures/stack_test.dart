import 'package:dsa_dart/data_structures/list/stack/stack.dart';
import 'package:test/test.dart';

void main() {
  group('Stack Tests', () {
    test('Push and Pop follow LIFO', () {
      final stack = Stack<String>();
      stack.push("A");
      stack.push("B");
      expect(stack.pop(), "B");
      expect(stack.pop(), "A");
    });

    test('Peek returns top without removing', () {
      final stack = Stack<int>();
      stack.push(5);
      stack.push(7);
      expect(stack.peek(), 7);
      expect(stack.size(), 2);
    });

    test('isEmpty reflects correct status', () {
      final stack = Stack<double>();
      expect(stack.isEmpty(), true);
      stack.push(3.14);
      expect(stack.isEmpty(), false);
    });

    test('Clear empties the stack', () {
      final stack = Stack<bool>();
      stack.push(true);
      stack.push(false);
      stack.clear();
      expect(stack.size(), 0);
      expect(stack.isEmpty(), true);
    });

    test('Pop from empty returns null', () {
      final stack = Stack<int>();
      expect(stack.pop(), null);
    });
  });
}
