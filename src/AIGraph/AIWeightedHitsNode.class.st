Class {
	#name : #AIWeightedHitsNode,
	#superclass : #AIHitsNode,
	#traits : 'AITEdgeNode',
	#classTraits : 'AITEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'previousEdges'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIWeightedHitsNode >> label [

	^ 'WH '
]

{ #category : #accessing }
AIWeightedHitsNode >> nextEdges [

	^ nextEdges
]

{ #category : #accessing }
AIWeightedHitsNode >> previousEdges [

	^ previousEdges
]
