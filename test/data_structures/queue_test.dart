import 'package:test/test.dart';
import 'package:dsa_dart/data_structures/list/queue/queue.dart';

void main() {
  group('Queue Tests', () {
    test('FIFO order is preserved', () {
      final queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);

      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), 2);
      expect(queue.dequeue(), 3);
    });

    test('Front returns the correct element without removal', () {
      final queue = Queue<String>();
      queue.enqueue("A");
      expect(queue.front(), "A");
      expect(queue.size(), 1);
    });

    test('Dequeue from empty returns null', () {
      final queue = Queue<double>();
      expect(queue.dequeue(), null);
    });

    test('Clear resets the queue', () {
      final queue = Queue<bool>();
      queue.enqueue(true);
      queue.enqueue(false);
      queue.clear();
      expect(queue.isEmpty(), true);
      expect(queue.size(), 0);
    });

    test('Size tracks correctly', () {
      final queue = Queue<int>();
      expect(queue.size(), 0);
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.size(), 2);
      queue.dequeue();
      expect(queue.size(), 1);
    });
  });
}
