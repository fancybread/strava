component displayname="Totals" output="false" accessors="true" extends="Base" {

    property name="biggest_ride_distance" type="numeric" required="true";
    property name="biggest_climb_elevation_gain" type="numeric" required="true";
    property name="recent_ride_totals" type="struct" required="true";
    property name="recent_run_totals" type="struct" required="true";
    property name="ytd_ride_totals" type="struct" required="true";
    property name="ytd_run_totals" type="struct" required="true";
    property name="all_ride_totals" type="struct" required="true";
    property name="all_run_totals" type="struct" required="true";

    public numeric function getBiggestRideDistance(
        required numeric distance
    ) {
        return ( arguments.distance neq 0 ? (variables.biggest_ride_distance/arguments.distance) : 0 );
    }

    public Stat function getRecentRideTotals() {
    	return new Stat(argumentCollection=variables.recent_ride_totals);
    }

    public Stat function getRecentRunTotals() {
        return new Stat(argumentCollection=variables.recent_run_totals);
    }

    public Stat function getYtdRideTotals() {
        return new Stat(argumentCollection=variables.ytd_ride_totals);
    }

    public Stat function getYtdRunTotals() {
        return new Stat(argumentCollection=variables.ytd_run_totals);
    }

    public Stat function getAllRideTotals() {
        return new Stat(argumentCollection=variables.all_ride_totals);
    }

    public Stat function getAllRunTotals() {
        return new Stat(argumentCollection=variables.all_run_totals);
    }
}