import strava.v3.model.Totals;

component displayname="StatTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.totals ='{
  "biggest_ride_distance": 205481.0,
  "biggest_climb_elevation_gain": 1224.0,
  "recent_ride_totals": {
    "count": 30,
    "distance": 1037410.8046875,
    "moving_time": 165675,
    "elapsed_time": 181337,
    "elevation_gain": 13624.902572631836,
    "achievement_count": 346
  },
  "recent_run_totals": {
    "count": 6,
    "distance": 83126.9013671875,
    "moving_time": 24731,
    "elapsed_time": 25764,
    "elevation_gain": 1564.9624166488647,
    "achievement_count": 41
  },
  "ytd_ride_totals": {
    "count": 45,
    "distance": 1586190,
    "moving_time": 257281,
    "elapsed_time": 285315,
    "elevation_gain": 22430
  },
  "ytd_run_totals": {
    "count": 6,
    "distance": 83127,
    "moving_time": 24731,
    "elapsed_time": 25764,
    "elevation_gain": 1565
  },
  "all_ride_totals": {
    "count": 765,
    "distance": 42918079,
    "moving_time": 6386345,
    "elapsed_time": 7228437,
    "elevation_gain": 550886
  },
  "all_run_totals": {
    "count": 75,
    "distance": 916433,
    "moving_time": 249542,
    "elapsed_time": 261434,
    "elevation_gain": 7520
  }
}
';
        variables.Totals = new Totals(argumentCollection=DeserializeJson(local.totals));
    }

    public void function getBiggestRideDistanceReturnsNumeric() {
        var distance = getStat().getBiggestRideDistance(1);
        assertTrue(IsNumeric(distance));
        assertTrue(distance == 205481);
    }

    public void function getBiggestClimbElevationGainReturnsNumeric() {
        var climb = getStat().getBiggestClimbElevationGain();
        assertTrue(IsNumeric(climb));
        assertTrue(climb == 1224.0);
    }

    public void function getRecentRideTotalsReturnsStat() {
        var recentRideTotals = getStat().getRecentRideTotals();
        assertTrue(IsObject(recentRideTotals));
        assertTrue(GetMetadata(recentRideTotals).name == 'strava.v3.model.Stat');
    }
    
    public void function getRecentRunTotalsReturnsStat() {
        var recentRunTotals = getStat().getRecentRunTotals();
        assertTrue(IsObject(recentRunTotals));
        assertTrue(GetMetadata(recentRunTotals).name == 'strava.v3.model.Stat');
    }
    
    public void function getYtdRideTotalsReturnsStat() {
        var ytdRideTotals = getStat().getYtdRideTotals();
        assertTrue(IsObject(ytdRideTotals));
        assertTrue(GetMetadata(ytdRideTotals).name == 'strava.v3.model.Stat');
    }
    
    public void function getYtdRunTotalsReturnsStat() {
        var ytdRunTotals = getStat().getYtdRunTotals();
        assertTrue(IsObject(ytdRunTotals));
        assertTrue(GetMetadata(ytdRunTotals).name == 'strava.v3.model.Stat');
    }
    
    public void function getAllRideTotalsReturnsStat() {
        var allRideTotals = getStat().getAllRideTotals();
        debug(allRideTotals);
        assertTrue(IsObject(allRideTotals));
        assertTrue(GetMetadata(allRideTotals).name == 'strava.v3.model.Stat');
    }
    
    public void function getAllRunTotalsReturnsStat() {
        var allRunTotals = getStat().getAllRunTotals();
        assertTrue(IsObject(allRunTotals));
        assertTrue(GetMetadata(allRunTotals).name == 'strava.v3.model.Stat');
    }
        
    // private

    private Totals function getStat() {
       return variables.Totals;
    }

}