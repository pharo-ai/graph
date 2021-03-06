"
A MalGraphAlgorithmTest is a test class for testing the behavior of MalGraphAlgorithm
"
Class {
	#name : #AIGraphAlgorithmTest,
	#superclass : #TestCase,
	#category : #'AIGraph-Tests'
}

{ #category : #tests }
AIGraphAlgorithmTest >> testAddNodesFromChildrenBlock [
	| builder |
	builder := AIGraphReducer new.
	builder addNodesFrom: String childrenBlock: [ :parent | parent subclasses ].

	self assert: builder nodes size equals: 6.
	self assertCollection: (builder nodes collect: #model) hasSameElements: (String allSubclasses copyWith: String).
	self assertCollection: ((builder findNode: Symbol) nextNodes collect: #model) hasSameElements: {ByteSymbol . WideSymbol}.
	self assertCollection: ((builder findNode: Symbol) previousNodes collect: #model) hasSameElements: {String}.
	self assert: (builder findNode: ByteSymbol) nextNodes isEmpty
]
