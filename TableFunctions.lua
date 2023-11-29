--[[SERVICES]]--
--[[FOLDERS]]--
--[[MODULES]]--
--[[VARIABLES + EVENT CONNECTIONS]]--
--[[FUNCTIONS]]--
--[[SCRIPT]]--
local TableFunctions = {}

function TableFunctions.DeepCopy(Table: {[any]: any}) : {[any]: any}
	local Copy: {[any]: any} = {}
	for Key, Value in Table do
		if typeof(Value) == "table" then
			Value = TableFunctions.DeepCopy(Value)
		end
		Copy[Key] = Value
	end
	return Copy
end

function TableFunctions.SubArray(Array: {[number]: any}, StartPosition, EndPosition) : {[number]: any}
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

function TableFunctions.InvertArray(Array: {[number]: any}) : {[number]: any}
	local InvertedArray: {[number]: any} = {}
	for Index: number, Value: any in Array do
		table.insert(InvertedArray, 1, Value)
	end
	
	return InvertedArray
end

function TableFunctions.ValueCountInArray(Array: {[number]: any}, SearchValue: any) : number
	local Count: number = 0
	for Index: number, Value: any in Array do
		if typeof(Value) == typeof(SearchValue) and Value == SearchValue then
			Count += 1
		end
	end
	
	return Count
end

function TableFunctions.ArrayToString(Array: {[number]: any}) : string
	local ArrayString: string = "{"
	for Index, InputValue in Array do
		ArrayString = ArrayString .. InputValue
		if Index ~= #Array then
			ArrayString = ArrayString .. ", "
		end
	end
	
	ArrayString = ArrayString .. "}"
	
	return ArrayString
end

return TableFunctions