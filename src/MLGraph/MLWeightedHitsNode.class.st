Class {
	#name : #MLWeightedHitsNode,
	#superclass : #MLHitsNode,
	#traits : 'MLTEdgeNode',
	#classTraits : 'MLTEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'previousEdges'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLWeightedHitsNode >> label [

	^ 'WH '
]

{ #category : #accessing }
MLWeightedHitsNode >> nextEdges [

	^ nextEdges
]

{ #category : #accessing }
MLWeightedHitsNode >> previousEdges [

	^ previousEdges
]
