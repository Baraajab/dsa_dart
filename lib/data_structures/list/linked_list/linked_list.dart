/// Node class representing an element in the linked list.
class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);
}

/// A generic singly linked list class.
class LinkedList<T> {
  Node<T>? head;
  int _length = 0;

  /// Returns the number of elements in the list.
  int get length => _length;

  /// Adds [value] to the end of the list.
  void add(T value) {
    final newNode = Node<T>(value);

    if (head == null) {
      head = newNode;
    } else {
      Node<T> current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }

    _length++;
  }

  /// Inserts [value] at the given [index].
  void insert(int index, T value) {
    if (index < 0 || index > _length) {
      throw RangeError('Index out of bounds: $index');
    }

    final newNode = Node<T>(value);

    if (index == 0) {
      newNode.next = head;
      head = newNode;
    } else {
      Node<T> current = head!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      newNode.next = current.next;
      current.next = newNode;
    }

    _length++;
  }

  /// Removes and returns the element at [index].
  T removeAt(int index) {
    if (index < 0 || index >= _length || head == null) {
      throw RangeError('Index out of bounds: $index');
    }

    late T removedValue;

    if (index == 0) {
      removedValue = head!.data;
      head = head!.next;
    } else {
      Node<T> current = head!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }

      if (current.next == null) {
        throw StateError('Unexpected null node during removal');
      }

      removedValue = current.next!.data;
      current.next = current.next!.next;
    }

    _length--;
    return removedValue;
  }

  /// Returns `true` if [value] is found in the list.
  bool contains(T value) {
    Node<T>? current = head;
    while (current != null) {
      if (current.data == value) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  /// Returns the index of the first occurrence of [value],
  /// or -1 if not found.
  int indexOf(T value) {
    Node<T>? current = head;
    int index = 0;

    while (current != null) {
      if (current.data == value) {
        return index;
      }
      current = current.next;
      index++;
    }

    return -1;
  }

  /// Clears the entire list.
  void clear() {
    head = null;
    _length = 0;
  }

  /// Provides read access to element at [index].
  T operator [](int index) {
    if (index < 0 || index >= _length) {
      throw RangeError('Index out of bounds: $index');
    }

    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    return current!.data;
  }

  /// Provides write access to element at [index].
  void operator []=(int index, T value) {
    if (index < 0 || index >= _length) {
      throw RangeError('Index out of bounds: $index');
    }

    Node<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    current!.data = value;
  }

  /// Concatenates this list with [other] and returns a new list.
  LinkedList<T> operator +(LinkedList<T> other) {
    final result = LinkedList<T>();

    // Copy elements from this list
    Node<T>? current = head;
    while (current != null) {
      result.add(current.data);
      current = current.next;
    }

    // Copy elements from other list
    current = other.head;
    while (current != null) {
      result.add(current.data);
      current = current.next;
    }

    return result;
  }

  /// Returns a new list with the first occurrence of [value] removed.
  LinkedList<T> operator -(T value) {
    final result = LinkedList<T>();

    Node<T>? current = head;
    bool removed = false;

    while (current != null) {
      if (!removed && current.data == value) {
        // Skip this value (first occurrence only)
        removed = true;
      } else {
        result.add(current.data);
      }
      current = current.next;
    }

    return result;
  }

  /// Applies the given [action] to each element in the list.
  void forEach(void Function(T) action) {
    Node<T>? current = head;
    while (current != null) {
      action(current.data);
      current = current.next;
    }
  }

  /// Returns a new [LinkedList] containing the results of applying [transform] to each element.
  LinkedList<S> map<S>(S Function(T) transform) {
    final result = LinkedList<S>();
    Node<T>? current = head;

    while (current != null) {
      result.add(transform(current.data));
      current = current.next;
    }

    return result;
  }

  /// Returns a new [LinkedList] containing only the elements that satisfy [test].
  LinkedList<T> where(bool Function(T) test) {
    final result = LinkedList<T>();
    Node<T>? current = head;

    while (current != null) {
      if (test(current.data)) {
        result.add(current.data);
      }
      current = current.next;
    }

    return result;
  }

  @override
  String toString() {
    if (head == null) return 'LinkedList: []';

    final buffer = StringBuffer('LinkedList: [');
    Node<T>? current = head;

    while (current != null) {
      buffer.write(current.data);
      if (current.next != null) {
        buffer.write(', ');
      }
      current = current.next;
    }

    buffer.write(']');
    return buffer.toString();
  }
}
