import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmergencyContactsRecord extends FirestoreRecord {
  EmergencyContactsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "relation" field.
  String? _relation;

  /// Mother, Father, Brother, Sister, etc
  String get relation => _relation ?? '';
  bool hasRelation() => _relation != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _name = snapshotData['name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _relation = snapshotData['relation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emergency_contacts');

  static Stream<EmergencyContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmergencyContactsRecord.fromSnapshot(s));

  static Future<EmergencyContactsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EmergencyContactsRecord.fromSnapshot(s));

  static EmergencyContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmergencyContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmergencyContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmergencyContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmergencyContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmergencyContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmergencyContactsRecordData({
  String? userId,
  String? name,
  String? phoneNumber,
  String? relation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'name': name,
      'phone_number': phoneNumber,
      'relation': relation,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmergencyContactsRecordDocumentEquality
    implements Equality<EmergencyContactsRecord> {
  const EmergencyContactsRecordDocumentEquality();

  @override
  bool equals(EmergencyContactsRecord? e1, EmergencyContactsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.relation == e2?.relation;
  }

  @override
  int hash(EmergencyContactsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.name, e?.phoneNumber, e?.relation]);

  @override
  bool isValidKey(Object? o) => o is EmergencyContactsRecord;
}
