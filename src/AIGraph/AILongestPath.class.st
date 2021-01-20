"
A MalLongestPath is the implementation of the longest path algo.
This is working only on graph not weighted and without circuits

See tests for more informations

"
Class {
	#name : #AILongestPath,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'previousRanks',
		'rootNodes',
		'leafNodes',
		'maxIterations'
	],
	#category : #AIGraph
}

{ #category : #computing }
AILongestPath >> computeLeafNodes [
	self leafNodes: (self nodes select: [ :node | node nextEdges isEmpty ])
]

{ #category : #computing }
AILongestPath >> computeRootNodes [
	self rootNodes: (self nodes select: [ :node | node previousEdges isEmpty ])
]

{ #category : #computing }
AILongestPath >> computeStep [
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
AILongestPath >> edgeClass [
	^ AIGraphEdge
]

{ #category : #initialization }
AILongestPath >> initialize [
	super initialize.
	maxIterations := -1.
	previousRanks := OrderedCollection new
]

{ #category : #initialization }
AILongestPath >> initializeRootNodes [
	self computeRootNodes.
	self setRanks: self rootNodes at: 0
]

{ #category : #testing }
AILongestPath >> isCompleted [
	maxIterations isZero
		ifTrue: [ self error: 'Algorithm should be finished by now...'.
			^ true ].
	^ (self leafNodes anySatisfy: [ :node | node pathWeight = Float infinity ]) not
]

{ #category : #accessing }
AILongestPath >> leafNodes [
	^ leafNodes
	
]

{ #category : #accessing }
AILongestPath >> leafNodes: aCollectionOfNodes [
	leafNodes := aCollectionOfNodes
]

{ #category : #configuration }
AILongestPath >> nodeClass [
	^ AIDijkstraNode
]

{ #category : #accessing }
AILongestPath >> rootNodes [
	^ rootNodes 
	
]

{ #category : #accessing }
AILongestPath >> rootNodes: aCollectionOfNodes [
	rootNodes := aCollectionOfNodes 
	
]

{ #category : #running }
AILongestPath >> run [
	self ensureNodesAreSorted.
	self initializeRootNodes.
	self computeLeafNodes.
	previousRanks addAll: self rootNodes.
	maxIterations := self nodes size + 20.
	self computeStep
]

{ #category : #setting }
AILongestPath >> setRanks: collectionOfNodes at: aRank [
	collectionOfNodes do: [ :aNode | aNode pathWeight: aRank ]
	
]
