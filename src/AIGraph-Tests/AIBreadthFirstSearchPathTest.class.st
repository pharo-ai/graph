Class {
	#name : #AIBreadthFirstSearchPathTest,
	#superclass : #TestCase,
	#instVars : [
		'bfsp'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #running }
AIBreadthFirstSearchPathTest >> setUp [
	super setUp.
	bfsp := AIBreadthFirstSearchPath new
]

{ #category : #tests }
AIBreadthFirstSearchPathTest >> testAseGraph [
	AIGraphFixture aseCircuitGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $b $c) hasEqualElements: (bfsp runFrom: $d to: $c)).
	self assert: (#($e $a) hasEqualElements: (bfsp runFrom: $e to: $a)).
	self assert: (#($a $b $d $e) hasEqualElements: (bfsp runFrom: $a to: $e)).
	self assert: (#($d $b $c $f) hasEqualElements: (bfsp runFrom: $d to: $f)).
	self should: [ bfsp runFrom: $f to: $a ] raise: Error
]

{ #category : #tests }
AIBreadthFirstSearchPathTest >> testSimpleGraph [
	AIGraphFixture simpleGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $c) hasEqualElements: (bfsp runFrom: $d to: $c))
]
