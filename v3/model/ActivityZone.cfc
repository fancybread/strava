component displayname="ActivityZone" output="false" accessors="true" extends="Base" {

    property type="numeric" name="resource_state" required="true";
    property type="string" name="type" required="true";
    property type="boolean" name="sensor_based" required="true";
    property type="array" name="distribution_buckets" required="true";
    property type="numeric" name="score" default="0";
    property type="numeric" name="points" default="0";
    property type="boolean" name="custom_zones" default="false";
    property type="numeric" name="max" default="0";

}