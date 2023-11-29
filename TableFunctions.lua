--[[SERVICES]]--
--[[FOLDERS]]--
--[[MODULES]]--
--[[VARIABLES + EVENT CONNECTIONS]]--
--[[FUNCTIONS]]--
--[[SCRIPT]]--
local TableFunctions = {}

--GENERAL TABLE METHODS
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

--DICTIONARY METHODS
function TableFunctions.GetDictionaryKeys(Dictionary: {[any]: any}) : {[any]: any}
	local Keys: {[number]: any} = {}
	for Key, Value in Dictionary do
		table.insert(Keys, Key)
	end
	
	return Keys
end

function TableFunctions.GetDictionaryValues(Dictionary: {[any]: any}) : {[any]: any}
	local Values: {[number]: any} = {}
	for Key, Value in Dictionary do
		table.insert(Values, Value)
	end

	return Values
end

function TableFunctions.GetDictionarySize(Dictionary: {[any]: any}, DeepCopy: boolean) : number
	local Count: number = 0
	for Key, Value in Dictionary do
		if type(Value) == "table" and DeepCopy == true then
			Count += TableFunctions.GetDictionarySize(Value, DeepCopy)
		else
			Count += 1
		end
	end
	
	return Count
end

function TableFunctions.MapValues(ValuesToMap: {[number]: any}, Function) : {[any]: any}
	if type(Function) ~= "function" then return {} end
	
	local MapWithValues: {[any]: any} = {}
	
	for Index, Value in ValuesToMap do
		MapWithValues[Value] = Function(Value)
	end
	
	return MapWithValues
end
--ARRAY METHODS
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

function TableFunctions.ConcatArrays(Array1: {[number]: any}, Array2: {[number]: any}) : {[number]: any}
	local ConcatArray: {[number]: any} = table.clone(Array1)
	for Index, Value in Array2 do
		table.insert(ConcatArray, Value)
	end
	
	return ConcatArray
end

function TableFunctions.GetUniqueValues(Array: {[number]: any}) : {[number]: any}
	local UniqueArray: {[number]: any} = {}
	local UniqueDictionary: {[any]: boolean} = {}
	
	for Index, Value in Array do
		if not UniqueDictionary[Value] then
			UniqueDictionary[Value] = true
			table.insert(UniqueArray, Value)
		end
	end
	
	return UniqueArray
end


function TableFunctions.InvertArray(Array: {[number]: any}) : {[number]: any}
	local InvertedArray: {[number]: any} = {}
	local Index = 1
	for Count = #Array, 1, -1 do
		InvertedArray[Index] = Array[Count]
		Index += Index
	end
	
	return InvertedArray
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

function TableFunctions.ValueCountInArray(Array: {[number]: any}, SearchValue: any) : number
	local Count: number = 0
	for Index: number, Value: any in Array do
		if typeof(Value) == typeof(SearchValue) and Value == SearchValue then
			Count += 1
		end
	end
	
	return Count
end

function TableFunctions.ValueLastIndexInArray(Array: {[number]: any}, SearchValue: any) : number
	local Index: number = -1
	
	for Count = #Array, 1, -1 do
		if Array[Count] == SearchValue then
			Index = Count
			break
		end
	end
	
	return Index
end

return TableFunctions