import strava.v3.model.*;

component displayname="StravaService" accessors="true" output="false" {

    property name="endpoint" default="https://www.strava.com/api/v3";

    /*
     * returns an instance of StravaService
     **/
    public StravaService function init() {
       return this;
    }

    /*
     * returns the current authenticated athlete
     * 
     * @param token the OAuth token for athlete
     **/
    public Athlete function currentAthlete(
        required string token
    ) {
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athlete','');
        var response = req.execute();
        return new Athlete(argumentCollection=DeserializeJson(response.fileContent));
    }

    /*
     * returns array of activities for the current athlete
     * 
     * @param token the OAuth token for athlete
     * @param startDate the date to retrieve activities since
     **/
    public any function athleteActivities(
        required string token,
        required date startDate,
        array activities
    ) {
        var local.activities = (structKeyExists(arguments,'activities') ? arguments.activities : []);
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athlete','');
        req.addQueryParam('activities','');
        req.setQueryString('after=' & getUnixEpoch(arguments.startDate));
        var response = req.execute();
        var payload = DeserializeJson(response.fileContent);
        if (response.status_code == '200') {
        	for (var activity in payload) {
                ArrayAppend(local.activities, new Activity(argumentCollection=activity));
            }
            // make a recursive call if we get a return of the maximum 30 activities
	        if (ArrayLen(payload) eq 30) {
	            var nextStart = activities[ArrayLen(activities)].getStartDate();
	            local.activities = athleteActivities(token=arguments.token,startDate=nextStart,activities=local.activities);
	        }
        }
        return local.activities;
    }

    /*
     * @hint returns an athlete by id
     **/
    public Athlete function findAthlete(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athletes',arguments.id);
        var response = req.execute();
        return new Athlete(argumentCollection=DeserializeJson(response.fileContent));
    }

    /*
     * @hint returns an array of kom SegmentEfort by athlete id
     **/
    public array function findAthleteKOMs(
        required string token,
        required numeric id
    ) {
        var koms = [];
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athletes',arguments.id);
        req.addQueryParam('koms','');
        var response = req.execute();
        for (var segmentEffort in DeserializeJson(response.fileContent)) {
            ArrayAppend(koms, new SegmentEffort(argumentCollection=activity));
        }
        return koms;
    }

    /*
     * @hint returns athlete Totals instance by athlete id
     **/
    public Totals function findAthleteTotals(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athletes',arguments.id);
        req.addQueryParam('stats','');
        var response = req.execute();
        return new Totals(argumentCollection=DeserializeJson(response.fileContent));
    }

     /*
     * returns an Activity by id
     **/
    public Activity function findActivity(
        required string token,
        required numeric id
    ) {
        var activities = [];
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('activities',arguments.id);
        var response = req.execute();
        return new Activity(argumentCollection=DeserializeJson(response.fileContent));
    }

    public array function listActivitiesFollowing(
        required string token,
        required date startDate
    ) {
        var activities = [];
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('activities','');
        req.addQueryParam('following','');
        req.setQueryString('after=' & getUnixEpoch(arguments.startDate));
        var response = req.execute();
        for (var activity in DeserializeJson(response.fileContent)) {
            ArrayAppend(activities, new Activity(argumentCollection=activity));
        }
        return activities;
    }

    public any function findActivityLaps(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('laps','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return response.fileContent;
    }

    public any function findActivityZones(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('zones','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return response.fileContent;
    }

    public array function listActivityComments(
        required string token,
        required numeric id
    ) {
        var comments = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('comments','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        for (var comment in DeserializeJson(response.fileContent)) {
            ArrayAppend(comments, new Comment(argumentCollection=comment));
        }
        return comments;
    }

    public array function listActivityKudos(
        required string token,
        required numeric id
    ) {
        var kudoers = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('kudos','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        for (var athlete in DeserializeJson(response.fileContent)) {
            ArrayAppend(kudoers, new Athlete(argumentCollection=athlete));
        }
        return kudoers;
    }

   public array function listActivityPhotos(
        required string token,
        required numeric id
    ) {
        var photos = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('photos','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
	        for (var photo in DeserializeJson(response.fileContent)) {
	            ArrayAppend(photos, new Athlete(argumentCollection=photo));
	        }
        }
        return photos;
    }

    public array function listActivityStreams(
        required string token,
        required numeric id,
        string types='distance'
    ) {
        var streams = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('streams',arguments.types);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var stream in DeserializeJson(response.fileContent)) {
                ArrayAppend(streams, new Activity(argumentCollection=stream));
            }
        }
        return streams;
    }

    public Club function findClub(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addQueryParam('clubs',arguments.id);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return new Club(argumentCollection=DeserializeJSON(response.fileContent));
    }

    public array function listAthleteClubs(
        required string token
    ) {
        var clubs = [];
        var req = newRequest(method='GET');
        req.addQueryParam('athlete','');
        req.addQueryParam('clubs','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
        	for (var club in DeserializeJson(response.fileContent)) {
	            ArrayAppend(clubs, new Club(argumentCollection=club));
	        }
        }
        return clubs;
    }

    public array function listClubMembers(
        required string token,
        required numeric id
    ) {
        var members = [];
        var req = newRequest(method='GET');
        req.addQueryParam('clubs',arguments.id);
        req.addQueryParam('members','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var member in DeserializeJson(response.fileContent)) {
                ArrayAppend(members, new Athlete(argumentCollection=member));
            }
        }
        return members;
    }

    public array function listClubActivities(
        required string token,
        required numeric id
    ) {
        var activities = [];
        var req = newRequest(method='GET');
        req.addQueryParam('clubs',arguments.id);
        req.addQueryParam('activities','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var activity in DeserializeJson(response.fileContent)) {
                ArrayAppend(activities, new Activity(argumentCollection=activity));
            }
        }
        return activities;
    }

    public Gear function findGear(
        required string token,
        required string id
    ) {
    	var req = newRequest(method='GET');
        req.addQueryParam('gear',arguments.id);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return new Gear(argumentCollection=DeserializeJSON(response.fileContent));
    }

    public Segment function findSegment(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addQueryParam('segments',arguments.id);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return new Segment(argumentCollection=DeserializeJSON(response.fileContent));
    }

    public array function listSegmentEfforts(
        required string token,
        required numeric id,
        numeric perPage=10
    ) {
        var req = newRequest(method='GET');
        var segmentEfforts = [];
        req.addQueryParam('segments',arguments.id);
        req.addQueryParam('all_efforts','');
        req.setQueryString('per_page=' & arguments.perPage);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
	         for (var segmentEffort in DeserializeJson(response.fileContent)) {
	             ArrayAppend(segmentEfforts, new SegmentEffort(argumentCollection=segmentEffort));
	         }
        }
        return segmentEfforts;
    }

    public array function listSegmentEffortsForAthlete(
        required string token,
        required numeric id,
        required numeric athleteId,
        numeric perPage=10
    ) {
        var req = newRequest(method='GET');
        var segmentEfforts = [];
        req.addQueryParam('segments',arguments.id);
        req.addQueryParam('all_efforts','');
        req.setQueryString('athlete_id=' & arguments.athleteId & '&per_page=' & arguments.perPage);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
             for (var segmentEffort in DeserializeJson(response.fileContent)) {
                 ArrayAppend(segmentEfforts, new SegmentEffort(argumentCollection=segmentEffort));
             }
        }
        return segmentEfforts;
    }

    public LeaderBoard function findSegmentLeaderboard(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        var segmentEfforts = [];
        req.addQueryParam('segments',arguments.id);
        req.addQueryParam('leaderboard','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return new LeaderBoard(argumentCollection=DeserializeJson(response.fileContent));
    }

    public array function listSegmentStreams(
        required string token,
        required numeric id,
        string types='distance'
    ) {
        var req = newRequest(method='GET');
        var streams = [];
        req.addQueryParam('segments',arguments.id);
        req.addQueryParam('streams',arguments.types);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var stream in DeserializeJson(response.fileContent)) {
                ArrayAppend(streams, new Stream(argumentCollection=stream));
            }
        }
        return streams;
    }

    public array function listStarredSegments(
        required string token
    ) {
        var req = newRequest(method='GET');
        var segments = [];
        req.addQueryParam('segments','starred');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var segment in DeserializeJson(response.fileContent)) {
                ArrayAppend(segments, new Segment(argumentCollection=segment));
            }
        }
        return segments;
    }

    public SegmentEffort function findSegmentEffort(
        required string token,
        required numeric id
    ) {
        var req = newRequest(method='GET');
        req.addQueryParam('segment_efforts',arguments.id);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        return new SegmentEffort(argumentCollection=DeserializeJSON(response.fileContent));
    }

    public array function listSegmentEffortStreams(
        required string token,
        required numeric id,
        string types='distance'
    ) {
        var req = newRequest(method='GET');
        var streams = [];
        req.addQueryParam('segment_efforts',arguments.id);
        req.addQueryParam('streams',arguments.types);
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == 200) {
            for (var stream in DeserializeJson(response.fileContent)) {
                ArrayAppend(streams, new Stream(argumentCollection=stream));
            }
        }
        return streams;
    }

    /*
     * @hint returns the seconds from 1970-01-01 00:00:00 UTC to startDate (converted to UTC)
     **/
    private numeric function getUnixEpoch(
        required date startDate
    ) {
    	return LSNumberFormat(DateDiff('s',DateConvert('local2utc','1970-01-01 00:00:00'),DateConvert('local2utc',arguments.startDate)),'_');
    }

    /*
     * @hint returns an HttpRequest instance
     **/
    private HttpRequest function newRequest(
        required string method
    ) {
        return new HttpRequest(requestUrl=getEndpoint(),method=arguments.method);
    }

}