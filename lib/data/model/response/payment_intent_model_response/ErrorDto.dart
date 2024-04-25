/// message : "Invalid currency: . Stripe currently supports these currencies: usd, aed, afn, all, amd, ang, aoa, ars, aud, awg, azn, bam, bbd, bdt, bgn, bhd, bif, bmd, bnd, bob, brl, bsd, bwp, byn, bzd, cad, cdf, chf, clp, cny, cop, crc, cve, czk, djf, dkk, dop, dzd, egp, etb, eur, fjd, fkp, gbp, gel, gip, gmd, gnf, gtq, gyd, hkd, hnl, hrk, htg, huf, idr, ils, inr, isk, jmd, jod, jpy, kes, kgs, khr, kmf, krw, kwd, kyd, kzt, lak, lbp, lkr, lrd, lsl, mad, mdl, mga, mkd, mmk, mnt, mop, mur, mvr, mwk, mxn, myr, mzn, nad, ngn, nio, nok, npr, nzd, omr, pab, pen, pgk, php, pkr, pln, pyg, qar, ron, rsd, rub, rwf, sar, sbd, scr, sek, sgd, shp, sle, sos, srd, std, szl, thb, tjs, tnd, top, try, ttd, twd, tzs, uah, ugx, uyu, uzs, vnd, vuv, wst, xaf, xcd, xof, xpf, yer, zar, zmw, usdc, btn, ghs, eek, lvl, svc, vef, ltl, sll, mro"
/// param : "currency"
/// request_log_url : "https://dashboard.stripe.com/test/logs/req_LfqQ8IUJuQIMXh?t=1713915715"
/// type : "invalid_request_error"

class ErrorDto {
  ErrorDto({
    this.message,
    this.param,
    this.requestLogUrl,
    this.type,
  });

  ErrorDto.fromJson(dynamic json) {
    message = json['message'];
    param = json['param'];
    requestLogUrl = json['request_log_url'];
    type = json['type'];
  }

  String? message;
  String? param;
  String? requestLogUrl;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['param'] = param;
    map['request_log_url'] = requestLogUrl;
    map['type'] = type;
    return map;
  }
}
