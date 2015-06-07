import strava.v3.model.Stream;

component displayname="StreamTest" output="false" extends="mxunit.framework.TestCase" {

    public void function setUp() {
        local.Stream ='{
  "type": "latlng",
  "data": [
    [ 38.603734, -122.864112 ],
    [ 38.608798, -122.867714 ],
    [ 38.604691, -122.88178  ],
    [ 38.611249, -122.890977 ],
    [ 38.634357, -122.874144 ],
    [ 38.62268,  -122.872756 ],
    [ 38.611205, -122.870848 ],
    [ 38.603579, -122.863891 ]
  ],
  "series_type": "distance",
  "original_size": 512,
  "resolution": "low"
}';
        variables.Stream = new Stream(argumentCollection=DeserializeJson(local.Stream));
    }

    public void function getTypeReturnsString() {
        var type = getStream().getType();
        assertTrue(IsSimpleValue(type));
        assertTrue(type == 'latlng');
    }

    public void function getDataReturnsArray() {
        var data = getStream().getData();
        assertTrue(IsArray(data));
    }

    public void function getSeriesTypeReturnsString() {
        var series_type = getStream().getSeriesType();
        assertTrue(IsSimpleValue(series_type));
        assertTrue(series_type == 'distance');
    }

    public void function getOriginalSizeReturnsNumeric() {
        var original_size = getStream().getOriginalSize();
        assertTrue(IsNumeric(original_size));
        assertTrue(original_size == 512);
    }

    public void function getResolutionReturnsString() {
        var resolution = getStream().getResolution();
        assertTrue(IsSimpleValue(resolution));
        assertTrue(resolution == 'low');
    }

    // private

    private Stream function getStream() {
       return variables.Stream;
    }

}