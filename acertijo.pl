% El acertijo de Einstein

nacionalidades(N):-
    permutation([britanico, sueco, danes, noruego, aleman], N).
mascotas(M):-
    permutation([perro, pez, gato, pajaros, caballo], M).
toman(T):-
    permutation([te, cafe, leche, agua, cerveza], T).
fuman(F):-
    permutation([prince, dunhill, blends, bluemaster, pall_mall], F).
casas(C):-
    permutation([roja, verde, blanca, amarilla, azul], C).

% 1. El británico vive en la casa roja
regla1(C, N):-
    casas(C),
    nacionalidades(N),
    nth1(X, N, britanico),
    nth1(X, C, roja).

% 2. El sueco tiene un perro como mascota
regla2(M, N):-
    mascotas(M),
    nacionalidades(N),
    nth1(X, N, sueco),
    nth1(X, M, perro).

% 3. El danés toma té
regla3(N, T):-
    nacionalidades(N),
    toman(T),
    nth1(X, N, danes),
    nth1(X, T, te).

	% 4. El noruego vive en la primera casa
regla4(N):-
    nacionalidades(N),
    nth1(1, N, noruego).

	% 5. El alemán fuma Prince
regla5(N, F):-
    nacionalidades(N),
    fuman(F),
    nth1(X, N, aleman),
    nth1(X, F, prince).

% 6. La casa verde está inmediatamente a la izquierda de la blanca
regla6(C):-
    casas(C),
    nth1(X, C, verde),
    Y is X + 1,
    nth1(Y, C, blanca).

% 7. El dueño de la casa verde bebe café
regla7(C, T):-
    casas(C),
    toman(T),
    nth1(X, C, verde),
    nth1(X, T, cafe).

% 8. El propietario que fuma Pall Mall cría pájaros
regla8(M, F):-
    mascotas(M),
    fuman(F),
    nth1(X, F, pall_mall),
    nth1(X, M, pajaros).

% 9. El dueño de la casa amarilla fuma Dunhill
regla9(C, F):-
    casas(C),
    fuman(F),
    nth1(X, C, amarilla),
    nth1(X, F, dunhill).

% 10. El hombre que vive en la casa del centro bebe leche
regla10(T):-
    toman(T),
    nth1(3, T, leche).

% 11. El vecino que fuma Blends vive al lado del que tiene un gato
regla11(F, M):-
    mascotas(M),
    fuman(F),
    nth1(X, F, blends),
    (   Y is X + 1
    ;   Y is X - 1
    ),
    nth1(Y, M, gato).

% 12. El hombre que tiene un caballo vive al lado del que fuma Dunhill
regla12(M, F):-
    mascotas(M),
    fuman(F),
    nth1(X, M, caballo),
    (   Y is X + 1
    ;   Y is X - 1
    ),
    nth1(Y, F, dunhill).

% 13. El propietario que fuma Bluemaster toma cerveza
regla13(F, T):-
    toman(T),
    fuman(F),
    nth1(X, F, bluemaster),
    nth1(X, T, cerveza).

% 14. El vecino que fuma Blends vive al lado del que toma agua
regla14(F, T):-
    fuman(F),
    toman(T),
    nth1(X, F, blends),
    (   Y is X + 1
    ;   Y is X - 1
    ),
    nth1(Y, T, agua).

% 15. El noruego vive al lado de la casa azul
regla15(N, C):-
    casas(C),
    nacionalidades(N),
    nth1(X, N, noruego),
    (   Y is X + 1
    ;   Y is X - 1
    ),
    nth1(Y, C, azul).

pregunta(Nacionalidad, Mascota):-
    nacionalidades(N),
    regla4(N),
    mascotas(M),
    regla2(M, N),
    nth1(X, M, Mascota),
    nth1(X, N, Nacionalidad),
    fuman(F),
    regla8(M, F),
    regla11(F, M),
    regla12(M, F),
    regla5(N, F),
    casas(C),
    regla6(C),
    regla1(C, N),
    regla9(C, F),
    regla15(N, C),
    toman(T),
    regla10(T),
    regla3(N, T),
    regla7(C, T),
    regla13(F, T),
    regla14(F, T),
    writef('Solución: El %w tiene como mascota %w.\n', [Nacionalidad, Mascota]),
    writef('Casas: %q\nNacionalidades: %q\nMascotas: %q\nToman: %q\nFuman: %q\n\n', [C, N, M, T, F]).

% ¿Qué vecino vive con un pez?
:- pregunta(_, pez).
