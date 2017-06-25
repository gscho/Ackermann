package stack is
    procedure push(x : in integer);
    procedure pop(x : out integer);
    function stackEmpty return Boolean;
    function stackTop return integer;
end stack;
