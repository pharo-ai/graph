"
I represent an edge in a graph.  I'm part of the edges of a MalGraphAlgorithm and I link two MalNode together.

Public API and Key Messages
- from
- to 
- model 
 
Instance Variables
	from: <MalNode>
	to: <MalNode>
	model: <Object>
"
Class {
	#name : #MLGraphEdge,
	#superclass : #Object,
	#instVars : [
		'model',
		'from',
		'to'
	],
	#category : #MLGraph
}

{ #category : #'instance creation' }
MLGraphEdge class >> with: aModel [

	^ self new model: aModel
]

{ #category : #'instance creation' }
MLGraphEdge class >> with: aModel from: srcNode to: dstNode [
	| edge |
	edge := self new.
	edge model: aModel.
	edge from: srcNode.
	edge to: dstNode.
	^ edge.
]

{ #category : #accessing }
MLGraphEdge >> asTuple [

	^ {from model. to model}
]

{ #category : #accessing }
MLGraphEdge >> from [
	^ from
]

{ #category : #accessing }
MLGraphEdge >> from: anObject [
	from := anObject
]

{ #category : #accessing }
MLGraphEdge >> model [
	^ model
]

{ #category : #accessing }
MLGraphEdge >> model: aModel [
	
	model := aModel
]

{ #category : #printing }
MLGraphEdge >> printOn: aStream [
	self from printOn: aStream.
	aStream nextPutAll: ' -> '.
	self to printOn: aStream
]

{ #category : #accessing }
MLGraphEdge >> to [
	^ to
]

{ #category : #accessing }
MLGraphEdge >> to: anObject [
	to := anObject
]
