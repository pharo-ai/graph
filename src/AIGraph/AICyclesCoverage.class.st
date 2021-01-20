Class {
	#name : #AICyclesCoverage,
	#superclass : #AITarjan,
	#traits : 'AITNormalize',
	#classTraits : 'AITNormalize classTrait',
	#instVars : [
		'circuits',
		'sccExtractorClass'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AICyclesCoverage >> circuits [
	^ circuits
]

{ #category : #running }
AICyclesCoverage >> directCircuit: aCollection [

	^ self normalize: (OrderedCollection 
		with: aCollection first model 
		with: aCollection second model)
]

{ #category : #initialization }
AICyclesCoverage >> initialize [

	super initialize.
	self useNodeDecomposition 
]

{ #category : #accessing }
AICyclesCoverage >> retrieveCircuitsFromSccExtractor: sccExtractor [

	sccExtractor circuits do: [:c |
		circuits add: (c collect: [:n| n model]) ]
]

{ #category : #running }
AICyclesCoverage >> run [

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
AICyclesCoverage >> useCircuitSpan [

	sccExtractorClass := AICircuitSpanningEdges  
]

{ #category : #running }
AICyclesCoverage >> useEdgeDecomposition [

	sccExtractorClass := AISccEdgeDecomposition 
]

{ #category : #running }
AICyclesCoverage >> useNodeDecomposition [

	sccExtractorClass := AISccNodeDecomposition 
]
