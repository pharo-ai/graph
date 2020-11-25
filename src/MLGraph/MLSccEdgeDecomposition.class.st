Class {
	#name : #MLSccEdgeDecomposition,
	#superclass : #MLSccExtractor,
	#traits : 'MLTNormalize',
	#classTraits : 'MLTNormalize classTrait',
	#instVars : [
		'bfsp'
	],
	#category : #MLGraph
}

{ #category : #running }
MLSccEdgeDecomposition >> bfsPathFrom: startNode to: endNode [
	^ bfsp
		start: startNode;
		end: endNode;
		run
]

{ #category : #configuration }
MLSccEdgeDecomposition >> edgeClass [
	^ MLGraphEdge 
]

{ #category : #initialization }
MLSccEdgeDecomposition >> initialize [ 
	super initialize.
	bfsp := MLBreadthFirstSearchPath new.

]

{ #category : #configuration }
MLSccEdgeDecomposition >> nodeClass [
	^ MLBfsNode 
]

{ #category : #running }
MLSccEdgeDecomposition >> run [
	bfsp 
		privateNodes: self nodes;
		privateEdges: self edges.
	self edges do: [:e||c|
		c := self 
			bfsPathFrom: e to 
			to: e from.
		self addCircuit: (self normalize: c) ]
]
