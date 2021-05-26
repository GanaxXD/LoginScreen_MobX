// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoListStore on _ToDoListStore, Store {
  Computed<bool> _$isNewToDoFullComputed;

  @override
  bool get isNewToDoFull =>
      (_$isNewToDoFullComputed ??= Computed<bool>(() => super.isNewToDoFull,
              name: '_ToDoListStore.isNewToDoFull'))
          .value;

  final _$newToDoAtom = Atom(name: '_ToDoListStore.newToDo');

  @override
  String get newToDo {
    _$newToDoAtom.reportRead();
    return super.newToDo;
  }

  @override
  set newToDo(String value) {
    _$newToDoAtom.reportWrite(value, super.newToDo, () {
      super.newToDo = value;
    });
  }

  final _$_ToDoListStoreActionController =
      ActionController(name: '_ToDoListStore');

  @override
  void setNewToDo(String value) {
    final _$actionInfo = _$_ToDoListStoreActionController.startAction(
        name: '_ToDoListStore.setNewToDo');
    try {
      return super.setNewToDo(value);
    } finally {
      _$_ToDoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void newElement() {
    final _$actionInfo = _$_ToDoListStoreActionController.startAction(
        name: '_ToDoListStore.newElement');
    try {
      return super.newElement();
    } finally {
      _$_ToDoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newToDo: ${newToDo},
isNewToDoFull: ${isNewToDoFull}
    ''';
  }
}
