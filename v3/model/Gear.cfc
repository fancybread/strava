component displayname="Gear" output="false" accessors="true" extends="Base" {

    property name="id" type="string" required="true";
    property name="primary" type="boolean" required="true";
    property name="name" type="string" required="true";
    property name="distance" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="brand_name" type="string" default="";
    property name="model_name" type="string" default="";
    property name="frame_type" type="string" default="";
    property name="description" type="string" default="";

}