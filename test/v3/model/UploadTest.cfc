import strava.v3.model.Upload;

component displayname="UploadTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.Upload ='{
        "id": 16486788,
        "external_id": "test.fit",
        "error": null,
        "status": "Your activity is still being processed.",
        "activity_id": null
        }';
        variables.Upload = new Upload(argumentCollection=DeserializeJson(local.Upload));
    }

    public void function getIdReturnsNumeric() {
        var id = getUpload().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 16486788);
    }

    public void function getExternalIdReturnsString() {
        var external_id = getUpload().getExternalId();
        assertTrue(IsSimpleValue(external_id));
        assertTrue(external_id == 'test.fit');
    }

    public void function getErrorReturnsNull() {
        var err = getUpload().getError();
        assertTrue(IsNull(err));
    }

    public void function getStatusReturnsString() {
        var status = getUpload().getStatus();
        assertTrue(IsSimpleValue(status));
        assertTrue(status == 'Your activity is still being processed.');
    }

    public void function getActivityIdReturnsNull() {
        var activity_id = getUpload().getActivityId();
        assertTrue(IsNull(activity_id));
    }

    // private

    private Upload function getUpload() {
       return variables.Upload;
    }

}