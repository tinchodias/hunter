tests
testMemberExpression
	| interpreter project fooVar barVar program node value |
	interpreter := HNInterpreter new.
	project := HNProject new.
	program := HNProgram new.
	fooVar := HNVariable new name: 'foo'; kind: 'var'.
	barVar := HNVariable new name: 'bar'; kind: 'var'.

	interpreter scope: program; scopePosition: 2.
	project addProgram: program.
	program addVariable: fooVar at: 1; addVariable: barVar at: 1.

	node := HNMemberExpressionNode new
		computed: true;
		object: (HNMemberExpressionNode new
			computed: false;
			object: (HNIdentifierNode new name: 'foo');
			property: (HNIdentifierNode new name: 'hello')
		);
		property: (HNIdentifierNode new name: 'bar').

	value := node accept: interpreter.
	
	self assert: value computedValue class equals: HNRuntimeValue.
	self assert: value referencedNames asSet equals: { 'foo'. 'bar'. } asSet.	