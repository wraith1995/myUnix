#!/usr/bin/env python
#used to convert input to boing mode
from sys import argv
CODE = {'A': '.-',     'B': '-...',   'C': '-.-.', 
        'D': '-..',    'E': '.',      'F': '..-.',
        'G': '--.',    'H': '....',   'I': '..',
        'J': '.---',   'K': '-.-',    'L': '.-..',
        'M': '--',     'N': '-.',     'O': '---',
        'P': '.--.',   'Q': '--.-',   'R': '.-.',
     	'S': '...',    'T': '-',      'U': '..-',
        'V': '...-',   'W': '.--',    'X': '-..-',
        'Y': '-.--',   'Z': '--..',
        
        '0': '-----',  '1': '.----',  '2': '..---',
        '3': '...--',  '4': '....-',  '5': '.....',
        '6': '-....',  '7': '--...',  '8': '---..',
        '9': '----.', ',':'--..--', ' ':'-------', '-':'-....-', '/':'-.-.--', '`':'.----.'
        , '(':'-.--.', ')':'-.--.-'
}

def code(letter):
    try:
        return CODE[letter]
    except KeyError:
        return ''

MORSE = {'.':'BOING', '-':'boing'}


def morse_boing(morses):
    return map(lambda x: MORSE[x], morses)

message = " ".join(argv[1:])    

translate_message = " ".join(map(lambda x: '-'.join(morse_boing(code(x.upper()))) , list(message)))


print(translate_message)
