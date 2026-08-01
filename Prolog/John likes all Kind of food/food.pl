% Facts
food(apple).
food(pizza).
food(rice).
food(mango).

% Rule
likes(john, X) :-
    food(X).
