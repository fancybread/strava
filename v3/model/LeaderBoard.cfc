component displayname="LeaderBoard" output="false" accessors="true" extends="Base" {

    property name="entry_count" type="numeric" required="true";
    property name="entries" type="array" required="true";

    /**
     * returns an array of LeaderBoardEntry instances
     **/
    public array function getEntries() {
        var entries = [];
        for (var entry in variables.entries) {
            ArrayAppend(entries, (IsObject(entry) ? entry : new LeaderBoardEntry(argumentCollection=entry)) );
        }
        setEntries(entries);
        return entries;
    }

}