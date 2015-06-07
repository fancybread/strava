import strava.v3.model.Stat;

component displayname="StatTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.stat ='{
            "count": 6,
            "distance": 83126.9013671875,
            "moving_time": 24731,
            "elapsed_time": 25764,
            "elevation_gain": 1564.9624166488647,
            "achievement_count": 41
          }';
        variables.Stat = new Stat(argumentCollection=DeserializeJson(local.stat));
    }

    public void function getCountReturnsNumeric() {
        var count = getStat().getCount();
        assertTrue(IsNumeric(count));
        assertTrue(count == 6);
    }

    public void function getDistanceReturnsNumeric() {
        var distance = getStat().getDistance();
        assertTrue(IsNumeric(distance));
        assertTrue(distance == 83126.9013671875);
    }

    public void function getMovingTimeReturnsNumeric() {
        var movingTime = getStat().getMovingTime();
        assertTrue(IsNumeric(movingTime));
        assertTrue(movingTime == 24731);
    }
    
    public void function getElapsedTimeReturnsNumeric() {
        var elapsedTime = getStat().getElapsedTime();
        assertTrue(IsNumeric(elapsedTime));
        assertTrue(elapsedTime == 25764);
    }

    public void function getElevationGainReturnsNumeric() {
        var elevationGain = getStat().getElevationGain();
        assertTrue(IsNumeric(elevationGain));
        assertTrue(elevationGain == 1564.9624166488647);
    }
    
    public void function getAchievementCountReturnsNumeric() {
        var achievementCount = getStat().getAchievementCount();
        assertTrue(IsNumeric(achievementCount));
        assertTrue(achievementCount == 41);
    }
    // private

    private Stat function getStat() {
       return variables.Stat;
    }

}