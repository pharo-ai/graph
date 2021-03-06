"
From wikipedia:
A topological sort (sometimes abbreviated topsort or toposort) or topological ordering of a directed graph is a linear ordering of its vertices such that for every directed edge uv from vertex u to vertex v, u comes before v in the ordering. For instance, the vertices of the graph may represent tasks to be performed, and the edges may represent constraints that one task must be performed before another; in this application, a topological ordering is just a valid sequence for the tasks. A topological ordering is possible if and only if the graph has no directed cycles, that is, if it is a directed acyclic graph (DAG). Any DAG has at least one topological ordering, and algorithms are known for constructing a topological ordering of any DAG in linear time.
"
Class {
	#name : #AITopologicalSorting,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'sortedElements',
		'verticesWithNoIncomingEdge'
	],
	#category : #AIGraph
}

{ #category : #private }
AITopologicalSorting >> computeVerticesWithNoIncomingEdge [
	verticesWithNoIncomingEdge := nodes select: [ :node | node previousNodes isEmpty ]
]

{ #category : #private }
AITopologicalSorting >> graphHasEdges [
	^ (nodes allSatisfy: [ :node | node nextNodes isEmpty ]) not
]

{ #category : #initialization }
AITopologicalSorting >> initialize [
	super initialize.
	sortedElements := OrderedCollection new
]

{ #category : #configuration }
AITopologicalSorting >> nodeClass [
	^ AINodeWithPreviousAndNext
]

{ #category : #private }
AITopologicalSorting >> removeEdgesOf: aNode [
	aNode nextNodes 
		do: [ :node |
				node previousNodes remove: aNode.
				node previousNodes 
					ifEmpty: [ verticesWithNoIncomingEdge add: node ] ].
	aNode nextNodes: #().
]

{ #category : #private }
AITopologicalSorting >> removeVerticeWithNoIncomingEdge [
	| vertice |
	
	vertice := verticesWithNoIncomingEdge anyOne.
	verticesWithNoIncomingEdge remove: vertice.
	^ vertice	
]

{ #category : #running }
AITopologicalSorting >> run [
	self computeVerticesWithNoIncomingEdge.
	[ verticesWithNoIncomingEdge isEmpty ]
		whileFalse: [ | node |
			node := self removeVerticeWithNoIncomingEdge.
			sortedElements addLast: node.
			self removeEdgesOf: node ].
	self graphHasEdges
		ifTrue: [ Error signal: 'Not a DAG (Directed Acyclic Graph)' ].
	^ sortedElements reverse
]
