Class {
	#name : #AIHits,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'k'
	],
	#category : #AIGraph
}

{ #category : #running }
AIHits >> computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousNodes inject: 0 into: [:s :n| s + n hub])
]

{ #category : #running }
AIHits >> computeHubsFor: aNode [

	aNode hub: (aNode nextNodes inject: 0 into: [:s :n| s + n auth])
]

{ #category : #initialization }
AIHits >> initialize [

	super initialize.
	k := 20
]

{ #category : #running }
AIHits >> initializeNodes [

	self nodes do: [:n|
		n auth: 1.0; hub: 1.0
	]
]

{ #category : #configuration }
AIHits >> k [
	^ k
]

{ #category : #configuration }
AIHits >> k: anObject [
	k := anObject
]

{ #category : #configuration }
AIHits >> nodeClass [

	^ AIHitsNode
]

{ #category : #running }
AIHits >> normalize: aCollectionOfNodes [

	| authNorm hubNorm |
	authNorm := aCollectionOfNodes inject: 0 into: [:s :n| s + n auth].
	hubNorm := aCollectionOfNodes inject: 0 into: [:s :n| s + n hub].
	authNorm = 0 ifTrue: [authNorm := 1].
	hubNorm = 0 ifTrue: [hubNorm := 1].
	aCollectionOfNodes do: [:n|
		n auth: (n auth / authNorm).
		n hub: (n hub / hubNorm)]
]

{ #category : #running }
AIHits >> run [

	|i|
	i := 1.
	self initializeNodes.
	[i = k] whileFalse: [
		self nodes do: [:n|
			self computeAuthoritiesFor: n].
		self nodes do: [:n|
			self computeHubsFor: n].
		self normalize: self nodes.
"		Transcript cr; show: i; show: ': '.
		self nodes do: [:n|
			Transcript show: n printString]."
	i := i + 1]
]
