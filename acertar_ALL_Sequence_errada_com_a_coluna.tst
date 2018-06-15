declare 
  -- Local variables here
  i number :=0;
  j number :=0;
  tabela varchar2(2000);
  coluna varchar2(2000);
  qtde number;
  sqlexec varchar2(2000);
begin
  -- Test statements here
  
  for reg in (
  select sq.SEQUENCE_NAME from all_sequences sq
where sq.SEQUENCE_OWNER = 'CPROD'
  ) loop
  
   coluna := substr(reg.SEQUENCE_NAME,4);
  
   select count(1) into qtde
   from all_tab_columns tc
   where tc.COLUMN_NAME = coluna
   and tc.OWNER = 'CPROD';
   
   if qtde>0 then
      
      for regTbl in (
         select distinct tc.TABLE_NAME 
         from all_tab_columns tc
         where tc.COLUMN_NAME = coluna
         and tc.OWNER = 'CPROD'
      ) loop      
      
         tabela := regTbl.Table_Name;
         sqlexec := 'begin select max('|| coluna ||') into :i from '|| tabela || '; end;';
          execute immediate sqlexec using out i;
          loop  
            execute immediate 'begin select ' || reg.sequence_name ||'.nextval into :j from dual; end;' using out j;
            exit when j>i;
          end loop;      
      
      end loop;      
      
   end if;
  
  end loop;   
  
  --Adicionar aqui as sequences que não possuem o mesmo nome da coluna e não conseguem ser automatizadas
  
end;
/