import 'package:dsa_dart/data_structures/list/stack/stack.dart';

void main() {
  final stack = Stack<int>();

  stack.push(10);
  stack.push(20);
  print("Top element: ${stack.peek()}");
  print("Popped: ${stack.pop()}");
  print("Size: ${stack.size()}");
  stack.clear();
  print("Is empty after clear? ${stack.isEmpty()}");
}
