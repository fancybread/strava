import strava.v3.model.SegmentEffort;

component displayname="SegmentEffortTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
    	local.segmentEffort ='{
		  "id": 269990681,
		  "resource_state": 3,
		  "name": "Geysers Road Climb",
		  "activity": {
		    "id": 14296826
		  },
		  "athlete": {
		    "id": 227615
		  },
		  "elapsed_time": 1137,
		  "moving_time": 1137,
		  "start_date": "2013-03-30T18:43:50Z",
		  "start_date_local": "2013-03-30T11:43:50Z",
		  "distance": 6001.7,
		  "start_index": 5348,
		  "end_index": 6485,
		  "average_cadence": 79.1,
		  "average_watts": 357.2,
		  "average_heartrate": 177.8,
		  "max_heartrate": 192.0,
		  "segment": {
		    "id": 1818385,
		    "resource_state": 2,
		    "name": "Geysers Road Climb",
		    "activity_type": "Ride",
		    "distance": 6001.74,
		    "average_grade": 6.2,
		    "maximum_grade": 23.5,
		    "elevation_high": 745.6,
		    "elevation_low": 371.0,
		    "start_latlng": [
		      38.81038486,
		      -122.85571538
		    ],
		    "end_latlng": [
		      38.79168709,
		      -122.82848568
		    ],
		    "climb_category": 3,
		    "city": "Cloverdale",
		    "state": "CA",
		    "country": "United States",
		    "private": false
		  },
		  "kom_rank": null,
		  "pr_rank": 2
		}';
        variables.SegmentEffort = new SegmentEffort(argumentCollection=DeserializeJson(local.segmentEffort));
    }

    public void function getIdReturnsNumeric() {
        var id = getSegmentEffort().getId();
        assertTrue(isNumeric(id));
    }

    public void function getResourceStateReturnsNumeric() {
        var resource_state = getSegmentEffort().getResourceState();
        assertTrue(isNumeric(resource_state));
    }

    public void function getNameReturnsString() {
        var name = getSegmentEffort().getName();
        assertTrue(isSimpleValue(name));
    }

    public void function getActivityReturnsStruct() {
        var activity = getSegmentEffort().getActivity();
        assertTrue(isStruct(activity));
    }

    public void function getAthleteReturnsStruct() {
        var athlete = getSegmentEffort().getAthlete();
        assertTrue(isStruct(athlete));
    }

    public void function getElapsedTimeReturnsNumeric() {
        var elapsed_time = getSegmentEffort().getElapsedTime();
        assertTrue(isNumeric(elapsed_time));
    }

    public void function getMovingTimeReturnsNumeric() {
        var moving_time = getSegmentEffort().getMovingTime();
        assertTrue(isNumeric(moving_time));
    }

    public void function getStartDateReturnsString() {
        var start_date = getSegmentEffort().getStartDate();
        assertTrue(isSimpleValue(start_date));
    }

    public void function getStartDateLocalReturnsString() {
        var start_date_local = getSegmentEffort().getStartDateLocal();
        assertTrue(isSimpleValue(start_date_local));
    }

    public void function getDistanceReturnsNumeric() {
        var distance = getSegmentEffort().getDistance();
        assertTrue(isNumeric(distance));
    }

    public void function getStartIndexReturnsNumeric() {
        var start_index = getSegmentEffort().getStartIndex();
        assertTrue(isNumeric(start_index));
    }

    public void function getEndIndexReturnsNumeric() {
        var end_index = getSegmentEffort().getEndIndex();
        assertTrue(isNumeric(end_index));
    }

    public void function getEndIndexReturnsNumeric() {
        var end_index = getSegmentEffort().getEndIndex();
        assertTrue(isNumeric(end_index));
    }

    public void function getAverageCadenceReturnsNumeric() {
        var average_cadence = getSegmentEffort().getAverageCadence();
        assertTrue(isNumeric(average_cadence));
    }

    public void function getAverageWattsReturnsNumeric() {
        var average_watts = getSegmentEffort().getAverageWatts();
        assertTrue(isNumeric(average_watts));
    }

    public void function getAverageHeartrateReturnsNumeric() {
        var average_heartrate = getSegmentEffort().getAverageHeartrate();
        assertTrue(isNumeric(average_heartrate));
    }

    public void function getMaxHeartrateReturnsNumeric() {
        var max_heartrate = getSegmentEffort().getMaxHeartrate();
        assertTrue(isNumeric(max_heartrate));
    }

    public void function getSegmentReturnsStruct() {
        var segment = getSegmentEffort().getSegment();
        assertTrue(isStruct(segment));
    }

    public void function getKOMRankReturnsNumeric() {
        var kom_rank = getSegmentEffort().getKomRank();
        assertTrue(isNumeric(kom_rank));
    }

    public void function getPRRankReturnsNumeric() {
        var pr_rank = getSegmentEffort().getPrRank();
        assertTrue(isNumeric(pr_rank));
    }


    private SegmentEffort function getSegmentEffort() {
    	return variables.SegmentEffort;
    }

}