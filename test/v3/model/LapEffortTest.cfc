import strava.v3.model.LapEffort;

component displayname="LapEffortTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.lap ='{
    "id": 401614652,
    "resource_state": 2,
    "name": "Lap 1",
    "activity": {
      "id": 123
    },
    "athlete": {
      "id": 227615
    },
    "elapsed_time": 7092,
    "moving_time": 6870,
    "start_date": "2013-11-02T17:39:37Z",
    "start_date_local": "2013-11-02T10:39:37Z",
    "distance": 42121.5,
    "start_index": 0,
    "end_index": 6826,
    "total_elevation_gain": 766.0,
    "average_speed": 5.9,
    "max_speed": 16.8,
    "average_cadence": 64.7,
    "average_watts": 156.2,
    "device_watts": false,
    "average_heartrate": 141.1,
    "max_heartrate": 176.0,
    "lap_index": 1
  }';
        variables.lapEffort = new LapEffort(argumentCollection=DeserializeJson(local.lap));
    }

    public void function getIdReturnsNumeric() {
        var id = getLapEffort().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 401614652);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getLapEffort().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 2);
    }

    public void function getNameReturnsString() {
        var name = getLapEffort().getName();
        assertTrue(IsSimpleValue(name));
        assertTrue(name == 'Lap 1');
    }
    
    public void function getActivityReturnsStruct() {
        var activity = getLapEffort().getActivity();
        assertTrue(IsStruct(activity));
        assertTrue(StructCount(activity) == 1);
    }

    public void function getAthleteReturnsStruct() {
        var athlete = getLapEffort().getAthlete();
        assertTrue(IsStruct(athlete));
        assertTrue(StructCount(athlete) == 1);
    }

    public void function getElapsedTimeReturnsNumeric() {
        var time = getLapEffort().getElapsedTime();
        assertTrue(IsNumeric(time));
        assertTrue(time == 7092);
    }
    
    public void function getMovingTimeReturnsNumeric() {
        var time = getLapEffort().getMovingTime();
        assertTrue(IsNumeric(time));
        assertTrue(time == 6870);
    }

    public void function getStartDateReturnsString() {
        var startDate = getLapEffort().getStartDate();
        assertTrue(IsSimpleValue(startDate));
        assertTrue(startDate == '2013-11-02T17:39:37Z');
    }

    public void function getStartDateLocalReturnsString() {
        var startDate = getLapEffort().getStartDateLocal();
        assertTrue(IsSimpleValue(startDate));
        assertTrue(startDate == '2013-11-02T10:39:37Z');
    }
    
    public void function getDistanceReturnsNumeric() {
        var distance = getLapEffort().getDistance();
        assertTrue(IsNumeric(distance));
        assertTrue(distance == 42121.5);
    }
    
    // private

    private LapEffort function getLapEffort() {
       return variables.lapEffort;
    }

}