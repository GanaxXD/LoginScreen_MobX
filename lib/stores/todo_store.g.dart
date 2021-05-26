// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoStore on _ToDoStore, Store {
  Computed<bool> _$isNewToDoFullComputed;

  @override
  bool get isNewToDoFull =>
      (_$isNewToDoFullComputed ??= Computed<bool>(() => super.isNewToDoFull,
              name: '_ToDoStore.isNewToDoFull'))
          .value;

  final _$newToDoAtom = Atom(name: '_ToDoStore.newToDo');

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

  final _$_ToDoStoreActionController = ActionController(name: '_ToDoStore');

  @override
  void setNewToDo(String value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.setNewToDo');
    try {
      return super.setNewToDo(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void newElement(String value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.newElement');
    try {
      return super.newElement(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
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
