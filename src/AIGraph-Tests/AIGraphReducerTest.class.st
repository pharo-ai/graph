Class {
	#name : #AIGraphReducerTest,
	#superclass : #TestCase,
	#instVars : [
		'graphReducer'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #helpers }
AIGraphReducerTest >> assertNodes: aNodeList doesNotInclude: anotherNodeList [
	aNodeList 
		collect: #model
		thenDo: 
			[ :model | 
			self 
				deny: ((anotherNodeList collect: #model) includes: model)
				description: model asString , ' should not be referenced!' ] 
]

{ #category : #helpers }
AIGraphReducerTest >> mergedNodesIn: aNodeList [
	^ (aNodeList select: [ :node | node mergedNodes notNil ]) flatCollect: #mergedNodes
]

{ #category : #running }
AIGraphReducerTest >> setUp [
	super setUp.
	graphReducer := AIGraphReducer new
]

{ #category : #tests }
AIGraphReducerTest >> testComplexCycle2 [
	AIGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.
	self assert: graphReducer nodes size equals: 6.
	self assert: (graphReducer nodes at: 6) mergedNodes size equals: 4
]

{ #category : #tests }
AIGraphReducerTest >> testGraphReducingWhenNoCycle [
	| initialGraph |
	AIGraphFixture simpleGraph: graphReducer.
	initialGraph := graphReducer graph copy.
	graphReducer run.
	self assert: initialGraph equals: graphReducer graph
]

{ #category : #tests }
AIGraphReducerTest >> testMergedNodesNotReferencedInNextNodes [
	AIGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.

	self 
		assertNodes: (graphReducer nodes flatCollect: #nextNodes) 
		doesNotInclude: (self mergedNodesIn: graphReducer nodes)
]

{ #category : #tests }
AIGraphReducerTest >> testMergedNodesNotReferencedInPreviousNodes [
	AIGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.

	self 
		assertNodes: (graphReducer nodes flatCollect: #previousNodes) 
		doesNotInclude: (self mergedNodesIn: graphReducer nodes)

]

{ #category : #tests }
AIGraphReducerTest >> testNextNodesFor [
	| nodes |
	AIGraphFixture complexCycleGraph2: graphReducer.
	nodes := {(graphReducer findNode: $f) . (graphReducer findNode: $g)}.
	self
		assert: ((graphReducer nextNodesFor: nodes) collect: #model as: SortedCollection) asArray
		equals: #($a $b $d $e $i)
]

{ #category : #tests }
AIGraphReducerTest >> testNoCycle [
	AIGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.
	graphReducer nodes do:
		[ :node | 
		self 
			deny: ((node nextNodes includes: node) or: [ node previousNodes includes: node ])
			description: node asString, ' node is in cycle!' ]
]

{ #category : #tests }
AIGraphReducerTest >> testPreviousNodesFor [
	| nodes |
	AIGraphFixture complexCycleGraph2: graphReducer.
	nodes := {(graphReducer findNode: $f) . (graphReducer findNode: $g)}.
	self
		assert: ((graphReducer previousNodesFor: nodes) collect: #model as: SortedCollection) asArray
		equals: #($a $b $c)
]
