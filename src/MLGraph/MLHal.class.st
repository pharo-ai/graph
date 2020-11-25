Class {
	#name : #MLHal,
	#superclass : #MLTarjan,
	#instVars : [
		'nodesToVisit'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLHal >> hierarchyLevels [
	| map level |
	map := Dictionary new.
	self nodes do: [ :node | 
		level := map 
			at: node hNumber 
			ifAbsentPut: [OrderedCollection new].
		level add: node
	].
	^ map
]

{ #category : #running }
MLHal >> initializeHal [
	| entryNodes |
	nodesToVisit := OrderedCollection new.
	self nodes do: #removeCycleFromEdges.
	entryNodes := self nodes select: #isSource.
	entryNodes do: [ :n | n hNumber: 0 ].
	nodesToVisit addAll: entryNodes
]

{ #category : #running }
MLHal >> mainLoop [
	| cnode touchedCycle |
	[ nodesToVisit isEmpty ]
		whileFalse: [ 
			cnode := nodesToVisit removeFirst.
			cnode nextNodes
				do: [ :next | 
					touchedCycle := next markHNumber: cnode hNumber + 1.
					nodesToVisit addAll: touchedCycle ].
			nodesToVisit addAll: cnode nextNodes ]
]

{ #category : #configuration }
MLHal >> nodeClass [
	^ MLHalNode
]

{ #category : #running }
MLHal >> run [
	super run.
	self initializeHal.
	self mainLoop
]

{ #category : #logging }
MLHal >> showLevels [
	^ String
		streamContents: [ :s | 
			self hierarchyLevels
				keysAndValuesDo: [ :k :v | 
					s print: k.
					v
						do: [ :n | 
							s
								space;
								print: n ].
					s cr ] ]
]
