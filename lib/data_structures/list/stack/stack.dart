class Stack<T> {
  final List<T> _items = [];

  void push(T data) {
    _items.add(data);
  }

  T? pop() {
    if (_items.isEmpty) return null;
    return _items.removeLast();
  }

  T? peek() {
    if (_items.isEmpty) return null;
    return _items.last;
  }

  bool isEmpty() => _items.isEmpty;

  int size() => _items.length;

  void clear() => _items.clear();
}
