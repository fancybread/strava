import strava.v3.model.Club;

component displayname="ClubTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.club ='{
  "id": 1,
  "resource_state": 3,
  "name": "Team Strava Cycling",
  "profile_medium": "http://pics.com/clubs/1/medium.jpg",
  "profile": "http://pics.com/clubs/1/large.jpg",
  "description": "From the people who brought you strava.com",
  "club_type": "company",
  "sport_type": "cycling",
  "city": "San Francisco",
  "state": "California",
  "country": "United States",
  "private": false,
  "member_count": 71
}';
        variables.club = new Club(argumentCollection=DeserializeJson(local.club));
    }


    public void function getIdReturnsNumeric() {
        var id = getClub().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 1);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getClub().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 3);
    }

    public void function getNameReturnsString() {
        var name = getClub().getName();
        assertTrue(IsSimpleValue(name));
        assertTrue(name == "Team Strava Cycling");
    }

    public void function getProfileMediumReturnsString() {
        var profile_medium = getClub().getProfileMedium();
        assertTrue(IsSimpleValue(profile_medium));
        assertTrue(profile_medium == "http://pics.com/clubs/1/medium.jpg");
    }

    public void function getProfileReturnsString() {
        var profile = getClub().getProfile();
        assertTrue(IsSimpleValue(profile));
        assertTrue(profile == "http://pics.com/clubs/1/large.jpg");
    }

    public void function getDescriptionReturnsString() {
        var description = getClub().getDescription();
        assertTrue(IsSimpleValue(description));
        assertTrue(description == 'From the people who brought you strava.com');
    }

    public void function getClubTypeReturnsString() {
        var club_type = getClub().getClubType();
        debug(club_type);
        assertTrue(IsSimpleValue(club_type));
        assertTrue(club_type == 'company');
    }

    public void function getSportTypeReturnsString() {
        var sport_type = getClub().getSportType();
        assertTrue(IsSimpleValue(sport_type));
        assertTrue(sport_type == 'cycling');
    }

    public void function getCityReturnsString() {
        var city = getClub().getCity();
        assertTrue(IsSimpleValue(city));
        assertTrue(city == 'San Francisco');
    }

    public void function getStateReturnsString() {
        var state = getClub().getState();
        assertTrue(IsSimpleValue(state));
        assertTrue(state == 'California');
    }

    public void function getCountryReturnsString() {
        var country = getClub().getCountry();
        assertTrue(IsSimpleValue(country));
        assertTrue(country == 'United States');
    }

    public void function getPrivateReturnsBoolean() {
        var private = getClub().getPrivate();
        assertTrue(IsBoolean(private));
        assertFalse(private);
    }


    // private

    private Club function getClub() {
       return variables.club;
    }

}