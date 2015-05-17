component displayname="Club" output="false" accessors="true" extends="Base" {

    property type="numeric" name="id" required="true";
    property type="numeric" name="resource_state" required="true";
    property type="string" name="name" required="true";
    property type="string" name="profile_medium" required="true";
    property type="string" name="profile" required="true";
    property type="string" name="description" default="";
    property type="string" name="club_type" default="";
    property type="string" name="sport_type" default="";
    property type="string" name="city" default="";
    property type="string" name="state" default="";
    property type="string" name="country" default="";
    property type="boolean" name="private" default="false";
    property type="numeric" name="member_count" default="0";

}