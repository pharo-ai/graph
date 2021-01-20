Class {
	#name : #AIWeightedHits,
	#superclass : #AIHits,
	#category : #AIGraph
}

{ #category : #running }
AIWeightedHits >> computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousEdges inject: 0 into: [:s :e| s + (e weight * e from hub)])
]

{ #category : #running }
AIWeightedHits >> computeHubsFor: aNode [

	aNode hub: (aNode nextEdges inject: 0 into: [:s :e| s + (e weight * e to auth)])
]

{ #category : #configuration }
AIWeightedHits >> edgeClass [

	^ AIWeightedEdge
]

{ #category : #configuration }
AIWeightedHits >> nodeClass [

	^ AIWeightedHitsNode 
]
