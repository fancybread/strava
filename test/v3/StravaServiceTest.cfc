import strava.v3.StravaService;

component displayname="ServiceTest" output="false" extends="mxunit.framework.TestCase" {

    public void function beforeTests() {
        variables.accessToken = 'a5329a30405ef550523191657059a768d48be972';
        variables.athleteId = 5595967;
        variables.activityId = 261228193;
        variables.clubId = 127185;
        variables.gearId = 'b1417739';
        variables.segmentId = 7223723;
        variables.segmentEffortId = 6116943932;
    }

    public void function setUp() {
    	variables.stravaService = new StravaService();
    }

    public void function currentAthleteReturnsAthlete() {
        var athlete = getStravaService().currentAthlete(token=variables.accessToken);
        assertTrue(IsObject(athlete));
        assertTrue(getMetaData(athlete).name == 'strava.v3.model.Athlete')
    }

    public void function findAthleteReturnsAthlete() {
        var athlete = getStravaService().findAthlete(token=variables.accessToken,id=variables.athleteId);
        assertTrue(IsObject(athlete));
        assertTrue(getMetaData(athlete).name == 'strava.v3.model.Athlete');
    }

    public void function findAthleteKOMsReturnsArray() {
        var koms = getStravaService().findAthleteKOMs(token=variables.accessToken,id=variables.athleteId);
        assertTrue(isArray(koms));
    }

    public void function findAthleteTotalsReturnsTotals() {
        var totals = getStravaService().findAthleteTotals(token=variables.accessToken,id=variables.athleteId);
        assertTrue(isObject(totals));
        assertTrue(getMetaData(totals).name == 'strava.v3.model.Totals');
    }

    public void function athleteActivitiesReturnsArray() {
    	var startDate = DateAdd('d',-56,now());
        var activities = getStravaService().athleteActivities(token=variables.accessToken,startDate=startDate);
        debug(arraylen(activities));
        for (var activity in activities) {
            debug(activity.getId());
            debug(activity.getStartDate());
        }
        assertTrue(isArray(activities));
    }

    public void function findActivityReturnsActivity() {
        var activity = getStravaService().findActivity(token=variables.accessToken,id=variables.activityId);
        assertTrue(isObject(activity));
        assertTrue(getMetaData(activity).name == 'strava.v3.model.Activity');
    }

    public void function listAthleteClubsReturnsArray() {
        var clubs = getStravaService().listAthleteClubs(token=variables.accessToken,id=variables.activityId);
        debug(clubs);
        assertTrue(isArray(clubs));
    }

    public void function listActivityStreamsReturnsArray() {
        var streams = getStravaService().listActivityStreams(token=variables.accessToken,id=variables.activityId);
        debug(streams);
        assertTrue(isArray(streams));
    }

    public void function listActivitiesFollowingReturnsArray() {
        var startDate = DateAdd('d',-7,now());
        var activities = getStravaService().listActivitiesFollowing(token=variables.accessToken,startDate=startDate);
        debug(activities);
        assertTrue(isArray(activities));
    }

    public void function findActivityLapsReturnsArray() {
        var laps = getStravaService().findActivityLaps(token=variables.accessToken,id=variables.activityId);
        debug(laps);
        assertTrue(isArray(laps));
    }

    public void function findActivityZonesReturnsJSON() {
        var zones = getStravaService().findActivityZones(token=variables.accessToken,id=variables.activityId);
        debug(zones);
        assertTrue(isArray(zones));
    }

    public void function listActivityCommentsReturnsArray() {
        var comments = getStravaService().listActivityComments(token=variables.accessToken,id=variables.activityId);
        debug(comments);
        assertTrue(isArray(comments));
    }

    public void function listActivityKudosReturnsArray() {
        var kudoers = getStravaService().listActivityKudos(token=variables.accessToken,id=variables.activityId);
        debug(kudoers);
        assertTrue(isArray(kudoers));
    }

    public void function listActivityPhotosReturnsArray() {
        var photos = getStravaService().listActivityPhotos(token=variables.accessToken,id=variables.activityId);
        debug(photos);
        assertTrue(isArray(photos));
    }

    public void function findClubReturnsClub() {
        var club = getStravaService().findClub(token=variables.accessToken,id=variables.clubId);
        debug(club);
        assertTrue(isObject(club));
    }

    public void function listClubMembersReturnsArray() {
        var members = getStravaService().listClubMembers(token=variables.accessToken,id=variables.clubId);
        debug(members);
        assertTrue(isArray(members));
    }

    public void function listClubActivitiesReturnsArray() {
        var activities = getStravaService().listClubActivities(token=variables.accessToken,id=variables.clubId);
        debug(activities);
        assertTrue(isArray(activities));
    }

    public void function findGearReturnsGear() {
        var gear = getStravaService().findGear(token=variables.accessToken,id=variables.gearId);
        debug(gear.getMemento());
        assertTrue(isObject(gear));
    }

    public void function findSegmentReturnsSegment() {
        var segment = getStravaService().findSegment(token=variables.accessToken,id=variables.segmentId);
        debug(segment);
        assertTrue(isObject(segment));
    }

    public void function listStarredSegmentsReturnsArray() {
        var segments = getStravaService().listStarredSegments(token=variables.accessToken);
        debug(segments);
        assertTrue(isArray(segments));
    }

    public void function listSegmentEffortsReturnsArray() {
        var segmentEfforts = getStravaService().listSegmentEfforts(token=variables.accessToken,id=variables.segmentId);
        debug(segmentEfforts);
        assertTrue(isArray(segmentEfforts));
    }

    public void function findSegmentLeaderBoardReturnsLeaderboard() {
        var leaderboard = getStravaService().findSegmentLeaderBoard(token=variables.accessToken,id=variables.segmentId);
        debug(leaderboard);
        assertTrue(isObject(leaderboard));
    }

    public void function findSegmentEffortReturnsSegmentEffort() {
        var segmentEffort = getStravaService().findSegmentEffort(token=variables.accessToken,id=variables.segmentEffortId);
        debug(segmentEffort);
        assertTrue(isObject(segmentEffort));
    }


    public void function listSegmentEffortStreamsReturnsArray() {
        var streams = getStravaService().listSegmentEffortStreams(token=variables.accessToken,id=variables.segmentEffortId);
        debug(streams);
        assertTrue(isArray(streams));
    }

    public void function listSegmentStreamsReturnsArray() {
        var streams = getStravaService().listSegmentStreams(token=variables.accessToken,id=variables.segmentId);
        debug(streams);
        assertTrue(isArray(streams));
    }

    // private

    private any function getStravaService() {
        return variables.stravaService;
    }
}