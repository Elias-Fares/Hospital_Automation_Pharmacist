import 'dart:convert';

class CollectionModel {
    final Info? info;
    final List<Item>? item;

    CollectionModel({
        this.info,
        this.item,
    });

    CollectionModel copyWith({
        Info? info,
        List<Item>? item,
    }) => 
        CollectionModel(
            info: info ?? this.info,
            item: item ?? this.item,
        );

    factory CollectionModel.fromRawJson(String str) => CollectionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        item: json["item"] == null ? [] : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "item": item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
    };
}

class Info {
    final String? postmanId;
    final String? name;
    final String? schema;
    final String? exporterId;

    Info({
        this.postmanId,
        this.name,
        this.schema,
        this.exporterId,
    });

    Info copyWith({
        String? postmanId,
        String? name,
        String? schema,
        String? exporterId,
    }) => 
        Info(
            postmanId: postmanId ?? this.postmanId,
            name: name ?? this.name,
            schema: schema ?? this.schema,
            exporterId: exporterId ?? this.exporterId,
        );

    factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
        exporterId: json["_exporter_id"],
    );

    Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
        "_exporter_id": exporterId,
    };
}

class Item {
    final String? name;
    final Request? request;
    final List<Response>? response;
    final ProtocolProfileBehavior? protocolProfileBehavior;

    Item({
        this.name,
        this.request,
        this.response,
        this.protocolProfileBehavior,
    });

    Item copyWith({
        String? name,
        Request? request,
        List<Response>? response,
        ProtocolProfileBehavior? protocolProfileBehavior,
    }) => 
        Item(
            name: name ?? this.name,
            request: request ?? this.request,
            response: response ?? this.response,
            protocolProfileBehavior: protocolProfileBehavior ?? this.protocolProfileBehavior,
        );

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        request: json["request"] == null ? null : Request.fromJson(json["request"]),
        response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
        protocolProfileBehavior: json["protocolProfileBehavior"] == null ? null : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "request": request?.toJson(),
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
        "protocolProfileBehavior": protocolProfileBehavior?.toJson(),
    };
}

class ProtocolProfileBehavior {
    final bool? disableBodyPruning;

    ProtocolProfileBehavior({
        this.disableBodyPruning,
    });

    ProtocolProfileBehavior copyWith({
        bool? disableBodyPruning,
    }) => 
        ProtocolProfileBehavior(
            disableBodyPruning: disableBodyPruning ?? this.disableBodyPruning,
        );

    factory ProtocolProfileBehavior.fromRawJson(String str) => ProtocolProfileBehavior.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) => ProtocolProfileBehavior(
        disableBodyPruning: json["disableBodyPruning"],
    );

    Map<String, dynamic> toJson() => {
        "disableBodyPruning": disableBodyPruning,
    };
}

class Request {
    final String? method;
    final List<dynamic>? header;
    final RequestBody? body;
    final Url? url;
    final Auth? auth;

    Request({
        this.method,
        this.header,
        this.body,
        this.url,
        this.auth,
    });

    Request copyWith({
        String? method,
        List<dynamic>? header,
        RequestBody? body,
        Url? url,
        Auth? auth,
    }) => 
        Request(
            method: method ?? this.method,
            header: header ?? this.header,
            body: body ?? this.body,
            url: url ?? this.url,
            auth: auth ?? this.auth,
        );

    factory Request.fromRawJson(String str) => Request.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: json["method"],
        header: json["header"] == null ? [] : List<dynamic>.from(json["header"]!.map((x) => x)),
        body: json["body"] == null ? null : RequestBody.fromJson(json["body"]),
        url: json["url"] == null ? null : Url.fromJson(json["url"]),
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
    );

    Map<String, dynamic> toJson() => {
        "method": method,
        "header": header == null ? [] : List<dynamic>.from(header!.map((x) => x)),
        "body": body?.toJson(),
        "url": url?.toJson(),
        "auth": auth?.toJson(),
    };
}

class Auth {
    final AuthType? type;
    final List<Bearer>? bearer;

    Auth({
        this.type,
        this.bearer,
    });

    Auth copyWith({
        AuthType? type,
        List<Bearer>? bearer,
    }) => 
        Auth(
            type: type ?? this.type,
            bearer: bearer ?? this.bearer,
        );

    factory Auth.fromRawJson(String str) => Auth.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        type: authTypeValues.map[json["type"]]!,
        bearer: json["bearer"] == null ? [] : List<Bearer>.from(json["bearer"]!.map((x) => Bearer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": authTypeValues.reverse[type],
        "bearer": bearer == null ? [] : List<dynamic>.from(bearer!.map((x) => x.toJson())),
    };
}

class Bearer {
    final String? key;
    final String? value;
    final BearerType? type;
    final String? src;

    Bearer({
        this.key,
        this.value,
        this.type,
        this.src,
    });

    Bearer copyWith({
        String? key,
        String? value,
        BearerType? type,
        String? src,
    }) => 
        Bearer(
            key: key ?? this.key,
            value: value ?? this.value,
            type: type ?? this.type,
            src: src ?? this.src,
        );

    factory Bearer.fromRawJson(String str) => Bearer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bearer.fromJson(Map<String, dynamic> json) => Bearer(
        key: json["key"],
        value: json["value"],
        type: bearerTypeValues.map[json["type"]]!,
        src: json["src"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": bearerTypeValues.reverse[type],
        "src": src,
    };
}

enum BearerType {
    FILE,
    STRING,
    TEXT
}

final bearerTypeValues = EnumValues({
    "file": BearerType.FILE,
    "string": BearerType.STRING,
    "text": BearerType.TEXT
});

enum AuthType {
    BEARER
}

final authTypeValues = EnumValues({
    "bearer": AuthType.BEARER
});

class RequestBody {
    final Mode? mode;
    final String? raw;
    final Options? options;
    final List<Bearer>? formdata;

    RequestBody({
        this.mode,
        this.raw,
        this.options,
        this.formdata,
    });

    RequestBody copyWith({
        Mode? mode,
        String? raw,
        Options? options,
        List<Bearer>? formdata,
    }) => 
        RequestBody(
            mode: mode ?? this.mode,
            raw: raw ?? this.raw,
            options: options ?? this.options,
            formdata: formdata ?? this.formdata,
        );

    factory RequestBody.fromRawJson(String str) => RequestBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RequestBody.fromJson(Map<String, dynamic> json) => RequestBody(
        mode: modeValues.map[json["mode"]]!,
        raw: json["raw"],
        options: json["options"] == null ? null : Options.fromJson(json["options"]),
        formdata: json["formdata"] == null ? [] : List<Bearer>.from(json["formdata"]!.map((x) => Bearer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "raw": raw,
        "options": options?.toJson(),
        "formdata": formdata == null ? [] : List<dynamic>.from(formdata!.map((x) => x.toJson())),
    };
}

enum Mode {
    FORMDATA,
    RAW
}

final modeValues = EnumValues({
    "formdata": Mode.FORMDATA,
    "raw": Mode.RAW
});

class Options {
    final Raw? raw;

    Options({
        this.raw,
    });

    Options copyWith({
        Raw? raw,
    }) => 
        Options(
            raw: raw ?? this.raw,
        );

    factory Options.fromRawJson(String str) => Options.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: json["raw"] == null ? null : Raw.fromJson(json["raw"]),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw?.toJson(),
    };
}

class Raw {
    final Language? language;

    Raw({
        this.language,
    });

    Raw copyWith({
        Language? language,
    }) => 
        Raw(
            language: language ?? this.language,
        );

    factory Raw.fromRawJson(String str) => Raw.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: languageValues.map[json["language"]]!,
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
    };
}

enum Language {
    JSON
}

final languageValues = EnumValues({
    "json": Language.JSON
});




class Url {
    final String? raw;
    final List<Host>? host;
    final List<String>? path;
    final List<Header>? query;

    Url({
        this.raw,
        this.host,
        this.path,
        this.query,
    });

    Url copyWith({
        String? raw,
        List<Host>? host,
        List<String>? path,
        List<Header>? query,
    }) => 
        Url(
            raw: raw ?? this.raw,
            host: host ?? this.host,
            path: path ?? this.path,
            query: query ?? this.query,
        );

    factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        host: json["host"] == null ? [] : List<Host>.from(json["host"]!.map((x) => hostValues.map[x]!)),
        path: json["path"] == null ? [] : List<String>.from(json["path"]!.map((x) => x)),
        query: json["query"] == null ? [] : List<Header>.from(json["query"]!.map((x) => Header.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "host": host == null ? [] : List<dynamic>.from(host!.map((x) => hostValues.reverse[x])),
        "path": path == null ? [] : List<dynamic>.from(path!.map((x) => x)),
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x.toJson())),
    };
}

enum Host {
    URL
}

final hostValues = EnumValues({
    "{{URL}}": Host.URL
});

class Header {
    final String? key;
    final String? value;

    Header({
        this.key,
        this.value,
    });

    Header copyWith({
        String? key,
        String? value,
    }) => 
        Header(
            key: key ?? this.key,
            value: value ?? this.value,
        );

    factory Header.fromRawJson(String str) => Header.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}




class Response {
    final String? name;
    final OriginalRequest? originalRequest;
    final Status? status;
    final int? code;
    final Language? postmanPreviewlanguage;
    final List<Header>? header;
    final List<dynamic>? cookie;
    final String? body;

    Response({
        this.name,
        this.originalRequest,
        this.status,
        this.code,
        this.postmanPreviewlanguage,
        this.header,
        this.cookie,
        this.body,
    });

    Response copyWith({
        String? name,
        OriginalRequest? originalRequest,
        Status? status,
        int? code,
        Language? postmanPreviewlanguage,
        List<Header>? header,
        List<dynamic>? cookie,
        String? body,
    }) => 
        Response(
            name: name ?? this.name,
            originalRequest: originalRequest ?? this.originalRequest,
            status: status ?? this.status,
            code: code ?? this.code,
            postmanPreviewlanguage: postmanPreviewlanguage ?? this.postmanPreviewlanguage,
            header: header ?? this.header,
            cookie: cookie ?? this.cookie,
            body: body ?? this.body,
        );

    factory Response.fromRawJson(String str) => Response.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: json["name"],
        originalRequest: json["originalRequest"] == null ? null : OriginalRequest.fromJson(json["originalRequest"]),
        status: statusValues.map[json["status"]]!,
        code: json["code"],
        postmanPreviewlanguage: languageValues.map[json["_postman_previewlanguage"]]!,
        header: json["header"] == null ? [] : List<Header>.from(json["header"]!.map((x) => Header.fromJson(x))),
        cookie: json["cookie"] == null ? [] : List<dynamic>.from(json["cookie"]!.map((x) => x)),
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "originalRequest": originalRequest?.toJson(),
        "status": statusValues.reverse[status],
        "code": code,
        "_postman_previewlanguage": languageValues.reverse[postmanPreviewlanguage],
        "header": header == null ? [] : List<dynamic>.from(header!.map((x) => x.toJson())),
        "cookie": cookie == null ? [] : List<dynamic>.from(cookie!.map((x) => x)),
        "body": body,
    };
}

class OriginalRequest {
    final String? method;
    final List<dynamic>? header;
    final OriginalRequestBody? body;
    final Url? url;

    OriginalRequest({
        this.method,
        this.header,
        this.body,
        this.url,
    });

    OriginalRequest copyWith({
        String? method,
        List<dynamic>? header,
        OriginalRequestBody? body,
        Url? url,
    }) => 
        OriginalRequest(
            method: method ?? this.method,
            header: header ?? this.header,
            body: body ?? this.body,
            url: url ?? this.url,
        );

    factory OriginalRequest.fromRawJson(String str) => OriginalRequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OriginalRequest.fromJson(Map<String, dynamic> json) => OriginalRequest(
        method:json["method"],
        header: json["header"] == null ? [] : List<dynamic>.from(json["header"]!.map((x) => x)),
        body: json["body"] == null ? null : OriginalRequestBody.fromJson(json["body"]),
        url: json["url"] == null ? null : Url.fromJson(json["url"]),
    );

    Map<String, dynamic> toJson() => {
        "method": method,
        "header": header == null ? [] : List<dynamic>.from(header!.map((x) => x)),
        "body": body?.toJson(),
        "url": url?.toJson(),
    };
}

class OriginalRequestBody {
    final Mode? mode;
    final String? raw;
    final Options? options;
    final List<Formdatum>? formdata;

    OriginalRequestBody({
        this.mode,
        this.raw,
        this.options,
        this.formdata,
    });

    OriginalRequestBody copyWith({
        Mode? mode,
        String? raw,
        Options? options,
        List<Formdatum>? formdata,
    }) => 
        OriginalRequestBody(
            mode: mode ?? this.mode,
            raw: raw ?? this.raw,
            options: options ?? this.options,
            formdata: formdata ?? this.formdata,
        );

    factory OriginalRequestBody.fromRawJson(String str) => OriginalRequestBody.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OriginalRequestBody.fromJson(Map<String, dynamic> json) => OriginalRequestBody(
        mode: modeValues.map[json["mode"]]!,
        raw: json["raw"],
        options: json["options"] == null ? null : Options.fromJson(json["options"]),
        formdata: json["formdata"] == null ? [] : List<Formdatum>.from(json["formdata"]!.map((x) => Formdatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "raw": raw,
        "options": options?.toJson(),
        "formdata": formdata == null ? [] : List<dynamic>.from(formdata!.map((x) => x.toJson())),
    };
}

class Formdatum {
    final String? key;
    final BearerType? type;
    final dynamic src;
    final String? value;
    final bool? disabled;

    Formdatum({
        this.key,
        this.type,
        this.src,
        this.value,
        this.disabled,
    });

    Formdatum copyWith({
        String? key,
        BearerType? type,
        dynamic src,
        String? value,
        bool? disabled,
    }) => 
        Formdatum(
            key: key ?? this.key,
            type: type ?? this.type,
            src: src ?? this.src,
            value: value ?? this.value,
            disabled: disabled ?? this.disabled,
        );

    factory Formdatum.fromRawJson(String str) => Formdatum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
        key: json["key"],
        type: bearerTypeValues.map[json["type"]]!,
        src: json["src"],
        value: json["value"],
        disabled: json["disabled"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "type": bearerTypeValues.reverse[type],
        "src": src,
        "value": value,
        "disabled": disabled,
    };
}

enum Status {
    ACCEPTED,
    BAD_REQUEST,
    CREATED,
    OK,
    PAYMENT_REQUIRED,
    UNAUTHORIZED
}

final statusValues = EnumValues({
    "Accepted": Status.ACCEPTED,
    "Bad Request": Status.BAD_REQUEST,
    "Created": Status.CREATED,
    "OK": Status.OK,
    "Payment Required": Status.PAYMENT_REQUIRED,
    "Unauthorized": Status.UNAUTHORIZED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
