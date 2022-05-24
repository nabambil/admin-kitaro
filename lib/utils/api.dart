import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Api {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  final String path;
  late DatabaseReference ref;

  Api(this.path) {
    ref = _db.ref(path);
  }

  Future<DatabaseEvent> getDataCollection() {
    return ref.once();
  }

  Future<DatabaseEvent> getDataCollectionBy(String key, String value) {
    return ref.orderByChild(key).equalTo(value).once();
  }

  Future<DatabaseEvent> getDataCollectionByTest(String key, String value) {
    String currentDateandTime =
        DateFormat('dd MMM yyyy  hh:mm a').format(DateTime.now());
    var t = ref.orderByChild(key).equalTo(value);
    var u = t.orderByChild('datetime');
    var i = u.once();
    return i;
  }

  Stream<DatabaseEvent> streamDataCollection() {
    return ref.onValue;
  }

  Stream<DatabaseEvent> streamDataCollectionBy(String key, String value) {
    return ref.orderByChild(key).equalTo(value).onValue;
  }

  Future<void> removeDocument() {
    return ref.remove();
  }

  Future<String?> add(String id, Map data) async {
    final _action = ref.child(id);
    await _action.set(data);

    return _action.key;
  }

  Future<String?> addDocument(Map data) async {
    final _action = ref.push();
    return _action.set(data).then((_) => _action.key);
  }

  Future<void> updateDocument(Map<String, dynamic> data) {
    return ref.update(data);
  }
}
