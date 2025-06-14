class DoublyNode<T> {
  T data;
  DoublyNode<T>? next;
  DoublyNode<T>? prev;

  DoublyNode(this.data);
}

class DoublyLinkedList<T> {
  DoublyNode<T>? head;
  DoublyNode<T>? tail;
  int _length = 0;

  void insertAtHead(T data) {
    final newNode = DoublyNode<T>(data);

    if (head == null) {
      head = tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    _length++;
  }

  void insertAtTail(T data) {
    final newNode = DoublyNode<T>(data);

    if (tail == null) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    _length++;
  }

  void insertAt(int index, T data) {
    if (index < 0 || index > _length) {
      throw RangeError("Index out of bounds");
    }
    if (index == 0) {
      insertAtHead(data);
      return;
    }
    if (index == _length) {
      insertAtTail(data);
      return;
    }

    final newNode = DoublyNode<T>(data);
    DoublyNode<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }

    newNode.next = current;
    newNode.prev = current!.prev;
    current.prev?.next = newNode;
    current.prev = newNode;

    _length++;
  }

  bool delete(T data) {
    if (head == null) return false;

    DoublyNode<T>? current = head;

    while (current != null) {
      if (current.data == data) {
        if (current.prev == null) {
          head = current.next;
          if (head != null) {
            head!.prev = null;
          }
        } else if (current.next == null) {
          tail = current.prev;
          tail!.next = null;
        } else {
          current.prev!.next = current.next;
          current.next!.prev = current.prev;
        }
        _length--;
        return true;
      }
      current = current.next;
    }
    return false;
  }

  T? getAt(int index) {
    if (index < 0 || index >= _length) {
      return null;
    }

    DoublyNode<T>? current = head;
    for (int i = 0; i < index; i++) {
      current = current!.next;
    }
    return current!.data;
  }

  bool contains(T data) {
    DoublyNode<T>? current = head;
    while (current != null) {
      if (current.data == data) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void printForward() {
    DoublyNode<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void printBackward() {
    DoublyNode<T>? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  int length() {
    return _length;
  }
}
