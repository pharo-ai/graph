Class {
	#name : #AIDominance,
	#superclass : #AIGraphAlgorithm,
	#category : #AIGraph
}

{ #category : #configuration }
AIDominance >> nodeClass [

	^ AIDominanceNode
]

{ #category : #running }
AIDominance >> run [

	| source |
	self nodes do: [ :n | n makeSet ].
	self nodes do: [ :n | n hasUniqueSource ifTrue: [ 
								source := n firstSource.
								source flagUnique.
								source union: n ] ]
]
