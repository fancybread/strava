component displayname="OauthService" accessors="true" output="false" {

    property name="endpoint" type="string" default="https://www.strava.com/oauth";
    property name="clientId" type="string";
    property name="clientSecret" type="string";

    public OauthService function init(
        required string clientId,
        required string clientSecret
    ) {
        setClientId(arguments.clientId);
        setClientSecret(arguments.clientSecret);
        return this;
    }

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

    public any function deauthorize(
        required string token
    ) {
        var requestUrl = getEndPoint() & '/deauthorize';
        var req = newRequest(requestUrl=requestUrl,method='GET');
        req.addHeader('Authorization: Bearer',arguments.token);
        var response = req.execute();
        return response.fileContent;
    }

    private HttpRequest function newRequest(
        required string requestUrl,
        required string method
    ) {
    	return new HttpRequest(argumentCollection=arguments);
    }
}