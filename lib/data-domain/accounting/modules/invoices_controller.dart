import 'package:emekteb/core/base/models/base_model.dart';

class InvoicesController extends BaseModel<InvoicesController> {
  String? code;
  String? message;
  List<Result>? result;

  InvoicesController({this.code, this.message, this.result});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  InvoicesController fromJson(Map<String, dynamic> json) {
    return InvoicesController(
      code: json['code'],
      message: json['message'],
      result: json["result"] == null
          ? null
          : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  String? id;
  String? paymentDate;
  String? paidType;
  num? amount;
  Kassa? kassa;
  BankAccount? bankAccount;
  Currency? currency;
  Contract? contract;
  dynamic paymentNumber;

  Result(
      {this.id,
      this.paymentDate,
      this.paidType,
      this.amount,
      this.kassa,
      this.bankAccount,
      this.currency,
      this.contract,
      this.paymentNumber});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentDate = json['paymentDate'];
    paidType = json['paidType'];
    amount = json['amount'];
    kassa = json['kassa'] != null ? Kassa.fromJson(json['kassa']) : null;
    bankAccount = json['bankAccount'] != null
        ? BankAccount.fromJson(json['bankAccount'])
        : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    contract =
        json['contract'] != null ? Contract.fromJson(json['contract']) : null;
    paymentNumber = json['paymentNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paymentDate'] = paymentDate;
    data['paidType'] = paidType;
    data['amount'] = amount;
    if (kassa != null) {
      data['kassa'] = kassa!.toJson();
    }
    if (bankAccount != null) {
      data['bankAccount'] = bankAccount!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (contract != null) {
      data['contract'] = contract!.toJson();
    }
    data['paymentNumber'] = paymentNumber;
    return data;
  }
}

class Kassa {
  String? id;
  String? info;

  Kassa({this.id, this.info});

  Kassa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['info'] = info;
    return data;
  }
}

class BankAccount {
  String? id;
  String? bankAccount;
  Currency? currency;
  Bank? bank;

  BankAccount({this.id, this.bankAccount, this.currency, this.bank});

  BankAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankAccount = json['bankAccount'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankAccount'] = bankAccount;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    return data;
  }
}

class Currency {
  String? id;
  String? isoCode;
  String? info;
  String? coin;

  Currency({this.id, this.isoCode, this.info, this.coin});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isoCode = json['isoCode'];
    info = json['info'];
    coin = json['coin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isoCode'] = isoCode;
    data['info'] = info;
    data['coin'] = coin;
    return data;
  }
}

class Bank {
  String? id;
  String? info;
  String? muxbirHesab;
  String? branchCode;
  String? voen;
  String? iban;
  String? swift;
  String? city;
  String? address;
  String? phone;

  Bank(
      {this.id,
      this.info,
      this.muxbirHesab,
      this.branchCode,
      this.voen,
      this.iban,
      this.swift,
      this.city,
      this.address,
      this.phone});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'];
    muxbirHesab = json['muxbirHesab'];
    branchCode = json['branchCode'];
    voen = json['voen'];
    iban = json['iban'];
    swift = json['swift'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['info'] = info;
    data['muxbirHesab'] = muxbirHesab;
    data['branchCode'] = branchCode;
    data['voen'] = voen;
    data['iban'] = iban;
    data['swift'] = swift;
    data['city'] = city;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}

class Contract {
  String? id;
  String? contractNumber;
  String? info;
  String? createdDate;
  String? contractDate;
  ContractType? contractType;
  Branch? branch;
  AgreementSide? agreementSide;
  ContractPredimet? contractPredimet;
  ContractPaymentOrder? contractPaymentOrder;
  dynamic contractCancelled;

  Contract(
      {this.id,
      this.contractNumber,
      this.info,
      this.createdDate,
      this.contractDate,
      this.contractType,
      this.branch,
      this.agreementSide,
      this.contractPredimet,
      this.contractPaymentOrder,
      this.contractCancelled});

  Contract.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractNumber = json['contractNumber'];
    info = json['info'];
    createdDate = json['createdDate'];
    contractDate = json['contractDate'];
    contractType = json['contractType'] != null
        ? ContractType.fromJson(json['contractType'])
        : null;
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    agreementSide = json['agreementSide'] != null
        ? AgreementSide.fromJson(json['agreementSide'])
        : null;
    contractPredimet = json['contractPredimet'] != null
        ? ContractPredimet.fromJson(json['contractPredimet'])
        : null;
    contractPaymentOrder = json['contractPaymentOrder'] != null
        ? ContractPaymentOrder.fromJson(json['contractPaymentOrder'])
        : null;
    contractCancelled = json['contractCancelled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contractNumber'] = contractNumber;
    data['info'] = info;
    data['createdDate'] = createdDate;
    data['contractDate'] = contractDate;
    if (contractType != null) {
      data['contractType'] = contractType!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (agreementSide != null) {
      data['agreementSide'] = agreementSide!.toJson();
    }
    if (contractPredimet != null) {
      data['contractPredimet'] = contractPredimet!.toJson();
    }
    if (contractPaymentOrder != null) {
      data['contractPaymentOrder'] = contractPaymentOrder!.toJson();
    }
    data['contractCancelled'] = contractCancelled;
    return data;
  }
}

class ContractType {
  String? id;
  dynamic contractType;
  String? info;
  String? predimet;
  String? agreementSide;
  String? category;
  String? paymentLogic;
  bool? editable;
  bool? paymentTypeCash;
  bool? paymentTypeLoan;
  String? prefix;
  bool? serviceContract;

  ContractType(
      {this.id,
      this.contractType,
      this.info,
      this.predimet,
      this.agreementSide,
      this.category,
      this.paymentLogic,
      this.editable,
      this.paymentTypeCash,
      this.paymentTypeLoan,
      this.prefix,
      this.serviceContract});

  ContractType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contractType'];
    info = json['info'];
    predimet = json['predimet'];
    agreementSide = json['agreementSide'];
    category = json['category'];
    paymentLogic = json['paymentLogic'];
    editable = json['editable'];
    paymentTypeCash = json['paymentTypeCash'];
    paymentTypeLoan = json['paymentTypeLoan'];
    prefix = json['prefix'];
    serviceContract = json['serviceContract'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contractType'] = contractType;
    data['info'] = info;
    data['predimet'] = predimet;
    data['agreementSide'] = agreementSide;
    data['category'] = category;
    data['paymentLogic'] = paymentLogic;
    data['editable'] = editable;
    data['paymentTypeCash'] = paymentTypeCash;
    data['paymentTypeLoan'] = paymentTypeLoan;
    data['prefix'] = prefix;
    data['serviceContract'] = serviceContract;
    return data;
  }
}

class Branch {
  String? id;
  String? info;
  String? adress;
  String? webPage;
  String? email;
  String? phone1;
  String? phone2;
  String? fax1;
  String? fax2;
  String? mob1;
  String? mob2;
  String? prefix;

  Branch(
      {this.id,
      this.info,
      this.adress,
      this.webPage,
      this.email,
      this.phone1,
      this.phone2,
      this.fax1,
      this.fax2,
      this.mob1,
      this.mob2,
      this.prefix});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'];
    adress = json['adress'];
    webPage = json['webPage'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    fax1 = json['fax1'];
    fax2 = json['fax2'];
    mob1 = json['mob1'];
    mob2 = json['mob2'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['info'] = info;
    data['adress'] = adress;
    data['webPage'] = webPage;
    data['email'] = email;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['fax1'] = fax1;
    data['fax2'] = fax2;
    data['mob1'] = mob1;
    data['mob2'] = mob2;
    data['prefix'] = prefix;
    return data;
  }
}

class AgreementSide {
  String? id;
  String? agreementSideType;
  Customer? customer;
  dynamic phone1;
  dynamic phone2;
  dynamic fax1;
  dynamic fax2;
  dynamic mob1Prefix;
  dynamic mob1;
  dynamic mob2Prefix;
  dynamic mob2;

  AgreementSide(
      {this.id,
      this.agreementSideType,
      this.customer,
      this.phone1,
      this.phone2,
      this.fax1,
      this.fax2,
      this.mob1Prefix,
      this.mob1,
      this.mob2Prefix,
      this.mob2});

  AgreementSide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agreementSideType = json['agreementSideType'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    fax1 = json['fax1'];
    fax2 = json['fax2'];
    mob1Prefix = json['mob1Prefix'];
    mob1 = json['mob1'];
    mob2Prefix = json['mob2Prefix'];
    mob2 = json['mob2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agreementSideType'] = agreementSideType;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['fax1'] = fax1;
    data['fax2'] = fax2;
    data['mob1Prefix'] = mob1Prefix;
    data['mob1'] = mob1;
    data['mob2Prefix'] = mob2Prefix;
    data['mob2'] = mob2;
    return data;
  }
}

class Customer {
  String? id;
  String? secondName;
  String? firstName;
  String? fatherName;
  dynamic matherName;
  Gender? gender;
  dynamic customerDocument;
  String? dob;
  dynamic email;
  dynamic mob1;
  dynamic mob2;
  String? fullName;

  Customer(
      {this.id,
      this.secondName,
      this.firstName,
      this.fatherName,
      this.matherName,
      this.gender,
      this.customerDocument,
      this.dob,
      this.email,
      this.mob1,
      this.mob2,
      this.fullName});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    secondName = json['secondName'];
    firstName = json['firstName'];
    fatherName = json['fatherName'];
    matherName = json['matherName'];
    gender = json['gender'] != null ? Gender.fromJson(json['gender']) : null;
    customerDocument = json['customerDocument'];
    dob = json['dob'];
    email = json['email'];
    mob1 = json['mob1'];
    mob2 = json['mob2'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['secondName'] = secondName;
    data['firstName'] = firstName;
    data['fatherName'] = fatherName;
    data['matherName'] = matherName;
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    data['customerDocument'] = customerDocument;
    data['dob'] = dob;
    data['email'] = email;
    data['mob1'] = mob1;
    data['mob2'] = mob2;
    data['fullName'] = fullName;
    return data;
  }
}

class Gender {
  int? id;
  String? info;

  Gender({this.id, this.info});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['info'] = info;
    return data;
  }
}

class ContractPredimet {
  String? id;
  String? predimetType;
  String? predimetId;
  List<Parametrs>? parametrs;

  ContractPredimet(
      {this.id, this.predimetType, this.predimetId, this.parametrs});

  ContractPredimet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    predimetType = json['predimetType'];
    predimetId = json['predimetId'];
    if (json['parametrs'] != null) {
      parametrs = <Parametrs>[];
      json['parametrs'].forEach((v) {
        parametrs!.add(Parametrs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['predimetType'] = predimetType;
    data['predimetId'] = predimetId;
    if (parametrs != null) {
      data['parametrs'] = parametrs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parametrs {
  String? indeks;
  String? value;

  Parametrs({this.indeks, this.value});

  Parametrs.fromJson(Map<String, dynamic> json) {
    indeks = json['indeks'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['indeks'] = indeks;
    data['value'] = value;
    return data;
  }
}

class ContractPaymentOrder {
  String? id;
  num? initialAmount;
  num? initialAmountPercent;
  num? totalAmount;
  num? totalValue;
  num? discount;
  num? discountMonth;
  num? loanPercent;
  num? totalCapital;
  num? totalInterest;
  num? totalBalance;
  num? totalPaymentAmount;
  num? totalPaymentPercent;
  num? totalDeptAmount;
  num? totalDeptPercent;
  dynamic expireDate;
  num? lastPaymentAmount;
  String? lastPaymentDate;
  num? monthlyPayment;
  Kassa? paymentType;
  Currency? currency;
  num? offerMonth;
  dynamic offerDate;
  dynamic offerEndDate;
  List<ContractPaymentOrderLine>? contractPaymentOrderLine;

  ContractPaymentOrder(
      {this.id,
      this.initialAmount,
      this.initialAmountPercent,
      this.totalAmount,
      this.totalValue,
      this.discount,
      this.discountMonth,
      this.loanPercent,
      this.totalCapital,
      this.totalInterest,
      this.totalBalance,
      this.totalPaymentAmount,
      this.totalPaymentPercent,
      this.totalDeptAmount,
      this.totalDeptPercent,
      this.expireDate,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.monthlyPayment,
      this.paymentType,
      this.currency,
      this.offerMonth,
      this.offerDate,
      this.offerEndDate,
      this.contractPaymentOrderLine});

  ContractPaymentOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    initialAmount = json['initialAmount'];
    initialAmountPercent = json['initialAmountPercent'];
    totalAmount = json['totalAmount'];
    totalValue = json['totalValue'];
    discount = json['discount'];
    discountMonth = json['discountMonth'];
    loanPercent = json['loanPercent'];
    totalCapital = json['totalCapital'];
    totalInterest = json['totalInterest'];
    totalBalance = json['totalBalance'];
    totalPaymentAmount = json['totalPaymentAmount'];
    totalPaymentPercent = json['totalPaymentPercent'];
    totalDeptAmount = json['totalDeptAmount'];
    totalDeptPercent = json['totalDeptPercent'];
    expireDate = json['expireDate'];
    lastPaymentAmount = json['lastPaymentAmount'];
    lastPaymentDate = json['lastPaymentDate'];
    monthlyPayment = json['monthlyPayment'];
    paymentType = json['paymentType'] != null
        ? Kassa.fromJson(json['paymentType'])
        : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    offerMonth = json['offerMonth'];
    offerDate = json['offerDate'];
    offerEndDate = json['offerEndDate'];
    if (json['contractPaymentOrderLine'] != null) {
      contractPaymentOrderLine = <ContractPaymentOrderLine>[];
      json['contractPaymentOrderLine'].forEach((v) {
        contractPaymentOrderLine!.add(ContractPaymentOrderLine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['initialAmount'] = initialAmount;
    data['initialAmountPercent'] = initialAmountPercent;
    data['totalAmount'] = totalAmount;
    data['totalValue'] = totalValue;
    data['discount'] = discount;
    data['discountMonth'] = discountMonth;
    data['loanPercent'] = loanPercent;
    data['totalCapital'] = totalCapital;
    data['totalInterest'] = totalInterest;
    data['totalBalance'] = totalBalance;
    data['totalPaymentAmount'] = totalPaymentAmount;
    data['totalPaymentPercent'] = totalPaymentPercent;
    data['totalDeptAmount'] = totalDeptAmount;
    data['totalDeptPercent'] = totalDeptPercent;
    data['expireDate'] = expireDate;
    data['lastPaymentAmount'] = lastPaymentAmount;
    data['lastPaymentDate'] = lastPaymentDate;
    data['monthlyPayment'] = monthlyPayment;
    if (paymentType != null) {
      data['paymentType'] = paymentType!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['offerMonth'] = offerMonth;
    data['offerDate'] = offerDate;
    data['offerEndDate'] = offerEndDate;
    if (contractPaymentOrderLine != null) {
      data['contractPaymentOrderLine'] =
          contractPaymentOrderLine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractPaymentOrderLine {
  String? id;
  int? line;
  String? lineDate;
  num? amount;
  num? capital;
  num? interest;
  num? balance;
  dynamic taxAmount;
  dynamic taxRoadAmount;
  dynamic payments;
  dynamic debt;
  bool? editable;
  String? lineType;
  dynamic debet;
  dynamic credit;

  ContractPaymentOrderLine(
      {this.id,
      this.line,
      this.lineDate,
      this.amount,
      this.capital,
      this.interest,
      this.balance,
      this.taxAmount,
      this.taxRoadAmount,
      this.payments,
      this.debt,
      this.editable,
      this.lineType,
      this.debet,
      this.credit});

  ContractPaymentOrderLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    line = json['line'];
    lineDate = json['lineDate'];
    amount = json['amount'];
    capital = json['capital'];
    interest = json['interest'];
    balance = json['balance'];
    taxAmount = json['taxAmount'];
    taxRoadAmount = json['taxRoadAmount'];
    payments = json['payments'];
    debt = json['debt'];
    editable = json['editable'];
    lineType = json['lineType'];
    debet = json['debet'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['line'] = line;
    data['lineDate'] = lineDate;
    data['amount'] = amount;
    data['capital'] = capital;
    data['interest'] = interest;
    data['balance'] = balance;
    data['taxAmount'] = taxAmount;
    data['taxRoadAmount'] = taxRoadAmount;
    data['payments'] = payments;
    data['debt'] = debt;
    data['editable'] = editable;
    data['lineType'] = lineType;
    data['debet'] = debet;
    data['credit'] = credit;
    return data;
  }
}
