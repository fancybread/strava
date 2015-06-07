import strava.v3.OauthService;

component displayname="OauthServiceTest" output="false" extends="mxunit.framework.TestCase" {

    public void function beforeTests() {
        variables.clientId = '3326';
        variables.clientSecret = '10b8a27d0973996ed1ed7ff3b2a8b8554820d5be';
        variables.accessToken = 'a5329a30405ef550523191657059a768d48be972';
        variables.code = '8ed09972d817fbcb3492f5e7395f95bd93392100';
    }

    public void function setUp() {
        variables.oauthService = new OauthService(clientId=variables.clientId,clientSecret=variables.clientSecret);
    }

    public void function exchangeTokenReturnsJson() {
        var token = variables.oauthService.exchangeToken(code=variables.code);
        debug(token);
        assertTrue(isJSON(token));
    }

}