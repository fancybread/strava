component displayname="OauthService" accessors="true" output="false" {

    property name="endpoint" type="string" default="https://www.strava.com/oauth";
    property name="clientId" type="string";
    property name="clientSecret" type="string";

    /**
     * returns an instance of StravaService
     **/
    public OauthService function init(
        required string clientId,
        required string clientSecret
    ) {
        setClientId(arguments.clientId);
        setClientSecret(arguments.clientSecret);
        return this;
    }

    /**
     * returns the result of a token exchange request to strava OAuth
     * 
     * @code.hint the code returned from an authorization request
     **/
    public any function exchangeToken(
        required string code
    ) {
        var requestUrl = getEndPoint() & '/token';
        var req = newRequest(requestUrl=requestUrl,method='POST');
        req.addFormField('client_id',variables.clientId);
        req.addFormField('client_secret',variables.clientSecret);
        req.addFormField('code',arguments.code);
        var response = req.execute();
        return response.fileContent;
    }

    /**
     * returns the result of a deauthorize request to strava OAuth
     * 
     * @token.hint the auth token
     **/
    public any function deauthorize(
        required string token
    ) {
        var requestUrl = getEndPoint() & '/deauthorize';
        var req = newRequest(requestUrl=requestUrl,method='GET');
        req.addHeader('Authorization: Bearer',arguments.token);
        var response = req.execute();
        return response.fileContent;
    }

    /**
     * returns an instance of HttpRequest
     * 
     * @requestUrl.hint the base request endpoint
     * @method.hint the request method (GET|POST|PUT|DELETE)
     **/
    private HttpRequest function newRequest(
        required string requestUrl,
        required string method
    ) {
    	return new HttpRequest(argumentCollection=arguments);
    }
}