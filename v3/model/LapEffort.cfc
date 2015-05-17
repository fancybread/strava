component displayname="LapEffort" output="false" accessors="true" extends="Base" {

    property name="id" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="name" type="string" required="false";
    property name="activity" type="struct" required="false";
    property name="athlete" type="struct" required="true";
    property name="elapsed_time" type="numeric" required="true";
    property name="moving_time" type="numeric" required="true";
    property name="start_date" type="string" required="true";
    property name="start_date_local" type="string" required="true";
    property name="distance" type="numeric" required="true";
    property name="start_index" type="numeric" required="false";
    property name="end_index" type="numeric" required="false";
    property name="total_elevation_gain" type="numeric" required="false";
    property name="average_speed" type="numeric" required="true";
    property name="max_speed" type="numeric" required="true";
    property name="average_cadence" type="numeric" required="true";
    property name="average_watts" type="numeric" required="true";
    property name="device_watts" type="boolean" required="true";
    property name="average_heartrate" type="numeric" required="true";
    property name="max_heartrate" type="numeric" required="true";
    property name="lap_index" type="numeric" required="true";
    
}