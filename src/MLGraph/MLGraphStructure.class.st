Class {
	#name : #MLGraphStructure,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'nodeClass',
		'edgeClass'
	],
	#category : #MLGraph
}

{ #category : #configuration }
MLGraphStructure >> edgeClass [

	^ edgeClass
]

{ #category : #configuration }
MLGraphStructure >> edgeClass: anObject [
	edgeClass := anObject
]

{ #category : #accessing }
MLGraphStructure >> edgeModels [

	^ self edges collect: [:e | e model]
]

{ #category : #configuration }
MLGraphStructure >> nodeClass [

	^ nodeClass
]

{ #category : #configuration }
MLGraphStructure >> nodeClass: anObject [
	nodeClass := anObject
]

{ #category : #accessing }
MLGraphStructure >> nodeModels [

	^ self nodes collect: [:n | n model]
]

{ #category : #running }
MLGraphStructure >> run [
	self shouldNotImplement
]
