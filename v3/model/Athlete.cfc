component displayname="Athlete" output="false" accessors="true" extends="Base" {

    property name="id" type="numeric" required="true";
    property name="resource_state" type="numeric" required="true";
    property name="firstname" type="string" required="true";
    property name="lastname" type="string" required="true";
    property name="profile_medium" type="string" required="true";
    property name="profile" type="string" required="true";
    property name="city" type="string" required="true";
    property name="state" type="string" required="true";
    property name="country" type="string" required="true";
    property name="sex" type="string" required="true";
    property name="premium" type="boolean" required="true";
    property name="created_at" type="string" required="true";
    property name="updated_at" type="string" required="true";
    property name="friend" type="string" default="";
    property name="follower" type="string" default="";
    property name="follower_count" type="numeric" default="";
    property name="friend_count" type="numeric" default="";
    property name="mutual_friend_count" type="numeric" default="";
    property name="date_preference" type="string" default="";
    property name="measurement_preference" type="string" default="";
    property name="email" type="string" default="";
    property name="ftp" type="numeric" default="";
    property name="clubs" type="array";
    property name="bikes" type="array";
    property name="shoes" type="array";

    // public

    public array function getBikes() {
        local.bikes = [];
        if (!propertyExists('bikes')) {
            return local.bikes;
        }
        for (local.bike in variables.bikes) {
            ArrayAppend( local.bikes, ( !IsObject(local.bike) ? newGear(argumentCollection=local.bike) : local.bike ));
        }
        return local.bikes;
    }

    public array function getClubs() {
        local.clubs = [];
        if (!propertyExists('clubs')) {
            return local.clubs;
        }
        for (local.club in variables.clubs) {
            ArrayAppend( local.clubs, ( !IsObject(local.club) ? newClub(argumentCollection=local.club) : local.club ));
        }
        return local.clubs;
    }

    public array function getShoes() {
        local.shoes = [];
        if (!propertyExists('shoes')) {
            return local.shoes;
        }
        for (local.shoe in variables.shoes) {
            ArrayAppend( local.shoes, ( !IsObject(local.shoe) ? newGear(argumentCollection=local.shoe) : local.shoe ));
        }
        return local.shoes;
    }

    public string function getSex() {
        return ( variables.sex is 'M' ? 'Male' : 'Female' );
    }

    // private

    private Gear function newGear() {
        return new Gear(argumentCollection=arguments);
    }

    private Club function newClub() {
        return new Club(argumentCollection=arguments);
    }
}