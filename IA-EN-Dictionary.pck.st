'From Cuis 6.0 [latest update: #5483] on 29 November 2022 at 8:23:46 pm'!
'Description Implémentation class methods : Initialize and 4 methods for lockup'!
!provides: 'IA-EN-Dictionary' 1 1!
SystemOrganization addCategory: 'IA-EN-Dictionary'!


!classDefinition: #IEDict category: 'IA-EN-Dictionary'!
Object subclass: #IEDict
	instanceVariableNames: ''
	classVariableNames: 'DictData'
	poolDictionaries: ''
	category: 'IA-EN-Dictionary'!
!classDefinition: 'IEDict class' category: 'IA-EN-Dictionary'!
IEDict class
	instanceVariableNames: ''!


!IEDict commentStamp: '<historical>' prior: 0!
I embody a specialised Dictionary of InterLingua->English

Class intention
I am not like a regular dictionary because I maintain my definitions in an array of two element arrays #('interlingua definition' 'English definition'). All definitions which contain a search match are returned.!

!IEDict class methodsFor: 'class initialization' stamp: 'av 11/29/2022 20:08:36'!
initialize
	"Read in my data"
"
	IEDict initialize.
"
	| curIndex aLine |
	DictData := Array new: 31034. "We know the exact size (wc -l iedict.txt) less 1"

	(self package packageDirectory  // 'iedict.txt') readStreamDo: [ :fileStream |
		fileStream nextLine. "Skip initial comment line"
		curIndex := 1.
		aLine := fileStream nextLine. 
		[aLine isNil] whileFalse: [
			DictData at: curIndex 
				  put: ((aLine findBetweenSubStrs: ':') 
						collect: [:str| str withBlanksTrimmed]). 
			aLine := fileStream nextLine. 
			curIndex := 1 + curIndex.
		]
	] ! !

!IEDict class methodsFor: 'lockup' stamp: 'av 11/29/2022 20:19:46'!
englishContains: aString
	"Answer all definition pairs which contain aString looking in the English side"

	| matchStr |
	matchStr :=  ('*' , aString , '*' ) .
	
	^DictData select: [ :pairArray | matchStr match: (pairArray at: 2) ]
! !

!IEDict class methodsFor: 'lockup' stamp: 'av 11/29/2022 20:19:57'!
englishStarts: aString
	"Answer all definition pairs which starts with aString looking in the English side"

	| matchStr |
	matchStr :=  aString , '*'  .
	
	^DictData select: [ :pairArray | matchStr match: (pairArray at: 2) ]

! !

!IEDict class methodsFor: 'lockup' stamp: 'av 11/29/2022 20:19:02'!
interlinguaContains: aString
	"Answer all definition pairs which contain aString looking in the Interlingua side"

	| matchStr |
	matchStr :=  ('*' , aString , '*' ) .
	
	^DictData select: [ :pairArray | matchStr match: (pairArray at: 1) ]

! !

!IEDict class methodsFor: 'lockup' stamp: 'av 11/29/2022 20:19:25'!
interlinguaStarts: aString
	"Answer all definition pairs which starts with aString looking in the Interlingua side"

	| matchStr |
	matchStr :=  aString , '*'  .
	
	^DictData select: [ :pairArray | matchStr match: (pairArray at: 1) ]
! !
IEDict initialize!
