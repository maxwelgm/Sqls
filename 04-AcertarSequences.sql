-- Created on 14/07/2017 by NTUN 
declare
  -- Local variables here
  i integer := 0;
  j integer := 0;
begin
  select max(meme_sq_medicao_mensal) into i from cprod.medicao_mensal mm;
  loop
    select cprod.sq_meme_sq_medicao_mensal.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MEPI_SQ_BOLETIM_MENSAL_MOVI)
  into   i
  from   MEDICAO_PRODUCAO_INSTALACAO;
  loop
    select cprod.SQ_MEPI_SQ_BOLETIM_MENSAL_MOVI.nextval into j from dual;
    exit when j > i;
  end loop;
select max(MINM_SQ_MEDI_INSTALACAO) into i from MEDI_INSTALACAO_DETALHE;
  loop
    select cprod.SQ_MINM_SQ_MEDI_INSTALACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MINM_SQ_MEDI_INSTALACAO) into i from MEDI_INSTALACAO_MNSL;
  loop
    select cprod.SQ_MINM_SQ_MEDI_INSTALACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MPMN_SQ_MEDI_POCO) into i from MEDI_POCO_MNSL;
  loop
    select cprod.SQ_MPMN_SQ_MEDI_POCO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MVIT_SQ_MOVI_INST_TERC)
  into   i
  from   MOVIMENTACAO_INSTALACAO_TERC;
  loop
    select cprod.SQ_MVIT_SQ_MOVI_INST_TERC.nextval into j from dual;
    exit when j > i;
  end loop;

end;
/