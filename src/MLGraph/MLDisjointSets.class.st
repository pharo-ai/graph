Class {
	#name : #MLDisjointSets,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'components'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLDisjointSets >> components [

	^ (components keys collect: [:parent| 
		(components at: parent) collect: [:n| n model] ]) asOrderedCollection 
]

{ #category : #configuration }
MLDisjointSets >> nodeClass [

	^ MLDisjointSetsNextNode 
]

{ #category : #running }
MLDisjointSets >> run [

	"partition nodes by connectivity"
	self nodes do: [:n|
		n nextNodes do: [:next | 
			n union: next ]].
	components := Dictionary new.
	self nodes inject: components into: [:d :n |
		(d at: n find ifAbsentPut: [OrderedCollection new]) add: n. d ]
]
