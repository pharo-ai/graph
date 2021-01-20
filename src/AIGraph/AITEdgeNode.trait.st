Trait {
	#name : #AITEdgeNode,
	#category : #AIGraph
}

{ #category : #edges }
AITEdgeNode >> from: aNode edge: anEdge [

	self previousEdges add: anEdge
]

{ #category : #edges }
AITEdgeNode >> nextEdges [

	self explicitRequirement
]

{ #category : #edges }
AITEdgeNode >> previousEdges [

	self explicitRequirement
]

{ #category : #edges }
AITEdgeNode >> to: aNode edge: anEdge [

	self nextEdges add: anEdge
]
