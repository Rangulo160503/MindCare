import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityPostsRecord extends FirestoreRecord {
  CommunityPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "anonymous" field.
  bool? _anonymous;
  bool get anonymous => _anonymous ?? false;
  bool hasAnonymous() => _anonymous != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _anonymous = snapshotData['anonymous'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('community_posts');

  static Stream<CommunityPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityPostsRecord.fromSnapshot(s));

  static Future<CommunityPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityPostsRecord.fromSnapshot(s));

  static CommunityPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityPostsRecordData({
  String? content,
  String? userId,
  DateTime? timestamp,
  bool? anonymous,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'user_id': userId,
      'timestamp': timestamp,
      'anonymous': anonymous,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityPostsRecordDocumentEquality
    implements Equality<CommunityPostsRecord> {
  const CommunityPostsRecordDocumentEquality();

  @override
  bool equals(CommunityPostsRecord? e1, CommunityPostsRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.userId == e2?.userId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.anonymous == e2?.anonymous;
  }

  @override
  int hash(CommunityPostsRecord? e) => const ListEquality()
      .hash([e?.content, e?.userId, e?.timestamp, e?.anonymous]);

  @override
  bool isValidKey(Object? o) => o is CommunityPostsRecord;
}
