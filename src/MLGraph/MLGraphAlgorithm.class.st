"
I'm the common superclass for all graphs related algorithms.
I store edges and nodes and provides convenience methods to add, access and find nodes or edges.

Once configured, send the run message to execute the algorithm.
"
Class {
	#name : #MLGraphAlgorithm,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges',
		'nodeSortBlock'
	],
	#category : #MLGraph
}

{ #category : #private }
MLGraphAlgorithm >> addEdge: eModel from: source to: target [
	| edge sourceNode targetNode |
	sourceNode := self findNode: (source value: eModel) ifAbsent: [ ^ nil ].
	targetNode := self findNode: (target value: eModel) ifAbsent: [ ^ nil ].
	self edgeClass
		ifNil: [ sourceNode to: targetNode.
			targetNode from: sourceNode.
			^ nil ]
		ifNotNil: [ edge := self edgeClass with: eModel.
			sourceNode to: targetNode edge: edge.
			targetNode from: sourceNode edge: edge.
			edge from: sourceNode.
			edge to: targetNode.
			self edges add: edge.
			^ edge ]
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> addNodeFor: aModel [
	^ self 
		findNode: aModel
		ifAbsent: [ nodes add: (self nodeClass with: aModel) ]
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> addNodesFrom: model childrenBlock: childrenBlock [
	"recursively add nodes from the model"
	| parent |
	model ifNil: [ ^ self ].

	self
		findNode: model
		ifFound: [ ^ self "Prevent cycles. Do not add a node already added." ].

	parent := self addNodeFor: model.
	(childrenBlock value: model)
		do: [ :child | 
				self addNodesFrom: child childrenBlock: childrenBlock.
				self addEdge: { parent model . child } from: #first to: #second ]
]

{ #category : #testing }
MLGraphAlgorithm >> canUseSortedNodes [
	"New implementation of the algos to have better performances to find nodes"

	"If nodes are sorted following this block, the find method will be a lot faster. The block should be set on the run method and the nodes sorted at this moment"

	^ nodeSortBlock isNotNil
]

{ #category : #configuration }
MLGraphAlgorithm >> edgeClass [
	^ nil
]

{ #category : #accessing }
MLGraphAlgorithm >> edges [
	^ edges
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> edges: aCollection from: source to: target [
	aCollection 
		do: [ :eModel |	self addEdge: eModel from: source to: target ]
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> edges: aCollection from: source to: target weight: weightFunction [
	| edge |
	aCollection 
		do: [ :eModel |
			edge := self addEdge: eModel from: source to: target.
			edge ifNotNil: [edge weight: (weightFunction value: eModel)] ]
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> edges: aCollection from: source toAll: targets [
	aCollection
		do: [ :eModel | 
			(targets value: eModel)
				do: [ :target | 
					self
						addEdge:
							{(source value: eModel).
							target}
						from: #first
						to: #second ] ]
]

{ #category : #private }
MLGraphAlgorithm >> ensureNodesAreSorted [
	"New implementation of the algos to have better performances to find nodes"
	"If one change is made in the node list, one should call again sortNodes"

	nodeSortBlock ifNotNil: [ ^ self ].
	self nodeSortBlock: [ :a :b | a model hash <= b model hash ].
	self sortNodes
]

{ #category : #private }
MLGraphAlgorithm >> findBinaryBlock: aModel [
	"New implementation of the algos to have better performances to find nodes"
	^ [ :aNode | 
	aNode model = aModel
		ifTrue: [ 0 ]
		ifFalse: [ aModel hash < aNode model hash
				ifTrue: [ -1 ]
				ifFalse: [ 1 ] ] ]
]

{ #category : #accessing }
MLGraphAlgorithm >> findEdge: aModel [
	^ self edges detect: [:edge | edge model = aModel]
]

{ #category : #accessing }
MLGraphAlgorithm >> findNode: aModel [
	self canUseSortedNodes
		ifFalse: [ ^ self nodes detect: [ :aNode | aNode model = aModel ] ].
	^ self nodes findBinary: (self findBinaryBlock: aModel)
]

{ #category : #accessing }
MLGraphAlgorithm >> findNode: aModel ifAbsent: aBlock [
	self canUseSortedNodes
		ifFalse: [ ^ self nodes detect: [ :node | node model = aModel ] ifNone: aBlock ].
^ self nodes
		findBinary: (self findBinaryBlock: aModel) ifNone: aBlock
]

{ #category : #accessing }
MLGraphAlgorithm >> findNode: aModel ifFound: aBlock [
	self canUseSortedNodes
		ifFalse: [ ^ self nodes detect: [ :node | node model = aModel ] ifFound: aBlock ].
	"New implementation of the algos to have better performances to find nodes"
	self notYetImplemented
]

{ #category : #accessing }
MLGraphAlgorithm >> graph [
	^ {self nodes . self edges}
]

{ #category : #initialization }
MLGraphAlgorithm >> initialize [
	nodes := OrderedCollection new.
	edges := OrderedCollection new.
]

{ #category : #configuration }
MLGraphAlgorithm >> nodeClass [
	^ MLGraphNode
]

{ #category : #accessing }
MLGraphAlgorithm >> nodeSortBlock: aBlockClosure [ 
	nodeSortBlock := aBlockClosure
]

{ #category : #accessing }
MLGraphAlgorithm >> nodes [
	^ nodes
]

{ #category : #'building - graph' }
MLGraphAlgorithm >> nodes: aNodeList [
	aNodeList 
		do: [ :model |	self addNodeFor: model ]
]

{ #category : #adding }
MLGraphAlgorithm >> nodesFromSet: aSet [
	"Ensure that the collection do not contains any duplicated item"

	self assert: aSet class == Set.
	nodes addAll: (aSet collect: [ :aModel | self nodeClass with: aModel ])
]

{ #category : #private }
MLGraphAlgorithm >> privateEdges: aCollection [

	edges := aCollection 
]

{ #category : #private }
MLGraphAlgorithm >> privateNodes: aCollection [

	nodes := aCollection 
]

{ #category : #running }
MLGraphAlgorithm >> run [

	self subclassResponsibility 
]

{ #category : #private }
MLGraphAlgorithm >> sortNodes [
	self canUseSortedNodes ifFalse: [ ^self ].
	self nodes sort: nodeSortBlock.
]
