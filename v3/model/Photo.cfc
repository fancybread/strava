component displayname="Photo" output="false" accessors="true" extends="Base" {

    property name="id" type="numeric" required="true";
    property name="activity_id" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="ref" type="string" default="";
    property name="uid" type="string" default="";
    property name="caption" type="string" default="";
    property name="type" type="string" default="";
    property name="uploaded_at" type="date" default="";
    property name="created_at" type="date" default="";
    property name="location" type="array" default="";

}