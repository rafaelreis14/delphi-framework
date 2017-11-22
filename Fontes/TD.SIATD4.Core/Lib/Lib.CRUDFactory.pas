unit Lib.CRUDFactory;

interface

uses classes, Lib.Biblioteca;

type
    TCRUDFactory = class
        class function Factory<T: class>:T;
    end;

implementation


{ TCRUDFactory<T> }


class function TCRUDFactory.Factory<T>:T;
begin
    result := Tlib.CriaInstancia<T>;
end;

end.
