Class {
	#name : #MLHitsFixtureTest,
	#superclass : #TestCase,
	#instVars : [
		'hits'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #running }
MLHitsFixtureTest >> setUp [
	super setUp.
	hits := MLHits new
]

{ #category : #tests }
MLHitsFixtureTest >> testComplexCycle [
	MLGraphFixture complexCycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
MLHitsFixtureTest >> testComplexWCycle [
	MLGraphFixture complexWeightedGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
MLHitsFixtureTest >> testCycle [
	MLGraphFixture cycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
MLHitsFixtureTest >> testNestedCycle [
	MLGraphFixture nestedCycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
MLHitsFixtureTest >> testSimple [
	MLGraphFixture simpleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
MLHitsFixtureTest >> testSimpleW [
	MLGraphFixture simpleWeightedGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]
