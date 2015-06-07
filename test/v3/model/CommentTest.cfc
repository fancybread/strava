import strava.v3.model.Comment;

component displayname="GearTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.comment ='{
		    "id": 26,
		    "activity_id": 123,
		    "resource_state": 2,
		    "text": "Nice ride!!!",
		    "athlete": {
		      "id": 227615,
		      "resource_state": 2,
		      "firstname": "John",
		      "lastname": "Applestrava",
		      "profile_medium": "http://pics.com/227615/medium.jpg",
		      "profile": "http://pics.com/227615//large.jpg",
		      "city": "San Francisco",
		      "state": "California",
		      "country": "United States",
		      "sex": "M",
		      "friend": "accepted",
		      "follower": "accepted",
		      "premium": true,
		      "created_at": "2009-08-26T13:42:05Z",
		      "updated_at": "2013-01-11T18:51:00Z",
		      "approve_followers": false
		    },
		    "created_at": "2013-09-06T21:07:22Z"
		  }';
        variables.comment = new Comment(argumentCollection=DeserializeJson(local.comment));
    }

    public void function getIdReturnsNumeric() {
        var id = getComment().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 26);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getComment().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 2);
    }

    public void function getActivityIdReturnsNumeric() {
        var activityId = getComment().getActivityId();
        assertTrue(IsNumeric(activityId));
        assertTrue(activityId == 123);
    }

    public void function getTextReturnsString() {
        var text = getComment().getText();
        assertTrue(IsSimpleValue(text));
        assertTrue(text == 'Nice ride!!!');
    }

    public void function getAthleteReturnsAthlete() {
        var athlete = getComment().getAthlete();
        assertTrue(IsObject(athlete));
        debug(getMetadata(athlete));
        assertTrue(getMetadata(athlete).name == 'strava.v3.model.Athlete')
    }

    public void function getCreatedAtReturnsString() {
        var createdAt = getComment().getCreatedAt();
        assertTrue(IsSimpleValue(createdAt));
        assertTrue(createdAt == '2013-09-06T21:07:22Z');
    }

    // private

    private Comment function getComment() {
       return variables.Comment;
    }

}