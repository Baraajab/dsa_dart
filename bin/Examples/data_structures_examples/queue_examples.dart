import 'package:dsa_dart/data_structures/queue/queue.dart';

void main() {
  final queue = Queue<String>();

  queue.enqueue("Apple");
  queue.enqueue("Banana");
  print("Front: ${queue.front()}"); // Apple
  print("Dequeued: ${queue.dequeue()}"); // Apple
  print("Size: ${queue.size()}"); // 1
  queue.clear();
  print("Is empty after clear? ${queue.isEmpty()}"); // true
}
