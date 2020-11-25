Trait {
	#name : #MLTNormalize,
	#category : #MLGraph
}

{ #category : #running }
MLTNormalize >> normalize: aCollectionOfNodes [

	| firstNode perm |
	firstNode := aCollectionOfNodes detectMin: [:n| n printString ].
	perm := aCollectionOfNodes copy.
	[ firstNode = perm first ] whileFalse: [
		perm addLast: perm removeFirst ].
	^ perm
]