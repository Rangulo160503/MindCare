import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodEntriesRecord extends FirestoreRecord {
  MoodEntriesRecord._(
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

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _mood = snapshotData['mood'] as String?;
    _note = snapshotData['note'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mood_entries');

  static Stream<MoodEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodEntriesRecord.fromSnapshot(s));

  static Future<MoodEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodEntriesRecord.fromSnapshot(s));

  static MoodEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoodEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodEntriesRecordData({
  String? userId,
  String? mood,
  String? note,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'mood': mood,
      'note': note,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodEntriesRecordDocumentEquality implements Equality<MoodEntriesRecord> {
  const MoodEntriesRecordDocumentEquality();

  @override
  bool equals(MoodEntriesRecord? e1, MoodEntriesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.mood == e2?.mood &&
        e1?.note == e2?.note &&
        e1?.date == e2?.date;
  }

  @override
  int hash(MoodEntriesRecord? e) =>
      const ListEquality().hash([e?.userId, e?.mood, e?.note, e?.date]);

  @override
  bool isValidKey(Object? o) => o is MoodEntriesRecord;
}
