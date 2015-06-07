import strava.v3.model.Athlete;

component displayname="AthleteTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.athleteDetail ='{
          "id": 227615,
          "resource_state": 3,
          "firstname": "John",
          "lastname": "Applestrava",
          "profile_medium": "http://pics.com/227615/medium.jpg",
          "profile": "http://pics.com/227615/large.jpg",
          "city": "San Francisco",
          "state": "California",
          "country": "United States",
          "sex": "M",
          "friend": null,
          "follower": null,
          "premium": true,
          "created_at": "2008-01-01T17:44:00Z",
          "updated_at": "2013-09-04T20:00:50Z",
          "follower_count": 273,
          "friend_count": 19,
          "mutual_friend_count": 0,
          "date_preference": "%m/%d/%Y",
          "measurement_preference": "feet",
          "email": "john@applestrava.com",
          "ftp": 280,
          "clubs": [
            {
              "id": 1,
              "resource_state": 2,
              "name": "Team Strava Cycling",
              "profile_medium": "http://pics.com/clubs/1/medium.jpg",
              "profile": "http://pics.com/clubs/1/large.jpg"
            }
          ],
          "bikes": [
            {
              "id": "b105763",
              "primary": false,
              "name": "Cannondale TT",
              "distance": 476612.9,
              "resource_state": 2
            },
            {
              "id": "b105762",
              "primary": true,
              "name": "Masi",
              "distance": 9000578.2,
              "resource_state": 2
            }
          ],
          "shoes": [
            {
              "id": "g1",
              "primary": true,
              "name": "Running Shoes",
              "distance": 67492.9,
              "resource_state": 2
            }
          ]
        }';
        local.athleteSummary='{
          "id": 227615,
          "resource_state": 2,
          "firstname": "John",
          "lastname": "Applestrava",
          "profile_medium": "http://pics.com/227615/medium.jpg",
          "profile": "http://pics.com/227615/large.jpg",
          "city": "San Francisco",
          "state": "California",
          "country": "United States",
          "sex": "M",
          "friend": null,
          "follower": null,
          "premium": true,
          "created_at": "2008-01-01T17:44:00Z",
          "updated_at": "2013-09-04T20:00:50Z",
          "approve_followers": null
        }';
        variables.athleteDetailed = new Athlete(argumentCollection=DeserializeJson(local.athleteDetail));
        variables.athleteSummary = new Athlete(argumentCollection=DeserializeJson(local.athleteSummary));
    }

    public void function getIdReturnsNumeric() {
        var id = getAthleteSummary().getId();
        assertTrue(IsNumeric(id));
    }

	public void function getResourceStateReturnsNumeric() {
        var resourceState = getAthleteSummary().getResourceState();
        debug(resourceState);
        assertTrue(IsNumeric(resourceState));
		assertTrue(resourceState == 2);
		resourceState = getAthleteDetailed().getResourceState();
		debug(resourceState);
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 3);
    }

    public void function getFirstnameReturnsString() {
        var firstname = getAthleteSummary().getFirstname();
        assertTrue(isSimpleValue(firstname));
        assertTrue(firstname == 'John');
    }

    public void function getLastnameReturnsString() {
        var lastname = getAthleteSummary().getLastname();
        assertTrue(isSimpleValue(lastname));
        assertTrue(lastname == 'Applestrava');
    }

    public void function getProfileMediumReturnsString() {
        var profile_medium = getAthleteSummary().getProfileMedium();
        debug(profile_medium);
        assertTrue(isSimpleValue(profile_medium));
        assertTrue(profile_medium == 'http://pics.com/227615/medium.jpg');
    }

    public void function getProfileReturnsString() {
        var profile = getAthleteSummary().getProfile();
        assertTrue(isSimpleValue(profile));
        assertTrue(profile == 'http://pics.com/227615/large.jpg');
    }

    public void function getCityReturnsString() {
        var city = getAthleteSummary().getCity();
        assertTrue(isSimpleValue(city));
        assertTrue(city == 'San Francisco');
    }

    public void function getStateReturnsString() {
        var state = getAthleteSummary().getState();
        assertTrue(isSimpleValue(state));
        assertTrue(state == 'California');
    }

    public void function getCountryReturnsString() {
        var country = getAthleteSummary().getCountry();
        assertTrue(isSimpleValue(country));
        assertTrue(country == 'United States');
    }

    public void function getSexReturnsString() {
        var sex = getAthleteSummary().getSex();
        assertTrue(isSimpleValue(sex));
        assertTrue(sex == 'Male');
    }

    public void function getFriendReturnsNull() {
        assertTrue(isNull(getAthleteSummary().getFriend()));
    }

    public void function getFollowerReturnsNull() {
        assertTrue(isNull(getAthleteSummary().getFollower()));
    }

    public void function getPremiumReturnsBoolean() {
        var premium = getAthleteSummary().getPremium();
        assertTrue(premium);
    }

    public void function getCreatedAtReturnsString() {
        var created_at = getAthleteSummary().getCreatedAt();
        assertTrue(isSimpleValue(created_at));
        assertTrue(created_at == '2008-01-01T17:44:00Z');
    }

    public void function getUpdatedAtReturnsString() {
        var updated_at = getAthleteSummary().getUpdatedAt();
        assertTrue(isSimpleValue(updated_at));
        assertTrue(updated_at == '2013-09-04T20:00:50Z');
    }

    public void function getFollowerCountReturnsNumeric() {
        var follower_count = getAthleteDetailed().getFollowerCount();
        debug(follower_count);
        assertTrue(isNumeric(follower_count));
        assertTrue(follower_count == 273);
    }

    public void function getFriendCountReturnsNumeric() {
        var friend_count = getAthleteDetailed().getFriendCount();
        debug(friend_count);
        assertTrue(isNumeric(friend_count));
        assertTrue(friend_count == 19);
    }

    public void function getBikesReturnsArray() {
        //test detailed athlete
        var bikes = getAthleteDetailed().getBikes();
        debug(bikes);
        assertTrue(isArray(bikes));
        assertTrue(ArrayLen(bikes) == 2);
        //test summary athlete
        bikes = getAthleteSummary().getBikes();
        debug(bikes);
        assertTrue(isArray(bikes));
        assertTrue(ArrayLen(bikes) == 0);
    }

    public void function getClubsReturnsArray() {
        //test detailed athlete
		var clubs = getAthleteDetailed().getClubs();
		debug(clubs);
        assertTrue(isArray(clubs));
        assertTrue(ArrayLen(clubs) == 1);
		//test summary athlete
		clubs = getAthleteSummary().getClubs();
        debug(clubs);
        assertTrue(isArray(clubs));
        assertTrue(ArrayLen(clubs) == 0);
    }

    public void function getShoesReturnsArray() {
        //test detailed athlete
        var shoes = getAthleteDetailed().getShoes();
        debug(shoes);
        assertTrue(isArray(shoes));
        assertTrue(ArrayLen(shoes) == 1);
        //test summary athlete
        shoes = getAthleteSummary().getShoes();
        debug(shoes);
        assertTrue(isArray(shoes));
        assertTrue(ArrayLen(shoes) == 0);
    }

    // private

    private Athlete function getAthleteDetailed() {
       return variables.athleteDetailed;
    }

    private Athlete function getAthleteSummary() {
       return variables.athleteSummary;
    }

}