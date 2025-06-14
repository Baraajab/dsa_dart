class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);
}

class LinkedList<T> {
  Node<T>? head;
  int _length = 0;

  int get length => _length;

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

  void clear() {
    head = null;
    _length = 0;
  }

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

  LinkedList<T> operator +(LinkedList<T> other) {
    final result = LinkedList<T>();

    Node<T>? current = head;
    while (current != null) {
      result.add(current.data);
      current = current.next;
    }

    current = other.head;
    while (current != null) {
      result.add(current.data);
      current = current.next;
    }

    return result;
  }

  LinkedList<T> operator -(T value) {
    final result = LinkedList<T>();

    Node<T>? current = head;
    bool removed = false;

    while (current != null) {
      if (!removed && current.data == value) {
        removed = true;
      } else {
        result.add(current.data);
      }
      current = current.next;
    }

    return result;
  }

  void forEach(void Function(T) action) {
    Node<T>? current = head;
    while (current != null) {
      action(current.data);
      current = current.next;
    }
  }

  LinkedList<S> map<S>(S Function(T) transform) {
    final result = LinkedList<S>();
    Node<T>? current = head;

    while (current != null) {
      result.add(transform(current.data));
      current = current.next;
    }

    return result;
  }

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
