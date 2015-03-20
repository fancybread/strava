component displayname="SegmentEffort" output="false" accessors="true" extends="Base" {

    property name="id" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="name" type="string" required="true";
    property name="activity" type="struct" required="true";
    property name="athlete" type="struct" required="true";
    property name="elapsed_time" type="numeric" required="true";
    property name="moving_time" type="numeric" required="true";
    property name="start_date" type="string" required="true";
    property name="start_date_local" type="string" required="true";
    property name="distance" type="numeric" required="true";
    property name="start_index" type="numeric" required="true";
    property name="end_index" type="numeric" required="true";
    property name="average_cadence" type="numeric" required="true";
    property name="average_watts" type="numeric" required="true";
    property name="average_heartrate" type="numeric" required="true";
    property name="max_heartrate" type="numeric" required="true";
    property name="segment" type="struct" required="true";
    property name="kom_rank" type="numeric";
    property name="pr_rank" type="numeric";

    public numeric function getKomRank() {
        return ( propertyExists('kom_rank') ? variables.kom_rank : 0 );
    }

}