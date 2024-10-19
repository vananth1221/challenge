fun getChildren(items, parentItem) = do {
    var parentLevel = parentItem.level as Number
    var thisLevelItemsFiltered = items filter (
        ($.level ~= (parentLevel + 1))
        and ($.parent == parentItem.child)
    )
    ---
    if (isEmpty(thisLevelItemsFiltered)) null
    else (
        thisLevelItemsFiltered match {
            case [] -> null
            else -> thisLevelItemsFiltered map {
                name: $.name,
                children: getChildren(items, $)
            }
        }
    ) 
}

var items = payload orderBy $.level
var parentItem = items[0]
