import strava.v3.model.*;

component displayname="StravaService" accessors="true" output="false" {

    property name="endpoint" default="https://www.strava.com/api/v3";

    /**
	 * returns an instance of StravaService
     **/
    public StravaService function init() {
       return this;
    }

    /**
     * returns the current authenticated athlete
     * 
     * @token.hint  the OAuth token for athlete
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

    /**
     * returns an array of activities for the current athlete
     * 
     * @token.hint the OAuth token for athlete
     * @startDate.hint the start date to retrieve activities from
     * @activities.hint an array of activiites if method is invoked recursively
     **/
    public any function athleteActivities(
        required string token,
        required date startDate,
        array activities=[]
    ) {
        var epoch = getUnixEpoch(arguments.startDate);
        var req = newRequest(method='GET');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        req.addQueryParam('athlete','');
        req.addQueryParam('activities','');
        req.setQueryString('after=' & epoch);
        var response = req.execute();
        var payload = DeserializeJson(response.fileContent);
        if (response.status_code == '200') {
        	for (var activity in payload) {
        	   ArrayAppend(arguments.activities, new Activity(argumentCollection=activity));
            }
            // make a recursive call if we get a return of the maximum 30 activities
	        if (ArrayLen(payload) eq 30) {
	            var lastActivity = arguments.activities.last();
	            var nextStart = DateAdd('s',lastActivity.getElapsedTime(),lastActivity.getStartDate());
	            local.activities = athleteActivities(token=arguments.token,startDate=nextStart,activities=arguments.activities);
	        }
        }
        return arguments.activities;
    }

    /**
     * returns an athlete by id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Athlete id
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

    /**
     * returns an array of kom SegmentEfort by athlete id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Athlete id
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

    /**
     * returns athlete Totals instance by athlete id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Athlete id
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

     /**
     * returns an Activity by id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Activity id
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

    /**
     * returns an array of activities for athletes that the authenticated athlete follows
     * 
     * @token.hint the OAuth token for athlete
     * @startDate.hint the start date to retrieve activities from
     **/
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

    /**
     * returns an array of lap efforts for activity
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     **/
    public array function findActivityLaps(
        required string token,
        required numeric id
    ) {
        var activityLaps = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('laps','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        for (var lap in DeserializeJson(response.fileContent)) {
            ArrayAppend(activityLaps, new LapEffort(argumentCollection=lap));
        }
        return activityLaps;
    }

    /**
     * returns an array of activity zones (heartrate|power) by activity id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     **/
    public array function findActivityZones(
        required string token,
        required numeric id
    ) {
        var activityZones = [];
        var req = newRequest(method='GET');
        req.addQueryParam('activities',arguments.id);
        req.addQueryParam('zones','');
        req.addHeader('Authorization','Bearer ' & arguments.token);
        var response = req.execute();
        if (response.status_code == '200') {
            for (var zone in DeserializeJson(response.fileContent)) {
                ArrayAppend(activityZones, new ActivityZone(argumentCollection=zone));
            }
        }
        return activityZones;
    }

    /**
     * returns an array of comments by activity id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     **/
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

    /**
     * returns an array of athletes who have  by activity id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     **/
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

    /**
     * returns an array of Photos by activity id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     **/
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

    /**
     * returns an array of Activity Streams by activity id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the activity id
     * @types.hint the Stream type
     **/
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

    /**
     * returns a Club instance by club id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the club id
     **/
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

    /**
     * returns a an array of Club instances for the authenticated athlete
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the club id
     **/
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

    /**
     * returns a an array of Athlete instances by club id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the club id
     **/
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

    /**
     * returns a an array of Activity instances by club id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the club id
     **/
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

    /**
     * returns a Gear instances by id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Gear id
     **/
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

    /**
     * returns a Segment instance by id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Segemnt id
     **/
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

    /**
     * returns an array of SegmentEffort instances by Segment id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Segemnt id
     * @perPage.hint the number of instances to return
     **/
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

    /**
     * returns an array of SegmentEffort instances by Segment and Athlete ids
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Segemnt id
     * @athleteId.hint the Athlete id
     * @perPage.hint the number of instances to return
     **/
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

    /**
     * returns a LeaderBoard instance by Segment id
     * 
     * @token.hint the OAuth token for athlete
     * @id.hint the Segemnt id
     **/
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

    /**
     * returns an array of Streams by SegmentEffort id
     * 
     * @token.hint the OAuth token
     * @id.hint the SegmentEffort id
     * @types.hint the stream types
     **/
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

    /**
     * returns an array of Segments for the authentocated athlete
     * 
     * @token.hint the OAuth token
     **/
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

    /**
     * returns a SegmentEffort by id
     * 
     * @token.hint the OAuth token
     * @id.hint the SegmentEffort id
     **/
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

    /**
     * returns an array of Streams by SegmentEffort id
     * 
     * @token.hint the OAuth token
     * @id.hint the SegmentEffort id
     * @types.hint the stream types
     **/
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

    /**
     * returns the seconds from 1970-01-01 00:00:00 UTC to startDate (converted to UTC)
     * 
     * @startDate.hint the start date
     **/
    private numeric function getUnixEpoch(
        required date startDate
    ) {
    	return LSNumberFormat(DateDiff('s',DateConvert('local2utc','1970-01-01 00:00:00'),DateConvert('local2utc',arguments.startDate)),'_');
    }

    /**
     * returns an HttpRequest instance
     * 
     * @method.hint the request method (GET|POST|PUT|DELETE)
     **/
    private HttpRequest function newRequest(
        required string method
    ) {
        return new HttpRequest(requestUrl=getEndpoint(),method=arguments.method);
    }

}