Class {
	#name : #AISccEdgeDecomposition,
	#superclass : #AISccExtractor,
	#traits : 'AITNormalize',
	#classTraits : 'AITNormalize classTrait',
	#instVars : [
		'bfsp'
	],
	#category : #AIGraph
}

{ #category : #running }
AISccEdgeDecomposition >> bfsPathFrom: startNode to: endNode [
	^ bfsp
		start: startNode;
		end: endNode;
		run
]

{ #category : #configuration }
AISccEdgeDecomposition >> edgeClass [
	^ AIGraphEdge 
]

{ #category : #initialization }
AISccEdgeDecomposition >> initialize [ 
	super initialize.
	bfsp := AIBreadthFirstSearchPath new.

]

{ #category : #configuration }
AISccEdgeDecomposition >> nodeClass [
	^ AIBfsNode 
]

{ #category : #running }
AISccEdgeDecomposition >> run [
	bfsp 
		privateNodes: self nodes;
		privateEdges: self edges.
	self edges do: [:e||c|
		c := self 
			bfsPathFrom: e to 
			to: e from.
		self addCircuit: (self normalize: c) ]
]
