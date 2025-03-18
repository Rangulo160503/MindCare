import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodTrackingRecord extends FirestoreRecord {
  MoodTrackingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  bool hasMood() => _mood != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _mood = snapshotData['mood'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_tracking');

  static Stream<MoodTrackingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodTrackingRecord.fromSnapshot(s));

  static Future<MoodTrackingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodTrackingRecord.fromSnapshot(s));

  static MoodTrackingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodTrackingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodTrackingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodTrackingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodTrackingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodTrackingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodTrackingRecordData({
  String? userId,
  String? mood,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'mood': mood,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodTrackingRecordDocumentEquality
    implements Equality<MoodTrackingRecord> {
  const MoodTrackingRecordDocumentEquality();

  @override
  bool equals(MoodTrackingRecord? e1, MoodTrackingRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.mood == e2?.mood &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(MoodTrackingRecord? e) =>
      const ListEquality().hash([e?.userId, e?.mood, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is MoodTrackingRecord;
}
