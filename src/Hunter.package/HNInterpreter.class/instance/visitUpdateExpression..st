visiting
visitUpdateExpression: aNode
	"TODO actual interpreting...
	And also... this is different than most expressions in that it has an lvalue...
	which is not just name reference but a name assignment... we will not handle this yet!!"
	^ self runtimeValueWithReferencedNamesOf: { aNode argument }