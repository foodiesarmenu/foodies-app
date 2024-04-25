import 'AmountDetails.dart';
import 'AutomaticPaymentMethods.dart';
import 'ErrorDto.dart';
import 'PaymentMethodOptions.dart';

/// id : "pi_3P8svGRvZAWQr39y1cHy4xQC"
/// object : "payment_intent"
/// amount : 100
/// amount_capturable : 0
/// amount_details : {"tip":{}}
/// amount_received : 0
/// application : null
/// application_fee_amount : null
/// automatic_payment_methods : {"allow_redirects":"always","enabled":true}
/// canceled_at : null
/// cancellation_reason : null
/// capture_method : "automatic_async"
/// client_secret : "pi_3P8svGRvZAWQr39y1cHy4xQC_secret_t4ruI2KF6GoMs1jzJgiUtcClR"
/// confirmation_method : "automatic"
/// created : 1713915530
/// currency : "usd"
/// customer : null
/// description : null
/// invoice : null
/// last_payment_error : null
/// latest_charge : null
/// livemode : false
/// metadata : {}
/// next_action : null
/// on_behalf_of : null
/// payment_method : null
/// payment_method_configuration_details : null
/// payment_method_options : {"card":{"installments":null,"mandate_options":null,"network":null,"request_three_d_secure":"automatic"}}
/// payment_method_types : ["card"]
/// processing : null
/// receipt_email : null
/// review : null
/// setup_future_usage : null
/// shipping : null
/// source : null
/// statement_descriptor : null
/// statement_descriptor_suffix : null
/// status : "requires_payment_method"
/// transfer_data : null
/// transfer_group : null

class PaymentIntentModel {
  PaymentIntentModel(
      {this.id,
      this.object,
      this.amount,
      this.amountCapturable,
      this.amountDetails,
      this.amountReceived,
      this.application,
      this.applicationFeeAmount,
      this.automaticPaymentMethods,
      this.canceledAt,
      this.cancellationReason,
      this.captureMethod,
      this.clientSecret,
      this.confirmationMethod,
      this.created,
      this.currency,
      this.customer,
      this.description,
      this.invoice,
      this.lastPaymentError,
      this.latestCharge,
      this.livemode,
      this.metadata,
      this.nextAction,
      this.onBehalfOf,
      this.paymentMethod,
      this.paymentMethodConfigurationDetails,
      this.paymentMethodOptions,
      this.paymentMethodTypes,
      this.processing,
      this.receiptEmail,
      this.review,
      this.setupFutureUsage,
      this.shipping,
      this.source,
      this.statementDescriptor,
      this.statementDescriptorSuffix,
      this.status,
      this.transferData,
      this.transferGroup,
      this.error});

  PaymentIntentModel.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCapturable = json['amount_capturable'];
    amountDetails = json['amount_details'] != null
        ? AmountDetails.fromJson(json['amount_details'])
        : null;
    amountReceived = json['amount_received'];
    application = json['application'];
    applicationFeeAmount = json['application_fee_amount'];
    automaticPaymentMethods = json['automatic_payment_methods'] != null
        ? AutomaticPaymentMethods.fromJson(json['automatic_payment_methods'])
        : null;
    canceledAt = json['canceled_at'];
    cancellationReason = json['cancellation_reason'];
    captureMethod = json['capture_method'];
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];
    customer = json['customer'];
    description = json['description'];
    invoice = json['invoice'];
    lastPaymentError = json['last_payment_error'];
    latestCharge = json['latest_charge'];
    livemode = json['livemode'];
    metadata = json['metadata'];
    nextAction = json['next_action'];
    onBehalfOf = json['on_behalf_of'];
    paymentMethod = json['payment_method'];
    paymentMethodConfigurationDetails =
        json['payment_method_configuration_details'];
    paymentMethodOptions = json['payment_method_options'] != null
        ? PaymentMethodOptions.fromJson(json['payment_method_options'])
        : null;
    paymentMethodTypes = json['payment_method_types'] != null
        ? json['payment_method_types'].cast<String>()
        : [];
    processing = json['processing'];
    receiptEmail = json['receipt_email'];
    review = json['review'];
    setupFutureUsage = json['setup_future_usage'];
    shipping = json['shipping'];
    source = json['source'];
    statementDescriptor = json['statement_descriptor'];
    statementDescriptorSuffix = json['statement_descriptor_suffix'];
    status = json['status'];
    transferData = json['transfer_data'];
    transferGroup = json['transfer_group'];
    error = json['error'] != null ? ErrorDto.fromJson(json['error']) : null;
  }

  String? id;
  String? object;
  num? amount;
  num? amountCapturable;
  AmountDetails? amountDetails;
  num? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  num? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  dynamic metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  dynamic paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;
  ErrorDto? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['amount'] = amount;
    map['amount_capturable'] = amountCapturable;
    if (amountDetails != null) {
      map['amount_details'] = amountDetails?.toJson();
    }
    map['amount_received'] = amountReceived;
    map['application'] = application;
    map['application_fee_amount'] = applicationFeeAmount;
    if (automaticPaymentMethods != null) {
      map['automatic_payment_methods'] = automaticPaymentMethods?.toJson();
    }
    map['canceled_at'] = canceledAt;
    map['cancellation_reason'] = cancellationReason;
    map['capture_method'] = captureMethod;
    map['client_secret'] = clientSecret;
    map['confirmation_method'] = confirmationMethod;
    map['created'] = created;
    map['currency'] = currency;
    map['customer'] = customer;
    map['description'] = description;
    map['invoice'] = invoice;
    map['last_payment_error'] = lastPaymentError;
    map['latest_charge'] = latestCharge;
    map['livemode'] = livemode;
    map['metadata'] = metadata;
    map['next_action'] = nextAction;
    map['on_behalf_of'] = onBehalfOf;
    map['payment_method'] = paymentMethod;
    map['payment_method_configuration_details'] =
        paymentMethodConfigurationDetails;
    if (paymentMethodOptions != null) {
      map['payment_method_options'] = paymentMethodOptions?.toJson();
    }
    map['payment_method_types'] = paymentMethodTypes;
    map['processing'] = processing;
    map['receipt_email'] = receiptEmail;
    map['review'] = review;
    map['setup_future_usage'] = setupFutureUsage;
    map['shipping'] = shipping;
    map['source'] = source;
    map['statement_descriptor'] = statementDescriptor;
    map['statement_descriptor_suffix'] = statementDescriptorSuffix;
    map['status'] = status;
    map['transfer_data'] = transferData;
    map['transfer_group'] = transferGroup;
    if (error != null) {
      map['error'] = error?.toJson();
    }

    return map;
  }
}
