visiting
visitDoWhileStatement: aNode
	self matcher processNode: aNode.
	aNode test accept: self.
	aNode body accept: self