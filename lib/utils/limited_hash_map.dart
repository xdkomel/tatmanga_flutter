import 'dart:collection';
import 'fp.dart';

import 'package:fpdart/fpdart.dart';

class LimitedHashMap<K, T> {
  final HashMap<K, T> _hashMap = HashMap();
  final int maxSize;
  int _size = 0;

  LimitedHashMap(this.maxSize);

  Option<T> get(K key) => _hashMap[key].toOption(identity);

  void put(K key, T obj) {
    if (_hashMap.containsKey(key)) {
      _hashMap[key] = obj;
      return;
    }
    // The [key] was never met before
    if (_size >= maxSize) {
      _hashMap.keys.firstOption.map(_hashMap.remove);
      _hashMap[key] = obj;
      return;
    }
    // The HashMap is not full yet, so just add the obj
    _hashMap[key] = obj;
    _size += 1;
  }
}
