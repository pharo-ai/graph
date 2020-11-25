"
Default representation of a graph vertice (node).
"
Class {
	#name : #MLGraphNode,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #MLGraph
}

{ #category : #'instance creation' }
MLGraphNode class >> with: aModel [

	^ self new model: aModel
]

{ #category : #accessing }
MLGraphNode >> from: sourceNode [
]

{ #category : #accessing }
MLGraphNode >> from: sourceNode edge: anEdge [
]

{ #category : #accessing }
MLGraphNode >> label [

	^ 'N '
]

{ #category : #accessing }
MLGraphNode >> model [
	^ model
]

{ #category : #accessing }
MLGraphNode >> model: aModel [

	model := aModel
]

{ #category : #printing }
MLGraphNode >> printOn: stream [
	stream nextPutAll: self label.
	model printOn: stream
]

{ #category : #accessing }
MLGraphNode >> to: targetNode [
]

{ #category : #accessing }
MLGraphNode >> to: targetNode edge: anEdge [
]
