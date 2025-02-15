UserAgent="User-Agent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/W.X.Y.Z Safari/537.36"

###############  Exemplos para criar suas functions

shodanquery () {
	echo "shodan scan submit --force <IP>"
	echo "shodan search ssl:domain.com --fields ip_str,port,hostnames,org --separator " " | awk '{print $1":"$2" "$3" "$4}' | anew"
	echo "shodan host 192.168.1.1"
	echo "shodan domain hackerone.com"
	echo "shodan alert create 'HackerOne' 104.16.100.52"
	echo "shodan alert triggers"
	echo "shodan alert list"
	echo "shodan alert create 'Hyatt Hotels' 140.95.0.0/16"
	echo "shodan alert domain hackerone.com"
	echo "shodan alert enable <alert ID> new_service,open_database,vulnerable,ssl_expired,internet_scanner,uncommon"
	echo "shodan search access-control-allow-origin"
	echo "shodan search city:Carapicuíba windows 7"
	echo "shodan search org:tesla"
	echo "shodan search ip:192.68.1.1"
	echo "shodan search http.title index of"
	echo "shodan search http.favicon.hash:1198047028"
	echo "shodan search country:BR camera"
	echo "shodan search country:BR webcam"
	echo "shodan search product:Samsung version:2.0"
	echo "shodan search vuln:CVE-2024-"
	echo "shodan search server:nginx"
	echo "shodan search asn:AS1230"
	echo "shodan search os:windows 7"
	echo "shodan search hostname:tesla.com port:8080"
	echo "geo:'-23.545006, -46.830707' 'camera'"
	echo "shodan search org:\'name organization\' \!port:80,443 --fields ip_str,port,http.title | awk '{print $1,$2}' | tr ' ' ':' | anew ips-ports"
	echo "shodan search asn:AS3389 --fields hostnames | tr ';' '\n' | sort -u | anew asn-resolved"

}


getip () {
	#getip site.com
	domain=$(echo $1 | sed -e 's/^http:\/\///' -e 's/^https:\/\///')
	ip=$(ping -c 1 $domain | grep "PING" | cut -d "(" -f 2 | cut -d ")" -f 1)
	echo $ip
}


ipinfo () {
	#ipinfo site.com
	ipresolved=$(ping -c 1 $1 | grep "PING" | cut -d "(" -f 2 | cut -d ")" -f 1)
	curl "http://ipinfo.io/$ipresolved" -H "$UserAgent"
}


minera () {
	#minerar frases em ingles britanico para anki
	python3 ~/hacktools/minera/minera-stable.py

}


getHTTP () {
	#getHTTP site.com
	python3 ~/hacktools/HExHTTP/hexhttp.py -u https://$1 -b
}


updatetools () {
	#fazer update de tools
	nuclei -up -ut -ud ~/nuclei-templates/
	httpx -update
	searchsploit -u
	sudo naabu -up

}

############################### Abaixo Scan vulnerabilidade ###############################

# recon automatico de XSS
scanxss () {
	# scanxss site.com
	echo '$1' | waybackurls | gf xss | uro | qsreplace '"><img src=x onerror=alert(1);>'

}
