component displayname="SegmentEffort" output="false" accessors="true" extends="Base" {

    property name="id" type="string" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="name" type="string" required="true";
    property name="activity_type" type="string" required="true";
    property name="distance" type="numeric" required="true";
    property name="average_grade" type="numeric" required="true";
    property name="maximum_grade" type="numeric" required="true";
    property name="elevation_high" type="numeric" required="true";
    property name="elevation_low" type="string" required="true";
    property name="start_latlng" type="array" required="true";
    property name="end_latlng" type="array" required="true";
    property name="climb_category" type="numeric" required="true";
    property name="city" type="string" required="true";
    property name="state" type="string" required="true";
    property name="country" type="string" required="true";
    property name="private" type="boolean" required="true";
    property name="starred" type="boolean" required="true";
    property name="created_at" type="string" required="true";
    property name="updated_at" type="string" required="true";
    property name="total_elevation_gain" type="numeric" required="true";
    property name="map" type="struct" required="true";
    property name="effort_count" type="numeric" required="true";
    property name="athlete_count" type="numeric" required="true";
    property name="hazardous" type="boolean" required="true";
    property name="star_count" type="numeric" required="true";

}