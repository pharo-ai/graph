Class {
	#name : #MLHits,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'k'
	],
	#category : #MLGraph
}

{ #category : #running }
MLHits >> computeAuthoritiesFor: aNode [

	aNode auth: (aNode previousNodes inject: 0 into: [:s :n| s + n hub])
]

{ #category : #running }
MLHits >> computeHubsFor: aNode [

	aNode hub: (aNode nextNodes inject: 0 into: [:s :n| s + n auth])
]

{ #category : #initialization }
MLHits >> initialize [

	super initialize.
	k := 20
]

{ #category : #running }
MLHits >> initializeNodes [

	self nodes do: [:n|
		n auth: 1.0; hub: 1.0
	]
]

{ #category : #configuration }
MLHits >> k [
	^ k
]

{ #category : #configuration }
MLHits >> k: anObject [
	k := anObject
]

{ #category : #configuration }
MLHits >> nodeClass [

	^ MLHitsNode
]

{ #category : #running }
MLHits >> normalize: aCollectionOfNodes [

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
MLHits >> run [

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
