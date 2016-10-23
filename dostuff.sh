#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<title>Environment Variables</title>'
echo '</head>'
echo '<STYLE type="text/css">BODY {text-align: center}</STYLE>'
echo '<br>'
echo '<br>'
echo '<p><strong>Anagrams Finder</strong></p>'

echo '<pre>'

#echo $QUERY_STRING

#Cut evrything upto first delimiter which is = sign
b=$(echo $QUERY_STRING | cut -d'=' -f2 )
echo "<p><b>You typed $b</b></p>"
echo ""

#Convert to lowercase
c=$(echo "$b" | tr '[:upper:]' '[:lower:]')
#echo In lower case $c
echo ""

#Search the file words for all match and remove replicated character
#/bin/egrep "^[$c]{${#c}}$" /usr/share/dict/words | /bin/egrep -v "(.).*\1"
/bin/egrep "^[$c]{${#c}}$" /usr/share/dict/words | /bin/egrep -v "(.).*\1" || echo "No Match. Try a different word"

echo '</pre>'

echo '<a href="http://www.wiivil.com/form.html">Go back and try again</a>'

echo '</body>'
echo '</html>'
