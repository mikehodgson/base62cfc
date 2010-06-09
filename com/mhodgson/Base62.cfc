<cfcomponent displayname="Base62" output="no">
  <cffunction access="public" hint="Decode a given Base62 string to the number it represents." name="decode" returntype="numeric" output="no">
    <cfargument type="string" required="yes" name="s">
    <cfscript>
			var PRIMITIVES = createObject("java", "java.util.LinkedHashMap").init();
			var PRIMITIVES_KEYS = listToArray("0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z");
			var i = 0;
			var result = 0;
			var c = "";
			var place = 0;
			var sa = arrayNew(1);
			
			for (i = 1; i lte arrayLen(PRIMITIVES_KEYS); i = i + 1)
			{
				PRIMITIVES[PRIMITIVES_KEYS[i]] = i-1;
			}
		
			sa = stringToArray(reverse(s));

			for (i = 1; i lte arrayLen(sa); i = i + 1)
			{
				c = sa[i];
				place = structCount(PRIMITIVES) ^ (i - 1);
				result = result + (PRIMITIVES[c] * place);
			}
			
			return result;
    </cfscript>
  </cffunction>
  
  <cffunction access="public" hint="Encode a given number to its Base62 equivalent" name="encode" returntype="string" output="no">
    <cfargument type="numeric" required="yes" name="i">
    <cfscript>
			var PRIMITIVES = listToArray("0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z");
			var result = "";
			var num = i;
			
			while (num gt 0)
			{
				result = PRIMITIVES[(num mod arrayLen(PRIMITIVES)) + 1] & result;
				num = int(num / arrayLen(PRIMITIVES));
			}
			
			return result;
    </cfscript>
  </cffunction>
  
  <cffunction access="private" hint="Convert a string into an array of characters" name="stringToArray" returntype="array" output="no">
    <cfargument type="string" required="yes" name="s">
    <cfscript>
			var a = arrayNew(1);
			var i = 1;
			
			for (i = 1; i lte len(s); i = i + 1)
			{
				a[i] = mid(s, i, 1);
			}
			
			return a;
    </cfscript>
  </cffunction>
</cfcomponent>
