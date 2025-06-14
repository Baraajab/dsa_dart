class CircularNode<T> {
  T data;
  CircularNode<T>? next;

  CircularNode(this.data);
}

class CircularLinkedList<T> {
  CircularNode<T>? _last;
  int _count = 0;

  void insert(T data) {
    final newNode = CircularNode<T>(data);
    if (_last == null) {
      _last = newNode;
      _last!.next = _last;
    } else {
      newNode.next = _last!.next;
      _last!.next = newNode;
      _last = newNode;
    }
    _count++;
  }

  bool delete(T data) {
    if (_last == null) return false;

    CircularNode<T>? curr = _last!.next;
    CircularNode<T>? prev = _last;

    do {
      if (curr!.data == data) {
        if (curr == _last && curr == _last!.next) {
          _last = null;
        } else {
          prev!.next = curr.next;
          if (curr == _last) _last = prev;
        }
        _count--;
        return true;
      }
      prev = curr;
      curr = curr.next;
    } while (curr != _last!.next);

    return false;
  }

  bool contains(T data) {
    if (_last == null) return false;
    CircularNode<T>? temp = _last!.next;

    do {
      if (temp!.data == data) return true;
      temp = temp.next;
    } while (temp != _last!.next);

    return false;
  }

  T? getAt(int index) {
    if (_last == null || index < 0 || index >= _count) return null;
    CircularNode<T>? temp = _last!.next;
    for (int i = 0; i < index; i++) {
      temp = temp!.next;
    }
    return temp?.data;
  }

  void printList() {
    if (_last == null) {
      print("List is empty.");
      return;
    }

    CircularNode<T>? temp = _last!.next;
    do {
      print(temp!.data);
      temp = temp.next;
    } while (temp != _last!.next);
  }

  int length() => _count;
}
