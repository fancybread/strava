import strava.v3.model.Segment;

component displayname="SegmentTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.segment ='{
		  "id": 229781,
		  "resource_state": 3,
		  "name": "Hawk Hill",
		  "activity_type": "Ride",
		  "distance": 2684.82,
		  "average_grade": 5.7,
		  "maximum_grade": 14.2,
		  "elevation_high": 245.3,
		  "elevation_low": 92.4,
		  "start_latlng": [
		    37.8331119,
		    -122.4834356
		  ],
		  "end_latlng": [
		    37.8280722,
		    -122.4981393
		  ],
		  "climb_category": 1,
		  "city": "San Francisco",
		  "state": "CA",
		  "country": "United States",
		  "private": false,
		  "starred": false,
		  "created_at": "2008-01-01T17:44:00Z",
		  "updated_at": "2013-09-04T20:00:50Z",
		  "total_elevation_gain": 155.7,
		  "map": {
		    "id": "s229781",
		    "polyline": "}g|e...VJr@",
		    "resource_state": 3
		  },
		  "effort_count": 51335,
		  "athlete_count": 7036,
		  "hazardous": false,
		  "star_count": 0
		}';
        variables.segment = new Segment(argumentCollection=DeserializeJson(local.segment));
    }

    public void function getIdReturnsNumeric() {
        var id = getSegment().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 229781);
    }

    public void function getPrivateReturnsBoolean() {
        var private = getSegment().getPrivate();
        assertTrue(IsBoolean(private));
        assertFalse(private);
    }

    public void function getNameReturnsString() {
        var name = getSegment().getName();
        assertTrue(IsSimpleValue(name));
        assertTrue(name == 'Hawk Hill');
    }

    public void function getDistanceReturnsNumeric() {
        var distance = getSegment().getDistance();
        assertTrue(IsNumeric(distance));
        assertTrue(distance == 2684.82);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getSegment().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 3);
    }

    // private

    private Segment function getSegment() {
       return variables.segment;
    }

}