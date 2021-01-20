Class {
	#name : #AIGraphStructure,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'nodeClass',
		'edgeClass'
	],
	#category : #AIGraph
}

{ #category : #configuration }
AIGraphStructure >> edgeClass [

	^ edgeClass
]

{ #category : #configuration }
AIGraphStructure >> edgeClass: anObject [
	edgeClass := anObject
]

{ #category : #accessing }
AIGraphStructure >> edgeModels [

	^ self edges collect: [:e | e model]
]

{ #category : #configuration }
AIGraphStructure >> nodeClass [

	^ nodeClass
]

{ #category : #configuration }
AIGraphStructure >> nodeClass: anObject [
	nodeClass := anObject
]

{ #category : #accessing }
AIGraphStructure >> nodeModels [

	^ self nodes collect: [:n | n model]
]

{ #category : #running }
AIGraphStructure >> run [
	self shouldNotImplement
]
