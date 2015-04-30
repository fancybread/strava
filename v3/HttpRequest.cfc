component displayname="HttpRequest" accessors="true" output="false" {

    property name="url" type="string";
    property name="method" type="string";
    property name="queryString" type="string" default="";
    property name="body" type="string" default="";
    property name="userAgent" type="string" default="";
    property name="headers" type="struct";
    property name="formFields" type="struct";
    property name="queryParams" type="array";


    /**
     * returns an instance of HttpRequest
     * 
     * @requestUrl.hint The HttpRequest endpoint
     * @method.hint The request method (GET|POST|PUT|DELETE) default is GET.
     **/    
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

    /**
     * adds a header name/value pair
     * 
     * @name.hint The header name
     * @value.hint The header value
     **/ 
    public void function addHeader(
        required string name,
        required string value
    ) {
        variables.headers[arguments.name] = arguments.value;
    }

    /**
     * adds a formField (for requests with method=POST) name/value pair
     * 
     * @name.hint The formField name
     * @value.hint The formField value
     **/
    public void function addFormField(
        required string name,
        required string value
    ) {
        variables.formFields[arguments.name] = arguments.value;
    }

    /**
     * adds a query param name/value pair which are composed into the api endpoint
     * when the value is an empty sting the name is appended without a value
     * 
     * calling addQueryParam('athlete','')
     * followed by addQueryParam('activities','1234567')
     * results in  /athlete/activities/1234567
     * 
     * @name.hint The query param name
     * @value.hint The query param value
     **/
    public void function addQueryParam(
        required string name,
        required string value
    ) {
        ArrayAppend(variables.queryParams,arguments);
    }

    /**
     * returns the completely rendered request url
     * 
     **/
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

    /**
     * returns the http request result struct
     * 
     **/
    public struct function execute() {
        var header = {};
        var field = {};
        var body = getBody();
        var httpResult = {};
        var requestLog = "REQUESTURL: " & getRequestUrl() & " METHOD: " & getMethod() & " HEADERS: " & SerializeJSON(getHeaders()) & " FORMFIELDS: " & SerializeJSON(getFormFields());
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
        return httpResult;
    }

}