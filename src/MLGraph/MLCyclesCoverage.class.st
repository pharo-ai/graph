Class {
	#name : #MLCyclesCoverage,
	#superclass : #MLTarjan,
	#traits : 'MLTNormalize',
	#classTraits : 'MLTNormalize classTrait',
	#instVars : [
		'circuits',
		'sccExtractorClass'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLCyclesCoverage >> circuits [
	^ circuits
]

{ #category : #running }
MLCyclesCoverage >> directCircuit: aCollection [

	^ self normalize: (OrderedCollection 
		with: aCollection first model 
		with: aCollection second model)
]

{ #category : #initialization }
MLCyclesCoverage >> initialize [

	super initialize.
	self useNodeDecomposition 
]

{ #category : #accessing }
MLCyclesCoverage >> retrieveCircuitsFromSccExtractor: sccExtractor [

	sccExtractor circuits do: [:c |
		circuits add: (c collect: [:n| n model]) ]
]

{ #category : #running }
MLCyclesCoverage >> run [

	super run.
	circuits := OrderedCollection new.
	self stronglyConnectedComponents do: [:scc|
		(scc size > 2) ifTrue: [|sccExtractor|
			sccExtractor := sccExtractorClass new.
			sccExtractor nodes: scc.
			"graph injection remove outgoing edges from SCC"
			sccExtractor edges: scc from: #yourself toAll: #nextNodes.
			sccExtractor run.
			self retrieveCircuitsFromSccExtractor: sccExtractor ].
		(scc size = 2) ifTrue: [
			circuits add: (self directCircuit: scc) ]. "direct circuit"
		]
]

{ #category : #running }
MLCyclesCoverage >> useCircuitSpan [

	sccExtractorClass := MLCircuitSpanningEdges  
]

{ #category : #running }
MLCyclesCoverage >> useEdgeDecomposition [

	sccExtractorClass := MLSccEdgeDecomposition 
]

{ #category : #running }
MLCyclesCoverage >> useNodeDecomposition [

	sccExtractorClass := MLSccNodeDecomposition 
]
