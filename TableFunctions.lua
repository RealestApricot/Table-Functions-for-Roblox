local TableFunctions = {}

TableFunctions.DeepCopy = function(Table: {[any]: any}): {[any]: any}
    
    local CopyTable = {}
    
    if type(Table) == "table" then
        
        for TableKey, TableValue in Table do
            CopyTable[TableFunctions.DeepCopy(TableKey)] = TableFunctions.DeepCopy(TableValue)
        end
        
        setmetatable(CopyTable, TableFunctions.DeepCopy(getmetatable(Table)))
    
    else
        
        CopyTable = Table
    
    end
    
    return CopyTable

end

TableFunctions.GetKeys = function(Table: {[any]: any}): {[number]: any}
    
    local Keys: {[number]: any} = {}
    
    for Key: any, _ in Table do
        table.insert(Keys, Key)
    end
    
    return Keys

end

TableFunctions.GetSize = function(Table: {[any]: any}): number
    
    local Size = 0
    
    for Key: any, Value: any in Table do

        if type(Value) == "table" then

            Size += TableFunctions.GetSize(Value)

        else

            Size += 1

        end

    end
    
    return Size

end

TableFunctions.ToString = function(Table: {[number]: any}): string
    
    local String = "{"
    
    for Index, Value in ipairs(Table) do
        
        if type(Value) == "table" then
            String = String .. TableFunctions.ArrayToString(Value)
        else
            String = String .. tostring(Value)
        end
        
        if Index < #Table then
            String += ", "
        end
        
    end
    
    String += "}"
    
    return String

end

TableFunctions.GetUniqueValues = function(Table: {[any]: any}): {[any]: any}
    
    local UniqueValues: {[any]: any} = {}
    local Values: {[number]: any} = {}
    
    for _, Value in pairs(Table) do
        
        if not UniqueValues[Value] then
            UniqueValues[Value] = true
            table.insert(Values, Value)
        end
        
    end
    
    return Values

end

TableFunctions.SubArray = function(Array: {[number]: any}, StartPosition, EndPosition) : {[number]: any}
	
    StartPosition = StartPosition or 1
	
    EndPosition = EndPosition or #Array
	
    local SubArray: {[number]: any} = {}
	
    local Index: number = 1

	for Count = StartPosition, EndPosition, 1 do
		
        SubArray[Index] = Array[Count]
		
        Index += 1
	
    end

	return SubArray

end

return TableFunctions
