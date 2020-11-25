Class {
	#name : #MLGraphReducerTest,
	#superclass : #TestCase,
	#instVars : [
		'graphReducer'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #helpers }
MLGraphReducerTest >> assertNodes: aNodeList doesNotInclude: anotherNodeList [
	aNodeList 
		collect: #model
		thenDo: 
			[ :model | 
			self 
				deny: ((anotherNodeList collect: #model) includes: model)
				description: model asString , ' should not be referenced!' ] 
]

{ #category : #helpers }
MLGraphReducerTest >> mergedNodesIn: aNodeList [
	^ (aNodeList select: [ :node | node mergedNodes notNil ]) flatCollect: #mergedNodes
]

{ #category : #running }
MLGraphReducerTest >> setUp [
	super setUp.
	graphReducer := MLGraphReducer new
]

{ #category : #tests }
MLGraphReducerTest >> testComplexCycle2 [
	MLGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.
	self assert: graphReducer nodes size equals: 6.
	self assert: (graphReducer nodes at: 6) mergedNodes size equals: 4
]

{ #category : #tests }
MLGraphReducerTest >> testGraphReducingWhenNoCycle [
	| initialGraph |
	MLGraphFixture simpleGraph: graphReducer.
	initialGraph := graphReducer graph copy.
	graphReducer run.
	self assert: initialGraph equals: graphReducer graph
]

{ #category : #tests }
MLGraphReducerTest >> testMergedNodesNotReferencedInNextNodes [
	MLGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.

	self 
		assertNodes: (graphReducer nodes flatCollect: #nextNodes) 
		doesNotInclude: (self mergedNodesIn: graphReducer nodes)
]

{ #category : #tests }
MLGraphReducerTest >> testMergedNodesNotReferencedInPreviousNodes [
	MLGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.

	self 
		assertNodes: (graphReducer nodes flatCollect: #previousNodes) 
		doesNotInclude: (self mergedNodesIn: graphReducer nodes)

]

{ #category : #tests }
MLGraphReducerTest >> testNextNodesFor [
	| nodes |
	MLGraphFixture complexCycleGraph2: graphReducer.
	nodes := {(graphReducer findNode: $f) . (graphReducer findNode: $g)}.
	self
		assert: ((graphReducer nextNodesFor: nodes) collect: #model as: SortedCollection) asArray
		equals: #($a $b $d $e $i)
]

{ #category : #tests }
MLGraphReducerTest >> testNoCycle [
	MLGraphFixture complexCycleGraph2: graphReducer.
	graphReducer run.
	graphReducer nodes do:
		[ :node | 
		self 
			deny: ((node nextNodes includes: node) or: [ node previousNodes includes: node ])
			description: node asString, ' node is in cycle!' ]
]

{ #category : #tests }
MLGraphReducerTest >> testPreviousNodesFor [
	| nodes |
	MLGraphFixture complexCycleGraph2: graphReducer.
	nodes := {(graphReducer findNode: $f) . (graphReducer findNode: $g)}.
	self
		assert: ((graphReducer previousNodesFor: nodes) collect: #model as: SortedCollection) asArray
		equals: #($a $b $c)
]
