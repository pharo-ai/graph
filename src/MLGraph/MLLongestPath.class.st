"
A MalLongestPath is the implementation of the longest path algo.
This is working only on graph not weighted and without circuits

See tests for more informations

"
Class {
	#name : #MLLongestPath,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'previousRanks',
		'rootNodes',
		'leafNodes',
		'maxIterations'
	],
	#category : #MLGraph
}

{ #category : #computing }
MLLongestPath >> computeLeafNodes [
	self leafNodes: (self nodes select: [ :node | node nextEdges isEmpty ])
]

{ #category : #computing }
MLLongestPath >> computeRootNodes [
	self rootNodes: (self nodes select: [ :node | node previousEdges isEmpty ])
]

{ #category : #computing }
MLLongestPath >> computeStep [
	| currentRank |
	self isCompleted ifTrue: [ ^ self ].
	currentRank := OrderedCollection new.
	(self nodes difference: previousRanks)
		select: [ :node | previousRanks includesAll: node previousNodes ]
		thenDo: [ :node | 
			currentRank add: node.
			node pathWeight: (node previousNodes max: [ :maxNode | maxNode pathWeight ]) + 1 ].
	previousRanks addAll: currentRank.
	maxIterations := maxIterations - 1.
	self computeStep
]

{ #category : #configuration }
MLLongestPath >> edgeClass [
	^ MLGraphEdge
]

{ #category : #initialization }
MLLongestPath >> initialize [
	super initialize.
	maxIterations := -1.
	previousRanks := OrderedCollection new
]

{ #category : #initialization }
MLLongestPath >> initializeRootNodes [
	self computeRootNodes.
	self setRanks: self rootNodes at: 0
]

{ #category : #testing }
MLLongestPath >> isCompleted [
	maxIterations isZero
		ifTrue: [ self error: 'Algorithm should be finished by now...'.
			^ true ].
	^ (self leafNodes anySatisfy: [ :node | node pathWeight = Float infinity ]) not
]

{ #category : #accessing }
MLLongestPath >> leafNodes [
	^ leafNodes
	
]

{ #category : #accessing }
MLLongestPath >> leafNodes: aCollectionOfNodes [
	leafNodes := aCollectionOfNodes
]

{ #category : #configuration }
MLLongestPath >> nodeClass [
	^ MLDijkstraNode
]

{ #category : #accessing }
MLLongestPath >> rootNodes [
	^ rootNodes 
	
]

{ #category : #accessing }
MLLongestPath >> rootNodes: aCollectionOfNodes [
	rootNodes := aCollectionOfNodes 
	
]

{ #category : #running }
MLLongestPath >> run [
	self ensureNodesAreSorted.
	self initializeRootNodes.
	self computeLeafNodes.
	previousRanks addAll: self rootNodes.
	maxIterations := self nodes size + 20.
	self computeStep
]

{ #category : #setting }
MLLongestPath >> setRanks: collectionOfNodes at: aRank [
	collectionOfNodes do: [ :aNode | aNode pathWeight: aRank ]
	
]
