import 'package:dsa_dart/data_structures/list/circular_linked_list/circular_linked_list.dart';

void main() {
  final list = CircularLinkedList<int>();

  list.insert(10);
  list.insert(20);
  list.insert(30);

  print("List contents:");
  list.printList();

  print("Contains 20? ${list.contains(20)}"); // true
  print("Get at index 1: ${list.getAt(1)}"); // 20

  print("Deleting 20...");
  list.delete(20);
  list.printList();

  print("Length: ${list.length()}");
}
