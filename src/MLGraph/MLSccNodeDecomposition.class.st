Class {
	#name : #MLSccNodeDecomposition,
	#superclass : #MLSccExtractor,
	#traits : 'MLTNormalize',
	#classTraits : 'MLTNormalize classTrait',
	#category : #MLGraph
}

{ #category : #configuration }
MLSccNodeDecomposition >> nodeClass [

	^ MLSndNode
]

{ #category : #running }
MLSccNodeDecomposition >> retrieveCircuit: aNode [
	| c i |
	c := OrderedCollection new.
	i := aNode.
	[ i notNil ]
		whileTrue: [ c addFirst: i model.
			i := i bfsAncestor ].
	^ c
]

{ #category : #running }
MLSccNodeDecomposition >> run [

	self nodes do: [:n|
		self run: n
	]
]

{ #category : #running }
MLSccNodeDecomposition >> run: aNode [

	| fifo visited ancestors |
	visited := Set new.
	ancestors := aNode previousNodes.
	aNode bfsAncestor: nil.
	fifo := OrderedCollection with: aNode.
	[ancestors isEmpty] whileFalse: [ |p|
		p := fifo removeFirst.
		p nextNodes do: [:next|
			((visited includes: next) or: [fifo includes: next])
				ifFalse: [
					next bfsAncestor: p.
					fifo addLast: next ].
			(ancestors includes: next)
				ifTrue: [ |c|
					c := self retrieveCircuit: next.
					self addCircuit: (self normalize: c).
					ancestors remove: next ]
		].
		visited add: p ]
]
