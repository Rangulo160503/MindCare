import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmotionalTrendsRecord extends FirestoreRecord {
  EmotionalTrendsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "emotion" field.
  String? _emotion;
  String get emotion => _emotion ?? '';
  bool hasEmotion() => _emotion != null;

  // "intensity" field.
  int? _intensity;
  int get intensity => _intensity ?? 0;
  bool hasIntensity() => _intensity != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _emotion = snapshotData['emotion'] as String?;
    _intensity = castToType<int>(snapshotData['intensity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emotional_trends');

  static Stream<EmotionalTrendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmotionalTrendsRecord.fromSnapshot(s));

  static Future<EmotionalTrendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmotionalTrendsRecord.fromSnapshot(s));

  static EmotionalTrendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmotionalTrendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmotionalTrendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmotionalTrendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmotionalTrendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmotionalTrendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmotionalTrendsRecordData({
  String? userId,
  DateTime? date,
  String? emotion,
  int? intensity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'date': date,
      'emotion': emotion,
      'intensity': intensity,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmotionalTrendsRecordDocumentEquality
    implements Equality<EmotionalTrendsRecord> {
  const EmotionalTrendsRecordDocumentEquality();

  @override
  bool equals(EmotionalTrendsRecord? e1, EmotionalTrendsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.emotion == e2?.emotion &&
        e1?.intensity == e2?.intensity;
  }

  @override
  int hash(EmotionalTrendsRecord? e) =>
      const ListEquality().hash([e?.userId, e?.date, e?.emotion, e?.intensity]);

  @override
  bool isValidKey(Object? o) => o is EmotionalTrendsRecord;
}
