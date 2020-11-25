Class {
	#name : #MLLongestPathTest,
	#superclass : #TestCase,
	#instVars : [
		'longestPath'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #helpers }
MLLongestPathTest >> assert: aCollectionOfNodesModel hasWeight: values [
	self assert: aCollectionOfNodesModel size equals: values size.
	aCollectionOfNodesModel
		withIndexDo: [ :element :index | self assert: (longestPath findNode: element) pathWeight equals: (values at: index) ]
]

{ #category : #running }
MLLongestPathTest >> setUp [
	super setUp.
	longestPath := MLLongestPath new
]

{ #category : #tests }
MLLongestPathTest >> testIsCompletedInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath computeLeafNodes.
	self deny: longestPath isCompleted
]

{ #category : #tests }
MLLongestPathTest >> testLeafNodesInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath computeLeafNodes.
	self assert: (longestPath leafNodes collect: #model) equals: #($c) asOrderedCollection
]

{ #category : #tests }
MLLongestPathTest >> testRootNodesInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath computeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $d) asOrderedCollection
]

{ #category : #tests }
MLLongestPathTest >> testRootNodesInWithoutCyclesMediumGraph [
	MLGraphFixture withoutCyclesMediumGraph: longestPath.
	longestPath computeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $b) asOrderedCollection
]

{ #category : #tests }
MLLongestPathTest >> testRootNodesRankIsZeroInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath initializeRootNodes.
	self assert: (longestPath rootNodes collect: #model) equals: #($a $d) asOrderedCollection.
	self assert: (longestPath rootNodes collect: #pathWeight) equals: #(0 0) asOrderedCollection
]

{ #category : #tests }
MLLongestPathTest >> testRunInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath run.
	self assert: ($a to: $d) hasWeight: #(0 1 2 0)
]

{ #category : #tests }
MLLongestPathTest >> testRunInWithoutCyclesComplexGraph [
	MLGraphFixture withoutCyclesComplexGraph: longestPath.
	longestPath run.
	self assert: ($a to: $s) hasWeight: #(0 0 1 2 1 3 1 1 4 0 1 1 2 2 2 3 2 5 6)
]

{ #category : #tests }
MLLongestPathTest >> testRunInWithoutCyclesMediumGraph [
	MLGraphFixture withoutCyclesMediumGraph: longestPath.
	longestPath run.
	self assert: ($a to: $h) hasWeight: #(0 0 1 2 1 3 1 1)
]

{ #category : #tests }
MLLongestPathTest >> testRunIsCompletedInSimpleGraph [
	MLGraphFixture simpleGraph: longestPath.
	longestPath run.
	self assert: longestPath isCompleted
]
