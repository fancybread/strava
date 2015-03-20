component displayname="HttpRequest" accessors="true" output="false" {

    property name="url" type="string";
    property name="method" type="string";
    property name="queryString" type="string" default="";
    property name="body" type="string" default="";
    property name="userAgent" type="string" default="";
    property name="headers" type="struct";
    property name="formFields" type="struct";
    property name="queryParams" type="array";

    public HttpRequest function init(
        required string requestUrl,
        string method="GET"
    ) {
        setUrl(arguments.requestUrl);
        setMethod(arguments.method);
        setHeaders({});
        setFormFields({});
        setQueryParams([]);
        return this;
    }

    public void function addHeader(
        required string name,
        required string value
    ) {
        variables.headers[arguments.name] = arguments.value;
    }

    public void function addFormField(
        required string name,
        required string value
    ) {
        variables.formFields[arguments.name] = arguments.value;
    }

    public void function addQueryParam(
        required string name,
        required string value
    ) {
        ArrayAppend(variables.queryParams,arguments);
    }

    public string function getRequestUrl() {
        var requestUrl = getUrl();
        var param = {};
        for (param in getQueryParams()) {
            requestUrl &= '/' &param['name'] & ( len(param['value']) gt 0 ? '/' & param['value'] : '' );
        }
        if (len(getQueryString()) > 0) {
            requestUrl &= '/?' & getQueryString();
        }
        return requestUrl;
    }

    public struct function execute() {
        var header = {};
        var field = {};
        var body = getBody();
        var httpResult = {};
        var requestLog = "REQUESTURL: " & getRequestUrl() & " METHOD: " & getMethod() & " HEADERS: " & SerializeJSON(getHeaders()) & " FORMFIELDS: " & SerializeJSON(getFormFields());
        //log file="http" text=requestLog  type="information";
        http url="#getRequestUrl()#" method="#getMethod()#" result="httpResult" throwonerror="no" {
            for (header in getHeaders()) {
                    httpparam name="#header#" type="HEADER" value="#variables.headers[header]#";
            }
            if ((getMethod() == "POST") && StructCount(getFormFields()) > 0) {
                for (field in getFormFields()) {
                    httpparam name="#field#" type="formField" value="#variables.formFields[field]#";
                }
            }
        }
        //log file="http" text="RESULT: " & httpResult.fileContent type="trace";
        return httpResult;
    }

}