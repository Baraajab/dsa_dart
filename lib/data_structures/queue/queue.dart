class QueueNode<T> {
  T value;
  QueueNode<T>? next;

  QueueNode(this.value);
}

class Queue<T> {
  QueueNode<T>? _front;
  QueueNode<T>? _rear;
  int _count = 0;

  void enqueue(T data) {
    final newNode = QueueNode(data);
    if (_rear == null) {
      _front = _rear = newNode;
    } else {
      _rear!.next = newNode;
      _rear = newNode;
    }
    _count++;
  }

  T? dequeue() {
    if (_front == null) return null;

    final value = _front!.value;
    _front = _front!.next;

    if (_front == null) {
      _rear = null;
    }

    _count--;
    return value;
  }

  T? front() => _front?.value;

  bool isEmpty() => _front == null;

  int size() => _count;

  void clear() {
    _front = _rear = null;
    _count = 0;
  }
}
