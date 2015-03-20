component displayname="Comment" output="false" accessors="true" extends="Base" {

    property name="id" type="string" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="activity_id" type="numeric" required="true";
    property name="text" type="string" required="true";
    property name="athlete" type="struct" required="true";
    property name="created_at" type="string" required="true";

    public Athlete function getAthlete() {
    	return new Athlete(argumentCollection=variables.athlete);
    }

}