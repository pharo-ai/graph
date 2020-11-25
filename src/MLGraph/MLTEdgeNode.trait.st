Trait {
	#name : #MLTEdgeNode,
	#category : #MLGraph
}

{ #category : #edges }
MLTEdgeNode >> from: aNode edge: anEdge [

	self previousEdges add: anEdge
]

{ #category : #edges }
MLTEdgeNode >> nextEdges [

	self explicitRequirement
]

{ #category : #edges }
MLTEdgeNode >> previousEdges [

	self explicitRequirement
]

{ #category : #edges }
MLTEdgeNode >> to: aNode edge: anEdge [

	self nextEdges add: anEdge
]
