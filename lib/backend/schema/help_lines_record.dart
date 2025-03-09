import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HelpLinesRecord extends FirestoreRecord {
  HelpLinesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "message_option" field.
  List<String>? _messageOption;
  List<String> get messageOption => _messageOption ?? const [];
  bool hasMessageOption() => _messageOption != null;

  void _initializeFields() {
    _country = snapshotData['country'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _serviceName = snapshotData['service_name'] as String?;
    _messageOption = getDataList(snapshotData['message_option']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('help_lines');

  static Stream<HelpLinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HelpLinesRecord.fromSnapshot(s));

  static Future<HelpLinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HelpLinesRecord.fromSnapshot(s));

  static HelpLinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HelpLinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HelpLinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HelpLinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HelpLinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HelpLinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHelpLinesRecordData({
  String? country,
  String? phoneNumber,
  String? serviceName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'country': country,
      'phone_number': phoneNumber,
      'service_name': serviceName,
    }.withoutNulls,
  );

  return firestoreData;
}

class HelpLinesRecordDocumentEquality implements Equality<HelpLinesRecord> {
  const HelpLinesRecordDocumentEquality();

  @override
  bool equals(HelpLinesRecord? e1, HelpLinesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.country == e2?.country &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.serviceName == e2?.serviceName &&
        listEquality.equals(e1?.messageOption, e2?.messageOption);
  }

  @override
  int hash(HelpLinesRecord? e) => const ListEquality()
      .hash([e?.country, e?.phoneNumber, e?.serviceName, e?.messageOption]);

  @override
  bool isValidKey(Object? o) => o is HelpLinesRecord;
}
