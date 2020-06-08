progenitor(clara,jose).        %Hecho 1
progenitor(tomas, jose).       %Hecho 2
progenitor(tomas,isabel).      %Hecho 3
progenitor(jose, ana).         %Hecho 4
progenitor(jose, patricia).    %Hecho 5
progenitor(patricia,jaime).    %Hecho 6

padre(jose,jesus).
padre(jesus,sofia).
padre(jesus,alejandro).
padre(jose,juan).
padre(jose,alvaro).
padre(jose,gustavo).
padre(gustavo,william).
padre(gustavo,felipe).
padre(gustavo,oscar).
padre(gustavo,luis).
padre(gustavo,sandra).
padre(juan,manuel).
padre(munuel,estaban).
padre(manuel,antonio).
padre(manuel,martin).
padre(alvaro,tomas).
padre(danilo,anabel).

madre(maria,jesus).
madre(magdalena,sofia).
madre(magdalena,alejandro).
madre(maria,juan).
madre(maria,alvaro).
madre(maria,gustavo).
madre(josefina,anabel).
madre(anabel,manuel).
madre(clementina,esteban).
madre(clementina,antonio).
madre(clementina,martin).

%reglas para poder hallar relacion familiar

%hijo o hija
hijo(x,y):-padre(y,x).
hijo(x,y):-madre(y,x).

%abuelo o abuela
abuelo(x,y):-padre(z,y),padre(x,z).
abuelo(x,y):-madre(z,y),madre(x,z).

%hermano o hermana
hermano(x,y):-padre(z,x),hijo(y,z),z\=y.
hermano(x,y):-madre(z,x),hijo(y,z),z\=y.

%tio o tia
tio(x,y):-padre(z,y),hermano(x,z).
tio(x,y):-madre(z,y),hermano(x,z).

%esposo o esposa
esposos(x,y):-padre(z,y),madre(x,z).
esposos(x,y):-madre(z,y),padre(x,z).

%sobrino o sobrina
sobrino(x,y):-tio(y,x).

%primo o prima
primo(x,y):-padre(z,y),tio(x,z).
primo(x,y):-madre(z,y),tio(x,z).

%cuñado o cuñada
cunado(x,y):-hermano(z,y),esposos(x,z).
cunado(x,y):-hermano(z,y),esposos(x,z).

%nieto o nieta
nieto(x,y):-abuelo(x,y).

%bisabuelo o bisabuela
bisabuelo(x,y):-abuelo(x,z),padre(z,y).
bisabuelo(x,y):-abuelo(x,z),madre(z,y).

%bisabuelo o bisabuela
bisnieto(x,y):-bisabuelo(x,y).

%yerno o nuera
yuerno_nuera(x,y):-hijo(z,y),esposos(x,z).

%suegro o suegra
suegro(x,y):-yerno_nuera(y,x).






