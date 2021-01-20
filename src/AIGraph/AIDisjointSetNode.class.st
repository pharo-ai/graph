Class {
	#name : #AIDisjointSetNode,
	#superclass : #AIGraphNode,
	#instVars : [
		'parent'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIDisjointSetNode >> find [
	^ self = parent ifTrue: [ self ] ifFalse: [ parent find ]
]

{ #category : #accessing }
AIDisjointSetNode >> label [

	^ 'DSN '
]

{ #category : #accessing }
AIDisjointSetNode >> makeSet [
	parent := self
]

{ #category : #'private-accessing' }
AIDisjointSetNode >> parent [
	^ parent
]

{ #category : #'private-accessing' }
AIDisjointSetNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
AIDisjointSetNode >> union: aDSNode [

	aDSNode find parent: self find
]
