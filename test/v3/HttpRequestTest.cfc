import strava.v3.HttpRequest;

component displayname="HttpRequestTest" output="false" extends="mxunit.framework.TestCase" {

    public void function beforeTests() {
        variables.accessToken = 'a5329a30405ef550523191657059a768d48be972';
        variables.athleteId = '5595967';
    }

    public void function setUp() {
        variables.HttpRequest = new HttpRequest(requestURL='https://www.strava.com/api/v3',method='GET');
    }

    public void function getHeadersReturnsStruct() {
        var headers = getHttpRequest().getHeaders();
        assertTrue(isStruct(headers));
        assertTrue(StructCount(headers) == 0);
    }

    public void function addHeaderIncreasesHeaderCount() {
        var headers = {};
        getHttpRequest().addHeader(name='foo',value='bar');
        headers = getHttpRequest().getHeaders();
        assertTrue(isStruct(headers));
        assertTrue(StructCount(headers) == 1);
        getHttpRequest().addHeader(name='cracked',value='mad');
        assertTrue(StructCount(headers) == 2);
    }

    public void function getFormFieldsReturnsStruct() {
        var headers = getHttpRequest().getHeaders();
        assertTrue(isStruct(headers));
    }

    public void function addFormFieldIncreasesFormFieldCount() {
        var formFields = {};
        getHttpRequest().addFormField(name='foo',value='bar');
        formFields = getHttpRequest().getFormFields();
        assertTrue(isStruct(formFields));
        assertTrue(StructCount(formFields) == 1);
        getHttpRequest().addFormField(name='cracked',value='mad');
        assertTrue(StructCount(formFields) == 2);
    }

    public void function getQueryParamsReturnsArray() {
        var params = getHttpRequest().getQueryParams();
        assertTrue(isArray(params));
    }

    public void function addQueryParamIncreasesQueryParamCount() {
        var params = ArrayNew(1);
        getHttpRequest().addQueryParam(name='athletes',value=variables.athleteID);
        params = getHttpRequest().getQueryParams();
        assertTrue(isArray(params));
        assertTrue(ArrayLen(params) == 1);
    }

    public void function getMethodReturnsString() {
        assertTrue(getHttpRequest().getMethod() == 'GET'); // default
        getHttpRequest().setMethod('PUT');
        assertTrue(getHttpRequest().getMethod() == 'PUT');
    }

    public void function getBodyReturnsString() {
        var body = getHttpRequest().getBody();
        assertTrue(body == ''); // default
        getHttpRequest().setBody('test');
        body = getHttpRequest().getBody();
        assertTrue(body == 'test');
    }

    public void function getUrlReturnsString() {
        var urlString = getHttpRequest().getUrl();
        assertTrue(urlString neq ''); // ensure url is not blank
    }

    public void function getRequestUrlReturnsString() {
        var urlString = getHttpRequest().getRequestUrl();
        assertTrue(urlString neq ''); // ensure url is not blank
    }

    public void function executeReturnsJson() {
        // assumes default url and method set
        var urlRequestString = 'https://www.strava.com/api/v3/athlete';
        var response = '';
        var req = getHttpRequest();
        // add queryParams
        req.addQueryParam('athlete','');
        req.addHeader('Authorization','Bearer ' & variables.accessToken);
        response = req.execute();
        assertTrue(req.getRequestUrl() == urlRequestString);
        assertTrue(isJSON(response.fileContent));
    }

    // private

    private any function getHttpRequest() {
        return variables.HttpRequest;
    }
}