import '../../../lib/data_structures/list/doubly_linked_list/doubly_linked_list.dart';

void main() {
  final list = DoublyLinkedList<int>();

  list.insertAtHead(10);
  list.insertAtTail(20);
  list.insertAtTail(30);

  print("List in forward order:");
  list.printForward();

  print("List in backward order:");
  list.printBackward();

  print("Element at index 1: ${list.getAt(1)}");

  print("Contains 20: ${list.contains(20)}");

  list.delete(20);

  print("List after deletion of 20:");
  list.printForward();

  print("List length: ${list.length()}");
}
