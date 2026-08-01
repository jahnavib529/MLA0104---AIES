food(X) :-
    eats(Y, X),
    not(killed_by(Y, X)).
