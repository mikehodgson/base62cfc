<cfscript>
  // Convert number 123456 to Base62 representation "W7E" 
  myBase62 = CreateObject("component", "com.mhodgson.base62").Encode(123456);
</cfscript>

<cfoutput>
  #myBase62#
</cfoutput>

<cfscript>
  // Now reverse it
  myNum = CreateObject("component", "com.mhodgson.base62").Decode(myBase62);
</cfscript>

<cfoutput>
  #myNum#
</cfoutput>