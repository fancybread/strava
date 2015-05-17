component displayname="Activity" output="false" accessors="true" extends="Base" {

    property name="id" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="external_id" type="string" required="false";
    property name="upload_id" type="numeric" required="false";
    property name="athlete" type="struct" required="true";
    property name="name" type="string" required="true";
    property name="description" type="string" required="false";
    property name="distance" type="numeric" required="true";
    property name="moving_time" type="numeric" required="true";
    property name="elapsed_time" type="numeric" required="true";
    property name="total_elevation_gain" type="numeric" required="true";
    property name="type" type="string" required="true";
    property name="start_date" type="string" required="true"
    property name="start_date_local" type="string" required="true";
    property name="timezone" type="string" required="true";
    property name="start_latlng" type="array" required="false";
    property name="end_latlng" type="array" required="false";
    property name="location_city" type="string" required="false";
    property name="location_state" type="string" required="false";
    property name="location_country" type="string" required="true";
    property name="achievement_count" type="numeric" required="true";
    property name="kudos_count" type="numeric" required="true";
    property name="comment_count" type="numeric" required="true";
    property name="athlete_count" type="numeric" required="true";
    property name="photo_count" type="numeric" required="true";
    property name="map" type="struct" required="true";
    property name="trainer" type="boolean" required="true";
    property name="commute" type="boolean" required="true";
    property name="manual" type="boolean" required="true";
    property name="private" type="boolean" required="true";
    property name="flagged" type="boolean" required="true";
    property name="workout_type" type="numeric" required="false";
    property name="gear" type="struct" required="false";
    property name="gear_id" type="string" required="false";
    property name="average_speed" type="numeric" required="true";
    property name="max_speed" type="numeric" required="true";
    property name="calories" type="numeric" required="false";
    property name="truncated" type="numeric" required="false";
    property name="has_kudoed" type="boolean" required="true";
    property name="segment_efforts" type="array" required="false";
    property name="splits_metric" type="array" required="false";
    property name="splits_standard" type="array" required="false";
    property name="best_efforts" type="array" required="false";

    /**
    * constructor
    **/
    public Activity function init() {
    	for (var k in arguments) {
            variables[k] = arguments[k];
    	}
        return this;
    }

    /**
    * returns moving time
    **/
    public numeric function getMovingTime() {
        return variables.moving_time;
    }

    /**
    * returns average speed in meters per second
    **/
    public numeric function getAverageSpeed() {
        return getDistance()/getMovingTime();
    }

    /**
    * returns seconds to travel given distance
    * 
    * @distance.hint the distance in meters
    **/
    public numeric function getTimeOverDistance(
        required numeric distance
    ) {
        return (arguments.distance/getAverageSpeed());
    }
}