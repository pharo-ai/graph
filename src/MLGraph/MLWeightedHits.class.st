Class {
	#name : #MLWeightedHits,
	#superclass : #MLHits,
	#category : #MLGraph
}

{ #category : #running }
MLWeightedHits >> computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousEdges inject: 0 into: [:s :e| s + (e weight * e from hub)])
]

{ #category : #running }
MLWeightedHits >> computeHubsFor: aNode [

	aNode hub: (aNode nextEdges inject: 0 into: [:s :e| s + (e weight * e to auth)])
]

{ #category : #configuration }
MLWeightedHits >> edgeClass [

	^ MLWeightedEdge
]

{ #category : #configuration }
MLWeightedHits >> nodeClass [

	^ MLWeightedHitsNode 
]
