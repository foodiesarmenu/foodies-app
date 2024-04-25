/// id : "cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS"
/// object : "checkout.session"
/// after_expiration : null
/// allow_promotion_codes : null
/// amount_subtotal : 2999
/// amount_total : 2999
/// automatic_tax : {"enabled":false,"liability":null,"status":null}
/// billing_address_collection : null
/// cancel_url : "https://www.yahoo.com/"
/// client_reference_id : "66230f7fb02fc754832367ee"
/// client_secret : null
/// consent : null
/// consent_collection : null
/// created : 1713573762
/// currency : "usd"
/// currency_conversion : null
/// custom_fields : []
/// custom_text : {"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null}
/// customer : null
/// customer_creation : "if_required"
/// customer_details : {"address":null,"email":"yehya404@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null}
/// customer_email : "yehya404@gmail.com"
/// expires_at : 1713660162
/// invoice : null
/// invoice_creation : {"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}}
/// livemode : false
/// locale : null
/// metadata : {"apartmentNumber":"10122","buildingNumber":"Building A22","firstAddress":"123 Main St222222","floorNumber":"2nd Floor222","note":"Near the park2","secondAddress":"Apt 1012222","streetName":"Oak Avenue22"}
/// mode : "payment"
/// payment_intent : null
/// payment_link : null
/// payment_method_collection : "if_required"
/// payment_method_configuration_details : null
/// payment_method_options : {"card":{"request_three_d_secure":"automatic"}}
/// payment_method_types : ["card"]
/// payment_status : "unpaid"
/// phone_number_collection : {"enabled":false}
/// recovered_from : null
/// saved_payment_method_options : null
/// setup_intent : null
/// shipping_address_collection : null
/// shipping_cost : null
/// shipping_details : null
/// shipping_options : []
/// status : "open"
/// submit_type : null
/// subscription : null
/// success_url : "https://www.google.com/"
/// total_details : {"amount_discount":0,"amount_shipping":0,"amount_tax":0}
/// ui_mode : "hosted"
/// url : "https://checkout.stripe.com/c/pay/cs_test_a1Ml8vxaZewg7AoiqUyec0BxTbCzl4ZUpOIvQMH9BAhXjBVjW6M9XvvXeS#fidkdWxOYHwnPyd1blpxYHZxWjA0VTIxXzVXc19EUlR3Njx8TVxtRm9mcDNHPDBIYzc1MGxyU3dtR25rbUt3PVNANE1VVnQzb3RUbD1zMVRtaTxVQXQ0ZEx3cVNMSkxEZDI8UX88bmRRUD19NTVDRnwwVWI0TCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"

class OnlineOrder {
  OnlineOrder({
    this.id,
    this.cancelUrl,
    this.successUrl,
    this.url,
  });

  String? id;
  String? cancelUrl;
  String? successUrl;
  String? url;
}
