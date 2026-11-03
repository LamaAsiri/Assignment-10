user(lama, 1234).
user(sara, 5678).
user(nora, 1111).

login :-
    attempt(3).

attempt(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.
attempt(N) :-
    N > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check(Username, Password, N).

check(Username, Password, _) :-
    user(Username, Password),
    !,
    write('Login Successful'), nl.
check(_, _, N) :-
    write('Login Unsuccessful'), nl,
    N1 is N - 1,
    attempt(N1).
