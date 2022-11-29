'From Cuis 6.0 [latest update: #5483] on 29 November 2022 at 6:19:48 pm'!
'Description Enter a word in English or lnterlingua and find the corresponding lnterlingua or English usage.'!
!provides: 'IA-EN-Dictionary' 1 0!
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
