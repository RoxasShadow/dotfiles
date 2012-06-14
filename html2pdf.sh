curl http://producingoss.com/it/ 2>&1 | grep -o -E 'href="([^"#]+)"' | cut -d'"' -f2 >> links

# Remove duplicate and useless URLs by links

i=0
while read line        
do
   i=$((i+1))
   wkhtmltopdf -g $line $i.pdf
done < links
