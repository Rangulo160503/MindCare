import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnonymousPostsRecord extends FirestoreRecord {
  AnonymousPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_anonymous" field.
  bool? _isAnonymous;
  bool get isAnonymous => _isAnonymous ?? false;
  bool hasIsAnonymous() => _isAnonymous != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isAnonymous = snapshotData['is_anonymous'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anonymous_posts');

  static Stream<AnonymousPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnonymousPostsRecord.fromSnapshot(s));

  static Future<AnonymousPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnonymousPostsRecord.fromSnapshot(s));

  static AnonymousPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnonymousPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnonymousPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnonymousPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnonymousPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnonymousPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnonymousPostsRecordData({
  String? userId,
  String? text,
  DateTime? timestamp,
  bool? isAnonymous,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'text': text,
      'timestamp': timestamp,
      'is_anonymous': isAnonymous,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnonymousPostsRecordDocumentEquality
    implements Equality<AnonymousPostsRecord> {
  const AnonymousPostsRecordDocumentEquality();

  @override
  bool equals(AnonymousPostsRecord? e1, AnonymousPostsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isAnonymous == e2?.isAnonymous;
  }

  @override
  int hash(AnonymousPostsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.text, e?.timestamp, e?.isAnonymous]);

  @override
  bool isValidKey(Object? o) => o is AnonymousPostsRecord;
}
