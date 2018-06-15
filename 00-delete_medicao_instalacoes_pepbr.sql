prompt Carga Feita por NTUN 04/01/2018
set feedback off
set define off

prompt Deletando CPROD.MEDI_INSTALACAO_DETALHE...
DELETE CPROD.MEDI_INSTALACAO_DETALHE mid where mid.minm_sq_medi_instalacao in (select mim.minm_sq_medi_instalacao from cprod.medi_instalacao_mnsl mim where mim.minm_nr_ano_mes  = 201710 );
commit;

prompt Deletando CPROD.MEDI_INSTALACAO_MNSL...
DELETE CPROD.MEDI_INSTALACAO_MNSL mim where mim.minm_nr_ano_mes = 201710;
commit;

prompt Deletando CPROD.MEDICAO_PRODUCAO_INSTALACAO...
DELETE CPROD.MEDICAO_PRODUCAO_INSTALACAO mpi where mpi.mepi_nr_ano_mes_movi = 201710;
commit;

prompt Registros Apagados
set feedback on
set define on
prompt Fim.



