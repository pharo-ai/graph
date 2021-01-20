Class {
	#name : #AIDisjointSets,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'components'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIDisjointSets >> components [

	^ (components keys collect: [:parent| 
		(components at: parent) collect: [:n| n model] ]) asOrderedCollection 
]

{ #category : #configuration }
AIDisjointSets >> nodeClass [

	^ AIDisjointSetsNextNode 
]

{ #category : #running }
AIDisjointSets >> run [

	"partition nodes by connectivity"
	self nodes do: [:n|
		n nextNodes do: [:next | 
			n union: next ]].
	components := Dictionary new.
	self nodes inject: components into: [:d :n |
		(d at: n find ifAbsentPut: [OrderedCollection new]) add: n. d ]
]
