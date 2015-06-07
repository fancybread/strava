import strava.v3.model.Activity;

component displayname="Test" output="false" extends="mxunit.framework.TestCase" {

	public void function setUp() {
	    local.activity='{
		  "id": 321934,
		  "resource_state": 3,
		  "external_id": "2012-12-12_21-40-32-80-29011.fit",
		  "upload_id": 361720,
		  "athlete": {
		    "id": 227615,
		    "resource_state": 1
		  },
		  "name": "12/12/2012 San Francisco",
		  "description": "the best ride ever",
		  "distance": 1600,
		  "moving_time": 2160,
		  "elapsed_time": 2280,
		  "total_elevation_gain": 8.6,
		  "type": "Swim",
		  "start_date": "2012-12-13T03:43:19Z",
		  "start_date_local": "2012-12-12T19:43:19Z",
		  "timezone": "(GMT-08:00) America/Los_Angeles",
		  "start_latlng": [
		    37.8,
		    -122.27
		  ],
		  "end_latlng": [
		    37.8,
		    -122.27
		  ],
		  "location_city": "San Francisco",
		  "location_state": "CA",
		  "location_country": "United States",
		  "achievement_count": 6,
		  "kudos_count": 1,
		  "comment_count": 1,
		  "athlete_count": 1,
		  "photo_count": 0,
		  "map": {
		    "id": "a32193479",
		    "polyline": "kiteFpCBCD]",
		    "summary_polyline": "{cteFjcaBkCx@gEz@",
		    "resource_state": 3
		  },
		  "trainer": false,
		  "commute": false,
		  "manual": false,
		  "private": false,
		  "flagged": false,
		  "workout_type": 2,
		  "gear": {
		    "id": "g138727",
		    "primary": true,
		    "name": "Nike Air",
		    "distance": 88983.1,
		    "resource_state": 2
		  },
		  "average_speed": 3.4,
		  "max_speed": 4.514,
		  "calories": 390.5,
		  "truncated": 73,
		  "has_kudoed": false,
		  "segment_efforts": [
		    {
		      "id": 543755075,
		      "resource_state": 2,
		      "name": "Dash for the Ferry",
		      "segment": {
		        "id": 2417854,
		        "resource_state": 2,
		        "name": "Dash for the Ferry",
		        "activity_type": "Run",
		        "distance": 1055.11,
		        "average_grade": -0.1,
		        "maximum_grade": 2.7,
		        "elevation_high": 4.7,
		        "elevation_low": 2.7,
		        "start_latlng": [
		          37.7905785,
		          -122.27015622
		        ],
		        "end_latlng": [
		          37.79536649,
		          -122.2796434
		        ],
		        "climb_category": 0,
		        "city": "Oakland",
		        "state": "CA",
		        "country": "United States",
		        "private": false
		      },
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": 2,
		      "pr_rank": 1,
		      "elapsed_time": 304,
		      "moving_time": 304,
		      "start_date": "2012-12-13T03:48:14Z",
		      "start_date_local": "2012-12-12T19:48:14Z",
		      "distance": 1052.33,
		      "start_index": 5348,
		      "end_index": 6485,
		      "hidden": false
		    }
		  ],
		  "splits_metric": [
		    {
		      "distance": 1002.5,
		      "elapsed_time": 276,
		      "elevation_difference": 0,
		      "moving_time": 276,
		      "split": 1
		    },
		    {
		      "distance": 1000.4,
		      "elapsed_time": 291,
		      "elevation_difference": 2.2,
		      "moving_time": 291,
		      "split": 2
		    },
		    {
		      "distance": 1000.4,
		      "elapsed_time": 319,
		      "elevation_difference": 2.2,
		      "moving_time": 289,
		      "split": 3
		    },
		    {
		      "distance": 998.2,
		      "elapsed_time": 308,
		      "elevation_difference": 4.2,
		      "moving_time": 308,
		      "split": 4
		    },
		    {
		      "distance": 475.7,
		      "elapsed_time": 139,
		      "elevation_difference": 0,
		      "moving_time": 139,
		      "split": 5
		    }
		  ],
		  "splits_standard": [
		    {
		      "distance": 1611.2,
		      "elapsed_time": 455,
		      "elevation_difference": 2.2,
		      "moving_time": 455,
		      "split": 1
		    },
		    {
		      "distance": 1610.1,
		      "elapsed_time": 496,
		      "elevation_difference": 3.2,
		      "moving_time": 466,
		      "split": 2
		    },
		    {
		      "distance": 1255.9,
		      "elapsed_time": 382,
		      "elevation_difference": 3.2,
		      "moving_time": 382,
		      "split": 3
		    }
		  ],
		  "best_efforts": [
		    {
		      "id": 273063933,
		      "resource_state": 2,
		      "name": "400m",
		      "segment": null,
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": null,
		      "pr_rank": 1,
		      "elapsed_time": 105,
		      "moving_time": 106,
		      "start_date": "2012-12-13T03:43:19Z",
		      "start_date_local": "2012-12-12T19:43:19Z",
		      "distance": 400
		    },
		    {
		      "id": 273063935,
		      "resource_state": 2,
		      "name": "1/2 mile",
		      "segment": null,
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": null,
		      "pr_rank": 1,
		      "elapsed_time": 219,
		      "moving_time": 220,
		      "start_date": "2012-12-13T03:43:19Z",
		      "start_date_local": "2012-12-12T19:43:19Z",
		      "distance": 805
		    },
		    {
		      "id": 273063937,
		      "resource_state": 2,
		      "name": "1k",
		      "segment": null,
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": null,
		      "pr_rank": 1,
		      "elapsed_time": 275,
		      "moving_time": 276,
		      "start_date": "2012-12-13T03:43:19Z",
		      "start_date_local": "2012-12-12T19:43:19Z",
		      "distance": 1000
		    },
		    {
		      "id": 273063939,
		      "resource_state": 2,
		      "name": "1 mile",
		      "segment": null,
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": null,
		      "pr_rank": 1,
		      "elapsed_time": 454,
		      "moving_time": 455,
		      "start_date": "2012-12-13T03:43:19Z",
		      "start_date_local": "2012-12-12T19:43:19Z",
		      "distance": 1609
		    },
		    {
		      "id": 273063941,
		      "resource_state": 2,
		      "name": "2 miles",
		      "segment": null,
		      "activity": {
		        "id": 32193479
		      },
		      "athlete": {
		        "id": 3776
		      },
		      "kom_rank": null,
		      "pr_rank": 1,
		      "elapsed_time": 950,
		      "moving_time": 921,
		      "start_date": "2012-12-13T03:43:19Z",
		      "start_date_local": "2012-12-12T19:43:19Z",
		      "distance": 3219
		    }
		  ]
		}';
    	variables.activity = new Activity(argumentCollection=DeserializeJson(local.activity));
	}

 	public void function getAthleteReturnsStruct() {
		var activity = getActivity();
		debug(activity);
		athlete = activity.getAthlete();
		assertTrue(IsStruct(athlete));
	}

	public void function getNameReturnsString() {
		var name = getActivity().getName();
		debug(name);
		assertTrue(IsSimpleValue(name));
	}

	public void function getDescriptionReturnsString() {
		var description = getActivity().getDescription();
		debug(description);
		assertTrue(IsSimpleValue(description));
	}

	public void function getDistanceReturnsNumber() {
		var distance = getActivity().getDistance();
		debug(distance);
		assertTrue(IsNumeric(distance));
	}

    public void function getStartDateReturnsString() {
        var startDate = getActivity().getStartDate();
        assertTrue(IsSimpleValue(startDate));
        assertTrue(IsDate(startDate));
    }
    
	public void function getMovingTimeReturnsNumber() {
		var movingTime = getActivity().getMovingTime();
		debug(movingTime);
		assertTrue(IsNumeric(movingTime));
	}

	public void function getElapsedTimeReturnsNumber() {
		var elapsedTime = getActivity().getElapsedTime();
		debug(elapsedTime);
		assertTrue(IsNumeric(elapsedTime));
	}

    public void function getTypeReturnsString() {
        var type = getActivity().getType();
        debug(type);
        assertTrue(IsSimpleValue(type));
	}

    public void function getAverageSpeedReturnsNumeric() {
        var speed = getActivity().getAverageSpeed();
        debug(speed);
        assertTrue(IsNumeric(speed));
	}

    public void function getTimeOverDistanceReturnsNumeric() {
        var time = getActivity().getTimeOverDistance(100);
        debug(time);
        assertTrue(IsNumeric(time));
	}

	private Activity function getActivity() {
		return variables.activity;
	}
}