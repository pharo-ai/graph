Class {
	#name : #MLDominance,
	#superclass : #MLGraphAlgorithm,
	#category : #MLGraph
}

{ #category : #configuration }
MLDominance >> nodeClass [

	^ MLDominanceNode
]

{ #category : #running }
MLDominance >> run [

	| source |
	self nodes do: [ :n | n makeSet ].
	self nodes do: [ :n | n hasUniqueSource ifTrue: [ 
								source := n firstSource.
								source flagUnique.
								source union: n ] ]
]
