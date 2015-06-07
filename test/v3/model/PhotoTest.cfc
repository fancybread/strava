import strava.v3.model.Photo;

component displayname="PhotoTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.Photo ='{
  "id": 10701863,
  "activity_id": 81121657,
  "resource_state": 2,
  "ref": "http://instagram.com/p/eAvA-tir85/",
  "uid": "540638730806542137_2865686",
  "caption": "City on a cottonbal",
  "type": "InstagramPhoto",
  "uploaded_at": "2013-09-08T19:39:40Z",
  "created_at": "2013-09-08T22:05:14Z",
  "location": [
    37.839333333,
    -122.489833333
  ]
}';
        variables.Photo = new Photo(argumentCollection=DeserializeJson(local.Photo));
    }

    public void function getIdReturnsNumeric() {
        var id = getPhoto().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 10701863);
    }

    public void function getActivityIdReturnsNumeric() {
        var activityId = getPhoto().getActivityId();
        assertTrue(IsNumeric(activityId));
        assertTrue(activityId == 81121657);
    }

    public void function getResourceStateReturnsNumeric() {
        var ResourceState = getPhoto().getResourceState();
        assertTrue(IsNumeric(ResourceState));
        assertTrue(ResourceState == 2);
    }
        
    public void function getRefReturnsString() {
        var ref = getPhoto().getRef();
        assertTrue(IsSimpleValue(ref));
        assertTrue(ref == 'http://instagram.com/p/eAvA-tir85/');
    }
        
    public void function getUidReturnsString() {
        var uid = getPhoto().getUid();
        assertTrue(IsSimpleValue(uid));
        assertTrue(uid == '540638730806542137_2865686');
    }
    
    public void function geCaptionReturnsString() {
        var caption = getPhoto().getCaption();
        assertTrue(IsSimpleValue(caption));
        assertTrue(caption == 'City on a cottonbal');
    }

    public void function getTypeReturnsString() {
        var type = getPhoto().getType();
        assertTrue(IsSimpleValue(type));
        assertTrue(type == 'InstagramPhoto');
    }
    
    public void function getUploadedAtReturnsString() {
        var uploadedAt = getPhoto().getUploadedAt();
        assertTrue(IsSimpleValue(uploadedAt));
        assertTrue(uploadedAt == '2013-09-08T19:39:40Z');
    }
    
    public void function getCreatedAtReturnsString() {
        var createAt = getPhoto().getCreatedAt();
        assertTrue(IsSimpleValue(createAt));
        assertTrue(createAt == '2013-09-08T22:05:14Z');
    }
    
    public void function getLocationReturnsArray() {
        var location = getPhoto().getLocation();
        assertTrue(IsArray(location));
    }

    // private

    private Photo function getPhoto() {
       return variables.Photo;
    }

}