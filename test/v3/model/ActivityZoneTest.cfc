import strava.v3.model.ActivityZone;

component displayname="ActivityZoneTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.zone ='{
    "score": 215,
    "distribution_buckets": [
      { "max": 115, "min": 0,   "time": 1735 },
      { "max": 152, "min": 115, "time": 5966 },
      { "max": 171, "min": 152, "time": 4077 },
      { "max": 190, "min": 171, "time": 4238 },
      { "max": -1,  "min": 190, "time": 36 }
    ],
    "type": "heartrate",
    "resource_state": 3,
    "sensor_based": true,
    "points": 119,
    "custom_zones": false,
    "max": 196
  }';
        variables.activityZone = new ActivityZone(argumentCollection=DeserializeJson(local.zone));
    }


    public void function getScoreReturnsNumeric() {
        var score = getActivityZone().getScore();
        assertTrue(IsNumeric(score));
        assertTrue(score == 215);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getActivityZone().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 3);
    }


    // private

    private ActivityZone function getActivityZone() {
       return variables.activityZone;
    }

}