import '../../../lib/data_structures/list/linked_list/linked_list.dart';

void main() {
  LinkedList<int> intList = LinkedList<int>();

  intList.add(10);
  intList.add(20);
  intList.add(30);

  print(intList);

  intList.insert(1, 15);
  print(intList);

  int removed = intList.removeAt(2);
  print('Removed: $removed');
  print(intList);

  print(intList.contains(15));
  print(intList.contains(50));

  print(intList.indexOf(30));

  print(intList[1]);

  intList[1] = 17;
  print(intList);

  LinkedList<String> stringList = intList.map((num) => 'Number $num');
  print(stringList);

  LinkedList<int> filteredList = intList.where((x) => x > 15);
  print(filteredList);

  LinkedList<int> anotherList = LinkedList<int>();
  anotherList.add(40);
  anotherList.add(50);

  LinkedList<int> combined = intList + anotherList;
  print(combined);

  LinkedList<int> removedList = combined - 30;
  print(removedList);

  print("Elements:");
  combined.forEach((x) => print(x));

  intList.clear();
  print(intList);
}
