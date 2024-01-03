class TaskModel {
  String? idCostumer;
  String? idSimcard;
  String? idSimcon;
  String? nfSimcon;
  String? idLine;
  String idIP;
  String? idSupplier;
  String? idSlot;
  String idObservations;
  String? supplierType;
  String? idPlan;
  String? idDateActi;
  String? idDateinsta;
  String? idApn;

  TaskModel({
    this.idCostumer,
    this.idSimcard,
    this.idSimcon,
    this.nfSimcon,
    this.idLine,
    this.idIP = "",
    this.idSupplier,
    this.idSlot,
    this.idObservations = "",
    this.supplierType,
    this.idPlan,
    this.idDateActi,
    this.idDateinsta,
    this.idApn,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      idCostumer: json["idCostumer"],
      idSimcard: json["idSimcard"],
      idSimcon: json["idSimcon"],
      nfSimcon: json["nfSimcon"],
      idLine: json["idLine"],
      idIP: json["idIP"],
      idSupplier: json["idSupplier"],
      idSlot: json["idSlot"],
      idObservations: json["idObservations"],
      supplierType: json["supplierType"],
      idPlan: json["idPlan"],
      idDateActi: json["idDateActi"],
      idDateinsta: json["idDateinsta"],
      idApn: json["idApn"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Client": idCostumer,
      "Iccid": idSimcard,
      "Simcon": idSimcon,
      "Nfsimcon": nfSimcon,
      "Msisdn": idLine,
      "Ip": idIP,
      "Supplier": idSupplier,
      "Slot": idSlot,
      "Obs": idObservations,
      "Operator": supplierType,
      "Plan": idPlan,
      "Activationdate": idDateActi,
      "Installationdate": idDateinsta,
      "Apn": idApn,
    };
  }
}

List<String> costumerList = [
  'Selecione um Cliente',
  'ILUMINA SP',
  'GUARULHOS LUZ'
];

List<String> NltPlan = ['300MB COMPARTILHADO', '600MB COMPARTILHADO'];

List<String> ArqiaPlan = ['IOT GO+ 300MB', 'IOT GO+ 600MB'];
