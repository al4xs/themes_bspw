import requests

url = "http://testphp.vulnweb.com"

lista_de_arquivos = open('/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt')
for linha in lista_de_arquivos.readlines():
	url_test = url + "/" + linha.replace("\n","")
#	print(linha.replace("\r","").replace("\n",""))
	requisicao = requests.get(url_test)
	if(requisicao.status_code == 404):
		continue
	if(requisicao.status_code == 200):
		print("[+] Encontrado ", url_test.replace("\n",""), requisicao.status_code)
	else:
		print("[x] Estranho ", url_test.replace("\n",""), requisicao.status_code)
