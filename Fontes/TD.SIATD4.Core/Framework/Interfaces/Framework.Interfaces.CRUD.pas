unit Framework.Interfaces.CRUD;

interface

uses Framework.Interfaces.Consultavel;

type
    ICRUD<T: class> = interface(IConsultavel<T>)
        function Inserir: integer;
        function Alterar: boolean;
        function Excluir: boolean;
    end;

implementation

end.
