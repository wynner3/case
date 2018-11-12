book(illiad, homer, study, 500).
book(c, richie, study, 150).
book(nt_bible, sams, reference, 480).
book(monty_python, cleese, comedy, 300).

%Holidays (book should be less than 400 pages and not be a study or reference book).
%Revision (book that is either for study or a reference book with more than 300 pages).
%Literary reading (drama books).
%Leisure (books that either comedy or fiction).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).

is_literary(book(,,Genre,)) :- Genre == 'drama'.
literary(B, [B|]) :- is_literary(B).
literary(B, [_|L]) :- literary(B, L).

is_leisure(book(,,Genre,)) :- Genre == 'comedy' ; Genre == 'fiction'.
leisure(B, [B|]) :- is_leisure(B).
leisure(B, [_|L]) :- leisure(B, L).

is_holidays(book(,,Genre,Size)) :- Genre == 'study', Genre == 'reference', Size < 400.
holidays(B, [B|]) :- is_holidays(B).
holidays(B, [|L]) :- holidays(B, L).

is_revision(book(,,Genre,Size)) :- Genre == 'study' ; (Genre == 'reference', Size > 300).
revision(B, [B|]) :- is_revision(B).
revision(B, [|L]) :- revision(B, L).
