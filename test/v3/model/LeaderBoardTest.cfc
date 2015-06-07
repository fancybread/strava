import strava.v3.model.LeaderBoard;

component displayname="LeaderBoardTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.leaderBoard ='{
  "entry_count": 7037,
  "entries": [
    {
      "athlete_name": "Jim Whimpey",
      "athlete_id": 123529,
      "athlete_gender": "M",
      "average_hr": 190.5,
      "average_watts": 460.8,
      "distance": 2659.89,
      "elapsed_time": 360,
      "moving_time": 360,
      "start_date": "2013-03-29T13:49:35Z",
      "start_date_local": "2013-03-29T06:49:35Z",
      "activity_id": 46320211,
      "effort_id": 801006623,
      "rank": 1,
      "athlete_profile": "http://pics.com/227615/large.jpg"
    },
    {
      "athlete_name": "Chris Zappala",
      "athlete_id": 11673,
      "athlete_gender": "M",
      "average_hr": null,
      "average_watts": 368.3,
      "distance": 2705.7,
      "elapsed_time": 374,
      "moving_time": 374,
      "start_date": "2012-02-23T14:50:16Z",
      "start_date_local": "2012-02-23T06:50:16Z",
      "activity_id": 4431903,
      "effort_id": 83383918,
      "rank": 2,
      "athlete_profile": "http://pics.com/227615/large.jpg"
    }
  ]
}';
        variables.LeaderBoard = new LeaderBoard(argumentCollection=DeserializeJson(local.LeaderBoard));
    }

    public void function getEntryCountReturnsNumeric() {
        var entryCount = getLeaderBoard().getEntryCount();
        assertTrue(IsNumeric(entryCount));
        assertTrue(entryCount == 7037);
    }

    public void function getEntriesReturnsArrayOfLeaderBoardEntries() {
        var entries = getLeaderBoard().getEntries();
        assertTrue(IsArray(entries));
        assertTrue(ArrayLen(entries) gt 0);
        for (var entry in entries) {
            AssertTrue(IsInstanceOf(entry,'LeaderBoardEntry'));
        }
    }

    // private

    private LeaderBoard function getLeaderBoard() {
       return variables.LeaderBoard;
    }

}