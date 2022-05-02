# PROLOG

_PROgrammation en LOGique_

## El acertijo de Einstein

El acertijo "de Einstein" 😕 (_Einstein's Riddle or Zebra Puzzle_) me sirve como ejemplo de problema para programación lógica en PROLOG, aunque es más entretenido resolverlo con lápiz y papel.

Enunciado:  
En una calle hay cinco casas, cada una de un color distinto. En cada casa vive una persona de distinta nacionalidad. Cada dueño bebe un único tipo de bebida, fuma una sola marca de cigarrillos y tiene una mascota diferente a sus vecinos. A partir de las 15 pistas presentadas a continuación, la pregunta que hay que responder es: ¿quién es el dueño del pez?

1. El británico vive en la casa roja.
1. El sueco tiene un perro como mascota.
1. El danés toma té.
1. El noruego vive en la primera casa.
1. El alemán fuma Prince.
1. La casa verde está inmediatamente a la izquierda de la blanca.
1. El dueño de la casa verde bebe café.
1. El propietario que fuma Pall Mall cría pájaros.
1. El dueño de la casa amarilla fuma Dunhill.
1. El hombre que vive en la casa del centro bebe leche.
1. El vecino que fuma Blends vive al lado del que tiene un gato.
1. El hombre que tiene un caballo vive al lado del que fuma Dunhill.
1. El propietario que fuma Bluemaster toma cerveza.
1. El vecino que fuma Blends viveal lado del que toma agua.
1. El noruego vive al lado de la casa azul.

Código: [acertijo.pl](./acertijo.pl)

Ejecución:

```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.4.2)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- consult(acertijo).
Solución: El aleman tiene como mascota: pez.

Casas: [amarilla,azul,roja,verde,blanca]
Nacionalidades: [noruego,danes,britanico,aleman,sueco]
Mascotas: [gato,caballo,pajaros,pez,perro]
Toman: [agua,te,leche,cafe,cerveza]
Fuman: [dunhill,blends,pall_mall,prince,bluemaster]

true.

?-
```
