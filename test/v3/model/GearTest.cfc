import strava.v3.model.Gear;

component displayname="GearTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.gear ='{
		  "id": 321934,
		  "resource_state": 2,
		  "name": "My Vintage Ride",
		  "distance": 1600,
		  "primary": true
		}';
        variables.gear = new Gear(argumentCollection=DeserializeJson(local.gear));
    }

    public void function getIdReturnsNumeric() {
        var id = getGear().getId();
        assertTrue(IsNumeric(id));
        assertTrue(id == 321934);
    }

    public void function getPrimaryReturnsBoolean() {
        var primary = getGear().getPrimary();
        assertTrue(IsBoolean(primary));
        assertTrue(primary);
    }

    public void function getNameReturnsString() {
        var name = getGear().getName();
        assertTrue(IsSimpleValue(name));
        assertTrue(name == 'My Vintage Ride');
    }

    public void function getDistanceReturnsNumeric() {
        var distance = getGear().getDistance();
        assertTrue(IsNumeric(distance));
        assertTrue(distance == 1600);
    }

    public void function getResourceStateReturnsNumeric() {
        var resourceState = getGear().getResourceState();
        assertTrue(IsNumeric(resourceState));
        assertTrue(resourceState == 2);
    }

    // private

    private Gear function getGear() {
	   return variables.gear;
	}

}