Class {
	#name : #MLCyclesCoverageTest,
	#superclass : #TestCase,
	#instVars : [
		'cc'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #running }
MLCyclesCoverageTest >> setUp [
	super setUp.
	cc := MLCyclesCoverage new
]

{ #category : #'tests-cse' }
MLCyclesCoverageTest >> testAseCircuitWithCse [
	cc useCircuitSpan.
	MLGraphFixture aseCircuitGraph: cc.
	cc run.
	self assert: 5 equals: cc circuits size.
	#(#($g $h) #($b $d) #($a $b) #($b $c $d) #($a $b $d $e))
		do: [ :c | self assert: (cc circuits anySatisfy: [ :ci | c hasEqualElements: (cc normalize: ci) ]) ]
]

{ #category : #'tests-sed' }
MLCyclesCoverageTest >> testAseCircuitWithSed [
	cc useEdgeDecomposition.
	MLGraphFixture aseCircuitGraph: cc.
	cc run.
	self assert: 5 equals: cc circuits size.
	#(#($g $h) #($b $d) #($a $b) #($b $c $d) #($a $b $d $e))
		do: [ :c | self assert: (cc circuits anySatisfy: [ :ci | c hasEqualElements: ci ]) ]
]

{ #category : #'tests-snd' }
MLCyclesCoverageTest >> testAseCircuitWithSnd [
	MLGraphFixture aseCircuitGraph: cc.
	cc run.
	self assert: 5 equals: cc circuits size.
	#(($g $h) ($b $d) ($a $b) ($b $c $d) ($a $b $d $e)) do: [:c|
			self assert: (cc circuits anySatisfy: [:ci| c hasEqualElements: ci ])].

]

{ #category : #'tests-cse' }
MLCyclesCoverageTest >> testAseSccWithCse [
	| cse |
	cse := MLCircuitSpanningEdges new.
	MLGraphFixture aseSccGraph: cse.
	cse run.
	self assert: 4 equals: cse circuits size.
	self assert: (#($a $b) hasEqualElements: cse circuits first).
	self assert: (#($b $d) hasEqualElements: cse circuits second).
	self assert: (#($c $d $b) hasEqualElements: cse circuits third).
	self assert: (#($e $a $b $d) hasEqualElements: cse circuits fourth)
]

{ #category : #'tests-sed' }
MLCyclesCoverageTest >> testAseSccWithSed [
	| sed circuits |
	sed := MLSccEdgeDecomposition new.
	MLGraphFixture aseSccGraph: sed.
	sed run.
	self assert: 4 equals: sed circuits size.
	circuits := sed circuits asOrderedCollection.
	#(#($b $d) #($a $b) #($b $c $d) #($a $b $d $e))
		do: [ :c | self assert: (circuits anySatisfy: [ :ci | c hasEqualElements: ci ]) ]
]

{ #category : #'tests-snd' }
MLCyclesCoverageTest >> testAseSccWithSnd [
	| sed circuits |
	sed := MLSccNodeDecomposition new.
	MLGraphFixture aseSccGraph: sed.
	sed run.
	self assert: 4 equals: sed circuits size.
	circuits := sed circuits asOrderedCollection.
	#(#($b $d) #($a $b) #($b $c $d) #($a $b $d $e))
		do: [ :c | self assert: (circuits anySatisfy: [ :ci | c hasEqualElements: ci ]) ]
]

{ #category : #testing }
MLCyclesCoverageTest >> testNormalize [
	self assert: (#($a $b) hasEqualElements: (cc normalize: #($a $b) asOrderedCollection)).
	self assert: (#($a $b) hasEqualElements: (cc normalize: #($b $a) asOrderedCollection)).
	self assert: (#($b $c $d) hasEqualElements: (cc normalize: #($c $d $b) asOrderedCollection)).
	self assert: (#($a $e $b $f $d) hasEqualElements: (cc normalize: #($e $b $f $d $a) asOrderedCollection))
]
