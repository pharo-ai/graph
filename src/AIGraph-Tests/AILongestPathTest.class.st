Class {
	#name : #AILongestPathTest,
	#superclass : #TestCase,
	#instVars : [
		'longestPath'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #helpers }
AILongestPathTest >> assert: aCollectionOfNodesModel hasWeight: values [
	self assert: aCollectionOfNodesModel size equals: values size.
	aCollectionOfNodesModel
		withIndexDo: [ :element :index | self assert: (longestPath findNode: element) pathWeight equals: (values at: index) ]
]

{ #category : #running }
AILongestPathTest >> setUp [
	super setUp.
	longestPath := AILongestPath new
]

{ #category : #tests }
AILongestPathTest >> testIsCompletedInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath computeLeafNodes.
	self deny: longestPath isCompleted
]

{ #category : #tests }
AILongestPathTest >> testLeafNodesInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath computeLeafNodes.
	self assert: (longestPath leafNodes collect: #model) equals: #($c) asOrderedCollection
]

{ #category : #tests }
AILongestPathTest >> testRootNodesInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath computeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $d) asOrderedCollection
]

{ #category : #tests }
AILongestPathTest >> testRootNodesInWithoutCyclesMediumGraph [
	AIGraphFixture withoutCyclesMediumGraph: longestPath.
	longestPath computeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $b) asOrderedCollection
]

{ #category : #tests }
AILongestPathTest >> testRootNodesRankIsZeroInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath initializeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $d) asOrderedCollection.
	self assert: (longestPath rootNodes collect: #pathWeight) equals: #(0 0) asOrderedCollection
]

{ #category : #tests }
AILongestPathTest >> testRunInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath run.
	self assert: ($a to: $d) hasWeight: #(0 1 2 0)
]

{ #category : #tests }
AILongestPathTest >> testRunInWithoutCyclesComplexGraph [
	AIGraphFixture withoutCyclesComplexGraph: longestPath.
	longestPath run.
	self assert: ($a to: $s) hasWeight: #(0 0 1 2 1 3 1 1 4 0 1 1 2 2 2 3 2 5 6)
]

{ #category : #tests }
AILongestPathTest >> testRunInWithoutCyclesMediumGraph [
	AIGraphFixture withoutCyclesMediumGraph: longestPath.
	longestPath run.
	self assert: ($a to: $h) hasWeight: #(0 0 1 2 1 3 1 1)
]

{ #category : #tests }
AILongestPathTest >> testRunIsCompletedInSimpleGraph [
	AIGraphFixture simpleGraph: longestPath.
	longestPath run.
	self assert: longestPath isCompleted
]
