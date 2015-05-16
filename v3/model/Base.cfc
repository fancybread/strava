component displayname="Base" output="false" {

    public any function onMissingMethod(
        required string MissingMethodName,
        required struct MissingMethodArguments
    ) {
        if (REFindNoCase("^(get|set)",arguments.MissingMethodName)) {
            try {
                var propertyName = Right(arguments.MissingMethodName,len(arguments.MissingMethodName)-3);
                propertyName = replace(rereplace(propertyName,"([A-Z])","_\1","all"),"_","","one");
                if ((left(arguments.MissingMethodName,3) == 'set') && (structCount(arguments.MissingMethodArguments) == 1)) {
                    invoke(this,'set'&propertyName,arguments.MissingMethodArguments);
                } else if ( left(arguments.MissingMethodName,3) == 'get' ) {
                	return invoke(this,'get'&propertyName);
                }
            } catch (any e) {
                throw(Message=e.Message);
            }
        }
    }
    
    /**
    * returns a representation of the instance properties
    **/
    public struct function getMemento () {
    	var properties = getMetadata(this).properties;
        var memento = {};
        for (var i=1; i<ArrayLen(properties);i++) {
        	var propName = properties[i].name;
        	memento[propName] = ( propertyExists(propName) ? invoke(this,'get' & propName) : '' );
        }
        return memento;
    }

    /**
    * returns true when the property name provided exists in variables scope
    * 
    * @propertyName.hint the property name
    **/
    private boolean function propertyExists(
        required string propertyName
    ) {
        return structKeyExists(variables,arguments.propertyName)
    }
}