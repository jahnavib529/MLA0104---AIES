% Facts
man(marcus).
pompeian(marcus).
ruler(caesar).
tried_to_assassinate(marcus, caesar).

% Rules
roman(X) :-
    pompeian(X).

person(X) :-
    man(X).

not_loyal(X, Y) :-
    tried_to_assassinate(X, Y),
    ruler(Y).

% Keep all hates rules together
hates(X, caesar) :-
    roman(X),
    \+ loyal(X, caesar).

hates(X, caesar) :-
    roman(X),
    not_loyal(X, caesar).
