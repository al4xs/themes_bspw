import argparse
import click
import requests
import webbrowser
import os
import shlex
import eng_to_ipa as ipa
from termcolor import colored

options = {
    1: 'Mineração de palavras',
    2: 'Transcrição IPA',
    3: 'Sair'
}

# Função para buscar e imprimir traduções no Tatoeba
def buscar_traducoes_tatoeba(frase):
    url = 'https://tatoeba.org/pt-br/api_v0/search'
    params = {
        'from': 'eng',
        'query': frase,
        'to': 'por'
    }

    response = requests.get(url, params=params)

    if response.status_code == 200:
        data = response.json()
        for result in data['results']:
            english_sentence = result['text']
            translations = [t['text'] for sublist in result['translations'] for t in sublist]
            translations_str = ', '.join(translations).replace(',', '')  # Remove vírgulas
            print(f"{english_sentence}\n  - {translations_str}")
    else:
        print(colored(f"Erro ao buscar traduções para '{frase}': {response.status_code}", 'white'))


# Função que executa a opção 1
def minerar_palavras():
    while True:
        print(colored("Qual a palavra em inglês que você deseja buscar?", 'red'))
        f = input(colored('$ ', 'red'))  # Pergunta em vermelho
        resp = ipa.convert(f)
        print(colored("Você buscou pela palavra: {} ".format(f), 'red'))
        print(colored("Em IPA a pronuncia correta seria: ", 'red'), resp)
        
        buscar_traducoes_tatoeba(f)

        # Definir URLs dos sites de referência
        taoeba = "https://tatoeba.org/pt-br/sentences/search?from=eng&query={}&to=por".format(f)
        cambridge = "https://dictionary.cambridge.org/dictionary/english-portuguese/{}".format(f)
        bab = "https://en.bab.la/dictionary/english-portuguese/{}".format(f)
        glosb = "https://glosbe.com/en/pt/{}".format(f)
        rev = "https://conjugator.reverso.net/conjugation-english-verb-{}.html".format(f)

        # Abrir páginas no navegador
        webbrowser.open(taoeba, new=2)
        webbrowser.open(cambridge, new=2)
        webbrowser.open(bab, new=2)
        webbrowser.open(glosb, new=2)
        webbrowser.open(rev, new=2)

        # Perguntar se deseja continuar
        resposta = input(colored("Deseja continuar minerando? (y/n): ", 'red'))
        if resposta.lower() != "y":
            break


# Função que executa a opção 2
def ver_ipa():
    while True:
        f = shlex.quote(input(colored('$ ', 'red')))  # Pergunta em vermelho
        f = f.strip("'")  # Remove aspas da entrada do usuário
        output = os.popen("curl -X POST 'https://www.phonetizer.com/phonetizer/default/call/jsonrpc?nocache=1681283729374' -H 'Content-Type: application/json' --data-raw '{\"service\":\"\",\"method\":\"transcribe\",\"id\":3,\"params\":[\"" + f + "\",\"British\"]}' --silent | json_pp | cut -d \"/\" -f 7 | cut -d \",\" -f 2 | cut -d '\"' -f 1 ").read()
        print(colored("A transcrição fonética é:", 'blue'), output.strip().replace('\n', ' ').replace('{','').replace('}',''))

#        # Perguntar se deseja continuar
#        resposta = input(colored("Deseja continuar visualizando o IPA? (y/n): ", 'red'))
#        if resposta.lower() != "y":
#            break


@click.command()
@click.option('--opcao', type=int, help='Digite o número da opção que deseja')
def menu(opcao):
    while opcao != 3:
        try:
            if opcao == 1:
                minerar_palavras()
            elif opcao == 2:
                ver_ipa()
            else:
                print(colored("Entrada inválida. Digite um número de 1 a 3.", 'red'))
        except ValueError:
            print(colored(" ", 'red'))

        # Mostra as opções novamente
        print(" ")
        print("O que você deseja?")
        print("1) Mineração de palavras")
        print("2) Transcrição IPA")
        print("3) Sair")
        print(" ")

        # Pede a opção ao usuário
        try:
            opcao = int(input(colored("Digite o número da opção: ", 'red')))
        except ValueError:
            print(colored(" ", 'red'))


if __name__ == "__main__":
    menu()

