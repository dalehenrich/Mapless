actions
setSubModelReferences
	"Creates proxies to sub models regarding 
	to the JSON data this instance."

	data keysAndValuesDo: [ :k :v |
		self setSubModelReferencesAt: k with: v]