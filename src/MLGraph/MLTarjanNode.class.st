"
Node type used by the MalTarjan algorithm.
Edges are not representated as full objects. We just keep a list of next nodes (following described directed edges).
"
Class {
	#name : #MLTarjanNode,
	#superclass : #MLNodeWithNext,
	#instVars : [
		'index',
		'lowlink',
		'inStack',
		'cycleNodes'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLTarjanNode >> cycleNodes [
	^ cycleNodes
]

{ #category : #setting }
MLTarjanNode >> cycleNodes: anObject [
	cycleNodes := anObject copy
		remove: self ;
		yourself
]

{ #category : #accessing }
MLTarjanNode >> inStack [
	^ inStack
]

{ #category : #setting }
MLTarjanNode >> inStack: anObject [
	inStack := anObject
]

{ #category : #initialization }
MLTarjanNode >> initialize [
	super initialize.
	nextNodes := Set new.
	index := -1.
	inStack := false
]

{ #category : #testing }
MLTarjanNode >> isInCycle [
	^ self cycleNodes isNotEmpty
]

{ #category : #testing }
MLTarjanNode >> isTarjanUndefined [
	^ index = -1
]

{ #category : #accessing }
MLTarjanNode >> label [
	^ 'T '
]

{ #category : #setting }
MLTarjanNode >> popped [
	self inStack: false
]

{ #category : #accessing }
MLTarjanNode >> tarjanIndex [
	^ index
]

{ #category : #setting }
MLTarjanNode >> tarjanIndex: anInteger [
	index := anInteger
]

{ #category : #accessing }
MLTarjanNode >> tarjanLowlink [
	^ lowlink
]

{ #category : #setting }
MLTarjanNode >> tarjanLowlink: anInteger [
	lowlink := anInteger
]
