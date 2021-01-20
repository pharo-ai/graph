Class {
	#name : #AICseEdge,
	#superclass : #AIDijkstraEdge,
	#instVars : [
		'cseVisited'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AICseEdge >> cseVisited [
	^ cseVisited
]

{ #category : #accessing }
AICseEdge >> cseVisited: aBoolean [
	cseVisited := aBoolean
]

{ #category : #initialization }
AICseEdge >> initialize [ 

	super initialize.
	self cseVisited: false.
]
