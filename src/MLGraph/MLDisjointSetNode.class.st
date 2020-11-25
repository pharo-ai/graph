Class {
	#name : #MLDisjointSetNode,
	#superclass : #MLGraphNode,
	#instVars : [
		'parent'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLDisjointSetNode >> find [
	^ self = parent ifTrue: [ self ] ifFalse: [ parent find ]
]

{ #category : #accessing }
MLDisjointSetNode >> label [

	^ 'DSN '
]

{ #category : #accessing }
MLDisjointSetNode >> makeSet [
	parent := self
]

{ #category : #'private-accessing' }
MLDisjointSetNode >> parent [
	^ parent
]

{ #category : #'private-accessing' }
MLDisjointSetNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
MLDisjointSetNode >> union: aDSNode [

	aDSNode find parent: self find
]
