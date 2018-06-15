PL/SQL Developer Test script 3.0
975
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

  select max(t.repc_sq_referencia_previsao)
  into   i
  from   CPROD.REFERENCIA_PREVISAO_CORRENTE t;
  loop
    select cprod.sq_repc_sq_referencia_previsao.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.prvc_sq_prev_vol_corrente)
  into   i
  from   CPROD.PREVISAO_VOLUME_CORRENTE t;
  loop
    select cprod.sq_prvc_sq_prev_vol_corrente.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.larp_sq_log_acao_ref_prev)
  into   i
  from   CPROD.LOG_ACAO_REF_PREV_CORRENTE t;
  loop
    select cprod.sq_larp_sq_log_acao_ref_prev.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.hjpc_sq_hist_justif_prev_corr)
  into   i
  from   CPROD.HIST_JUSTIF_PREV_CORRENTE t;
  loop
    select cprod.sq_hjpc_sq_hist_justif_prev.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.hspo_sq_hist_prev_operacao)
  into   i
  from   CPROD.HIST_PREVISAO_OPERACAO t;
  loop
    select cprod.sq_hspo_sq_hist_prev_operacao.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.hppp_sq_hist_prev_parada_prod)
  into   i
  from   CPROD.HIST_PREVISAO_PARADA_PRODUCAO t;
  loop
    select cprod.sq_hppp_sq_hist_prev_parada.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.hpvc_sq_hist_prev_vol_corrente)
  into   i
  from   CPROD.HIST_PREVISAO_VOLUME_CORRENTE t;
  loop
    select cprod.sq_hpvc_sq_hist_prev_vol_corr.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.repc_sq_referencia_previsao)
  into   i
  from   CPROD.JUSTIFICATIVA_PREV_CORRENTE t;
  loop
    select cprod.sq_repc_sq_referencia_previsao.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.preo_sq_previsao_operacao)
  into   i
  from   CPROD.PREVISAO_OPERACAO t;
  loop
    select cprod.sq_preo_sq_previsao_operacao.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.pprp_sq_previsao_parada)
  into   i
  from   CPROD.PREVISAO_PARADA_PRODUCAO t;
  loop
    select cprod.sq_pprp_sq_previsao_parada.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.lpap_sq_localidade_parada)
  into   i
  from   CPROD.LOCALIDADE_PARADA_PRODUCAO t;
  loop
    select cprod.sq_lpap_sq_localidade_parada.nextval into j from dual;
    exit when j > i;
  end loop;

  select max(t.jupc_sq_justificativa_prev)
  into   i
  from   cprod.justificativa_prev_corrente t;
  loop
    select cprod.sq_jupc_sq_justificativa_prev.nextval into j from dual;
    exit when j > i;
  end loop;
/*
-- Apartir daqui usar a query abaixo
select 'select max(' || coluna || ') into i from ' || tabela || ';' ||
       chr(13) || 'loop ' || chr(13) || 'select cprod.' || SEQUENCE_NAME ||
       '.nextval into j from dual; ' || chr(13) || 'exit when j>i;' ||
       chr(13) || 'end loop;'
from   (select sq.SEQUENCE_NAME,
               substr(sq.SEQUENCE_NAME, 4) coluna,
               tc.TABLE_NAME tabela
        from   all_sequences   sq,
               all_tab_columns tc
        where  sq.SEQUENCE_OWNER = 'CPROD'
               and tc.OWNER = 'CPROD'
               and substr(tc.TABLE_NAME, 1, 3) <> 'VM_' and substr(tc.TABLE_NAME, 1, 3) <> 'VW_'
               and tc.COLUMN_NAME = substr(sq.SEQUENCE_NAME, 4))

*/
  select max(ACGE_SQ_ACOMPANHAMENTO) into i from ACOMPANHAMENTO_GERENCIAL;
  loop
    select cprod.SQ_ACGE_SQ_ACOMPANHAMENTO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(ANAP_SQ_ANALISE) into i from ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_ANAP_SQ_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CEAP_SQ_CENARIO_ANALISE) into i from ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_CEAP_SQ_CENARIO_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(GRPL_SQ_GRUPO_PLAT_ANALISE)
  into   i
  from   ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_GRPL_SQ_GRUPO_PLAT_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(ATCT_SQ_CBI) into i from ATIVO_CBI_TRIBUTARIO;
  loop
    select cprod.SQ_ATCT_SQ_CBI.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CEAP_SQ_CENARIO_ANALISE)
  into   i
  from   CENARIO_ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_CEAP_SQ_CENARIO_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(SCEA_SQ_STATUS_CENARIO)
  into   i
  from   CENARIO_ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_SCEA_SQ_STATUS_CENARIO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CPCN_SQ_CMPS_CRNT) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_CPCN_SQ_CMPS_CRNT.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LCPE_SQ_LOCACAO_OPERACIONAL) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_LCPE_SQ_LOCACAO_OPERACIONAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from COMPOSICAO_CORRENTE;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(COCR_SQ_CONEXAO_COORDENADA) into i from CONEXAO_COORDENADA;
  loop
    select cprod.SQ_COCR_SQ_CONEXAO_COORDENADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(COCR_SQ_CONEXAO_COORDENADA) into i from CONEXAO_MALHA;
  loop
    select cprod.SQ_COCR_SQ_CONEXAO_COORDENADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MALG_SQ_MALHA_GEOGRAFICA) into i from CONEXAO_MALHA;
  loop
    select cprod.SQ_MALG_SQ_MALHA_GEOGRAFICA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CPEA_SQ_CONTROLE_PERFIL) into i from CONTROLE_PERFIL_ACESSO;
  loop
    select cprod.SQ_CPEA_SQ_CONTROLE_PERFIL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(COGE_SQ_ELEMENTO_COORDENADA)
  into   i
  from   COORDENADA_GEOGRAFICA;
  loop
    select cprod.SQ_COGE_SQ_ELEMENTO_COORDENADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from CORRENTE_FISICA_ESCOAMENTO;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CRVO_CD_SEQUENCIAL) into i from CREDITO_VOLUME;
  loop
    select cprod.SQ_CRVO_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from CURVA_CORRENTE;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CUCO_SQ_CURVA_CORRENTE) into i from CURVA_CORRENTE;
  loop
    select cprod.SQ_CUCO_SQ_CURVA_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CUCO_SQ_CURVA_CORRENTE) into i from CURVA_CORRENTE_TIPO_MOV;
  loop
    select cprod.SQ_CUCO_SQ_CURVA_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   CURVA_CORRENTE_UNID_OPERATIVA;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CUCO_SQ_CURVA_CORRENTE)
  into   i
  from   CURVA_CORRENTE_UNID_OPERATIVA;
  loop
    select cprod.SQ_CUCO_SQ_CURVA_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUM_SQ_CURV_CRNT_UO_TIPO)
  into   i
  from   CURVA_CORRENTE_UO_TIPO_MOVI;
  loop
    select cprod.SQ_CCUM_SQ_CURV_CRNT_UO_TIPO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   CURVA_CORRENTE_UO_TIPO_MOVI;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(ESCC_SQ_CORRENTE_ESTOQUE) into i from ESTOQUE_CURVA_CORRENTE;
  loop
    select cprod.SQ_ESCC_SQ_CORRENTE_ESTOQUE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE) into i from ESTOQUE_CURVA_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(GRPL_SQ_GRUPO_PLAT_ANALISE)
  into   i
  from   GRUPO_PLATAFORMA_ANALISE;
  loop
    select cprod.SQ_GRPL_SQ_GRUPO_PLAT_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIAU_SQ_AMBIENTE_UF) into i from HIST_AMBIENTE_UF;
  loop
    select cprod.SQ_HIAU_SQ_AMBIENTE_UF.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIAA_SQ_HIST_ANALISE_ANP) into i from HIST_ANALISE_ANP;
  loop
    select cprod.SQ_HIAA_SQ_HIST_ANALISE_ANP.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBA_SQ_ANEXO1) into i from HIST_BMP_ANEXO1;
  loop
    select cprod.SQ_HIBA_SQ_ANEXO1.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBG_SQ_GAGNA) into i from HIST_BMP_GAGNA;
  loop
    select cprod.SQ_HIBG_SQ_GAGNA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBMT_SQ_MEDI_TOT) into i from HIST_BMP_MEDI_TOT;
  loop
    select cprod.SQ_HBMT_SQ_MEDI_TOT.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBMU_SQ_MEDI_UF) into i from HIST_BMP_MEDI_UF;
  loop
    select cprod.SQ_HBMU_SQ_MEDI_UF.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBP_SQ_PARTGOV) into i from HIST_BMP_PARTGOV;
  loop
    select cprod.SQ_HIBP_SQ_PARTGOV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBPN_SQ_POCO_NOVO) into i from HIST_BMP_POCO_NOVO;
  loop
    select cprod.SQ_HBPN_SQ_POCO_NOVO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBR_SQ_RESUMO) into i from HIST_BMP_RESUMO;
  loop
    select cprod.SQ_HIBR_SQ_RESUMO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBS_SQ_SUPERFICIARIO) into i from HIST_BMP_SUPERFICIARIOS;
  loop
    select cprod.SQ_HIBS_SQ_SUPERFICIARIO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBTC_SQ_TRANSF_CAMPO) into i from HIST_BMP_TRANSF_CAMPO;
  loop
    select cprod.SQ_HBTC_SQ_TRANSF_CAMPO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIBU_SQ_UNITIZACAO) into i from HIST_BMP_UNITIZACAO;
  loop
    select cprod.SQ_HIBU_SQ_UNITIZACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBUT_SQ_HIST_UNIT_TRANSF)
  into   i
  from   HIST_BMP_UNITIZACAO_TRANSF;
  loop
    select cprod.SQ_HBUT_SQ_HIST_UNIT_TRANSF.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBVM_CD_VOLUME_MOVIMENTADO)
  into   i
  from   HIST_BMP_VOLUME_MOVIMENTADO;
  loop
    select cprod.SQ_HBVM_CD_VOLUME_MOVIMENTADO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HBMM_SQ_BOLETIM_MENSAL_MOVI)
  into   i
  from   HIST_BOLETIM_MENSAL_MOVI;
  loop
    select cprod.SQ_HBMM_SQ_BOLETIM_MENSAL_MOVI.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HICC_CD_SEQUENCIAL) into i from HIST_CAD_CAMPO;
  loop
    select cprod.SQ_HICC_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from HIST_CAD_CAMPO;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HCCT_SQ_HIST_CAD_CAMPO_TRIB)
  into   i
  from   HIST_CAD_CAMPO_TRIBUTARIO;
  loop
    select cprod.SQ_HCCT_SQ_HIST_CAD_CAMPO_TRIB.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from HIST_CAD_CAMPO_TRIBUTARIO;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HCAN_SQ_HIST_CAMPO_ANEXADO) into i from HIST_CAMPO_ANEXADO;
  loop
    select cprod.SQ_HCAN_SQ_HIST_CAMPO_ANEXADO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HCCA_SQ_CAMPO_CORRENTE) into i from HIST_CAMPO_CORRENTE_ANP;
  loop
    select cprod.SQ_HCCA_SQ_CAMPO_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HCOA_SQ_CORRENTE) into i from HIST_CORRENTE_ANP;
  loop
    select cprod.SQ_HCOA_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HICE_SQ_HIST_CUSTO_EXTRACAO) into i from HIST_CUSTO_EXTRACAO;
  loop
    select cprod.SQ_HICE_SQ_HIST_CUSTO_EXTRACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HGCC_SQ_HISTORICO_GAS) into i from HIST_GAS_CE_CAMPO;
  loop
    select cprod.SQ_HGCC_SQ_HISTORICO_GAS.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HGAC_SQ_GRAU_API_CAMPO) into i from HIST_GRAU_API_CAMPO;
  loop
    select cprod.SQ_HGAC_SQ_GRAU_API_CAMPO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPCD_SQ_HIST_CAMPO_DETALHE)
  into   i
  from   HIST_INFO_PART_CAMPO_DETALHE;
  loop
    select cprod.SQ_HPCD_SQ_HIST_CAMPO_DETALHE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPCC_SQ_INFO_PCS_CAMPO) into i from HIST_INFO_PCS_CAMPO;
  loop
    select cprod.SQ_HPCC_SQ_INFO_PCS_CAMPO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIIN_SQ_INSTALACAO) into i from HIST_INSTALACAO;
  loop
    select cprod.SQ_HIIN_SQ_INSTALACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LARP_SQ_LOG_ACAO_REF_PREV)
  into   i
  from   HIST_JUSTIF_PREV_CORRENTE;
  loop
    select cprod.SQ_LARP_SQ_LOG_ACAO_REF_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from HIST_JUSTIF_PREV_CORRENTE;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(JUPC_SQ_JUSTIFICATIVA_PREV)
  into   i
  from   HIST_JUSTIF_PREV_CORRENTE;
  loop
    select cprod.SQ_JUPC_SQ_JUSTIFICATIVA_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(REPC_SQ_REFERENCIA_PREVISAO)
  into   i
  from   HIST_JUSTIF_PREV_CORRENTE;
  loop
    select cprod.SQ_REPC_SQ_REFERENCIA_PREVISAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HSPO_SQ_HIST_PREV_OPERACAO)
  into   i
  from   HIST_PREVISAO_OPERACAO;
  loop
    select cprod.SQ_HSPO_SQ_HIST_PREV_OPERACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LARP_SQ_LOG_ACAO_REF_PREV) into i from HIST_PREVISAO_OPERACAO;
  loop
    select cprod.SQ_LARP_SQ_LOG_ACAO_REF_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA) into i from HIST_PREVISAO_OPERACAO;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LCPE_SQ_LOCACAO_OPERACIONAL)
  into   i
  from   HIST_PREVISAO_OPERACAO;
  loop
    select cprod.SQ_LCPE_SQ_LOCACAO_OPERACIONAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PREO_SQ_PREVISAO_OPERACAO) into i from HIST_PREVISAO_OPERACAO;
  loop
    select cprod.SQ_PREO_SQ_PREVISAO_OPERACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LARP_SQ_LOG_ACAO_REF_PREV)
  into   i
  from   HIST_PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_LARP_SQ_LOG_ACAO_REF_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA)
  into   i
  from   HIST_PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TPDD_SQ_TIPO_PARADA)
  into   i
  from   HIST_PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_TPDD_SQ_TIPO_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PPRP_SQ_PREVISAO_PARADA)
  into   i
  from   HIST_PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_PPRP_SQ_PREVISAO_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LARP_SQ_LOG_ACAO_REF_PREV)
  into   i
  from   HIST_PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_LARP_SQ_LOG_ACAO_REF_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CUCO_SQ_CURVA_CORRENTE)
  into   i
  from   HIST_PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CUCO_SQ_CURVA_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from HIST_PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PRVC_SQ_PREV_VOL_CORRENTE)
  into   i
  from   HIST_PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_PRVC_SQ_PREV_VOL_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   HIST_PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIPO_CD_SEQUENCIAL) into i from HIST_PROD_CAMPO;
  loop
    select cprod.SQ_HIPO_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPCT_SQ_HIST_PROD_CAMPO)
  into   i
  from   HIST_PROD_CAMPO_TRIBUTARIO;
  loop
    select cprod.SQ_HPCT_SQ_HIST_PROD_CAMPO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from HIST_PROD_CAMPO_TRIBUTARIO;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPMS_SQ_HIST_PROD) into i from HIST_PROD_MENSAL;
  loop
    select cprod.SQ_HPMS_SQ_HIST_PROD.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPRP_SQ_HIST_PROD_PDE) into i from HIST_PROD_PDE;
  loop
    select cprod.SQ_HPRP_SQ_HIST_PROD_PDE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIPP_CD_SEQUENCIAL) into i from HIST_PROD_POCO;
  loop
    select cprod.SQ_HIPP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPPA_SQ_HIST_PROD_POCO) into i from HIST_PROD_POCO_ANP;
  loop
    select cprod.SQ_HPPA_SQ_HIST_PROD_POCO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HPSI_SQ_PROD_SEM_INJECAO) into i from HIST_PROD_SEM_INJECAO;
  loop
    select cprod.SQ_HPSI_SQ_PROD_SEM_INJECAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HSIN_SQ_HIST_INFO_POCO) into i from HIST_SIGEP_INFO_POCO;
  loop
    select cprod.SQ_HSIN_SQ_HIST_INFO_POCO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HSPS_SQ_POCO_STATUS) into i from HIST_SIGEP_POCO_STATUS;
  loop
    select cprod.SQ_HSPS_SQ_POCO_STATUS.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HSIU_SQ_SIGEP_UEP) into i from HIST_SIGEP_UEP;
  loop
    select cprod.SQ_HSIU_SQ_SIGEP_UEP.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HSVP_SQ_VOLMOV_PLATAF) into i from HIST_SIGEP_VOL_MOV_PLATAF;
  loop
    select cprod.SQ_HSVP_SQ_VOLMOV_PLATAF.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HVRC_SQ_HIST_VOLU_RLZD_CRNT)
  into   i
  from   HIST_VOLUME_REALIZADO_CORRENTE;
  loop
    select cprod.SQ_HVRC_SQ_HIST_VOLU_RLZD_CRNT.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   HIST_VOLUME_REALIZADO_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CUCO_SQ_CURVA_CORRENTE)
  into   i
  from   HIST_VOLUME_REALIZADO_CORRENTE;
  loop
    select cprod.SQ_CUCO_SQ_CURVA_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CFIE_SQ_CORRENTE) into i from HIST_VOLUME_REALIZADO_CORRENTE;
  loop
    select cprod.SQ_CFIE_SQ_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(HIZP_SQ_ZONA_PRODUCAO) into i from HIST_ZONA_PRODUCAO;
  loop
    select cprod.SQ_HIZP_SQ_ZONA_PRODUCAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(ATCT_SQ_CBI) into i from INFO_PART_CAMPO;
  loop
    select cprod.SQ_ATCT_SQ_CBI.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPIN_SQ_INSTALACAO) into i from INFO_PART_INSTALACAO;
  loop
    select cprod.SQ_IPIN_SQ_INSTALACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from INFO_PART_UNID_PROD;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(STUP_SQ_STATUS_UNID_PROD) into i from INFO_PART_UNID_PROD;
  loop
    select cprod.SQ_STUP_SQ_STATUS_UNID_PROD.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from IPUP_CURVA;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IAPR_SQ_ITEM_ANALISE) into i from ITEM_ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_IAPR_SQ_ITEM_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TEAN_SQ_TENDENCIA_ANALISE)
  into   i
  from   ITEM_ANALISE_PROBABILISTICA;
  loop
    select cprod.SQ_TEAN_SQ_TENDENCIA_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(GRPL_SQ_GRUPO_PLAT_ANALISE)
  into   i
  from   ITEM_GRUPO_PLATAFORMA_ANALISE;
  loop
    select cprod.SQ_GRPL_SQ_GRUPO_PLAT_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(REPC_SQ_REFERENCIA_PREVISAO)
  into   i
  from   JUSTIFICATIVA_PREV_CORRENTE;
  loop
    select cprod.SQ_REPC_SQ_REFERENCIA_PREVISAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   JUSTIFICATIVA_PREV_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(JUPC_SQ_JUSTIFICATIVA_PREV)
  into   i
  from   JUSTIFICATIVA_PREV_CORRENTE;
  loop
    select cprod.SQ_JUPC_SQ_JUSTIFICATIVA_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LCPE_SQ_LOCACAO_OPERACIONAL) into i from LOCACAO_OPERACIONAL;
  loop
    select cprod.SQ_LCPE_SQ_LOCACAO_OPERACIONAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA)
  into   i
  from   LOCALIDADE_PARADA_PRODUCAO;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LARP_SQ_LOG_ACAO_REF_PREV)
  into   i
  from   LOG_ACAO_REF_PREV_CORRENTE;
  loop
    select cprod.SQ_LARP_SQ_LOG_ACAO_REF_PREV.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(REPC_SQ_REFERENCIA_PREVISAO)
  into   i
  from   LOG_ACAO_REF_PREV_CORRENTE;
  loop
    select cprod.SQ_REPC_SQ_REFERENCIA_PREVISAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LOEA_SQ_LOG_ENVIO) into i from LOG_ENVIO_ABAST;
  loop
    select cprod.SQ_LOEA_SQ_LOG_ENVIO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(USSC_CD_SEQUENCIAL) into i from LOG_OPERACAO_SCPROD;
  loop
    select cprod.SQ_USSC_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MALG_SQ_MALHA_GEOGRAFICA) into i from MALHA_GEOGRAFICA;
  loop
    select cprod.SQ_MALG_SQ_MALHA_GEOGRAFICA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MARP_SQ_MARCO_PRODUCAO) into i from MARCO_PRODUCAO;
  loop
    select cprod.SQ_MARP_SQ_MARCO_PRODUCAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MARP_SQ_MARCO_PRODUCAO) into i from MARCO_PROD_UNID_OPERATIVA;
  loop
    select cprod.SQ_MARP_SQ_MARCO_PRODUCAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MEME_SQ_MEDICAO_MENSAL) into i from MEDICAO_MENSAL;
  loop
    select cprod.SQ_MEME_SQ_MEDICAO_MENSAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from MEDICAO_MENSAL;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MEPI_SQ_BOLETIM_MENSAL_MOVI)
  into   i
  from   MEDICAO_PRODUCAO_INSTALACAO;
  loop
    select cprod.SQ_MEPI_SQ_BOLETIM_MENSAL_MOVI.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MEVC_SQ_MEDI_VOL_CORRENTE)
  into   i
  from   MEDICAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_MEVC_SQ_MEDI_VOL_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE) into i from MEDICAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(MEZP_SQ_MEDICAO_ZONA_PROD) into i from MEDICAO_ZONA_PRODUCAO;
  loop
    select cprod.SQ_MEZP_SQ_MEDICAO_ZONA_PROD.nextval into j from dual;
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
  select max(PASC_CD_SEQUENCIAL) into i from PARAMETRO_SCPROD;
  loop
    select cprod.SQ_PASC_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PREO_SQ_PREVISAO_OPERACAO) into i from PREVISAO_OPERACAO;
  loop
    select cprod.SQ_PREO_SQ_PREVISAO_OPERACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA) into i from PREVISAO_OPERACAO;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LCPE_SQ_LOCACAO_OPERACIONAL) into i from PREVISAO_OPERACAO;
  loop
    select cprod.SQ_LCPE_SQ_LOCACAO_OPERACIONAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PPRP_SQ_PREVISAO_PARADA) into i from PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_PPRP_SQ_PREVISAO_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TPDD_SQ_TIPO_PARADA) into i from PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_TPDD_SQ_TIPO_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(LPAP_SQ_LOCALIDADE_PARADA)
  into   i
  from   PREVISAO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_LPAP_SQ_LOCALIDADE_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CPCN_SQ_CMPS_CRNT) into i from PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CPCN_SQ_CMPS_CRNT.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(PRVC_SQ_PREV_VOL_CORRENTE)
  into   i
  from   PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_PRVC_SQ_PREV_VOL_CORRENTE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(REPC_SQ_REFERENCIA_PREVISAO)
  into   i
  from   PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_REPC_SQ_REFERENCIA_PREVISAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CCUO_SQ_CORRENTE_UNIDADE)
  into   i
  from   PREVISAO_VOLUME_CORRENTE;
  loop
    select cprod.SQ_CCUO_SQ_CORRENTE_UNIDADE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(REPC_SQ_REFERENCIA_PREVISAO)
  into   i
  from   REFERENCIA_PREVISAO_CORRENTE;
  loop
    select cprod.SQ_REPC_SQ_REFERENCIA_PREVISAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(STAP_SQ_STATUS_APROVACAO) into i from STATUS_APROVACAO;
  loop
    select cprod.SQ_STAP_SQ_STATUS_APROVACAO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(SCEA_SQ_STATUS_CENARIO) into i from STATUS_CENARIO_ANALISE;
  loop
    select cprod.SQ_SCEA_SQ_STATUS_CENARIO.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(STUP_SQ_STATUS_UNID_PROD) into i from STATUS_UNIDADE_PRODUCAO;
  loop
    select cprod.SQ_STUP_SQ_STATUS_UNID_PROD.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TARM_SQ_TAREFA_MENSAL) into i from TAREFA_MENSAL;
  loop
    select cprod.SQ_TARM_SQ_TAREFA_MENSAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TAST_CD_SEQUENCIAL) into i from TAREFA_STATUS;
  loop
    select cprod.SQ_TAST_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TARM_SQ_TAREFA_MENSAL) into i from TAREFA_STATUS;
  loop
    select cprod.SQ_TARM_SQ_TAREFA_MENSAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TEAN_SQ_TENDENCIA_ANALISE) into i from TENDENCIA_ANALISE;
  loop
    select cprod.SQ_TEAN_SQ_TENDENCIA_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(ANAP_SQ_ANALISE) into i from TENDENCIA_ANALISE;
  loop
    select cprod.SQ_ANAP_SQ_ANALISE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from TIPO_EXCE_INFO_PART_UNID_PROD;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(TPDD_SQ_TIPO_PARADA) into i from TIPO_PARADA_PRODUCAO;
  loop
    select cprod.SQ_TPDD_SQ_TIPO_PARADA.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(UPEA_SQ_USUARIO_PERFIL) into i from USUARIO_PERFIL_ACESSO;
  loop
    select cprod.SQ_UPEA_SQ_USUARIO_PERFIL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(CPEA_SQ_CONTROLE_PERFIL) into i from USUARIO_PERFIL_ACESSO;
  loop
    select cprod.SQ_CPEA_SQ_CONTROLE_PERFIL.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(VMTR_SQ_VOLU_MOVI_TRIB) into i from VOLU_MOVI_TRIB;
  loop
    select cprod.SQ_VMTR_SQ_VOLU_MOVI_TRIB.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(VMTR_SQ_VOLU_MOVI_TRIB) into i from VOLU_MOVI_TRIB_DETALHE;
  loop
    select cprod.SQ_VMTR_SQ_VOLU_MOVI_TRIB.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(VMTO_SQ_VOLUME_DETALHE) into i from VOLU_MOVI_TRIB_DETALHE;
  loop
    select cprod.SQ_VMTO_SQ_VOLUME_DETALHE.nextval into j from dual;
    exit when j > i;
  end loop;
  select max(IPUP_CD_SEQUENCIAL) into i from VOLU_PROD_ITEM;
  loop
    select cprod.SQ_IPUP_CD_SEQUENCIAL.nextval into j from dual;
    exit when j > i;
  end loop;

end;
0
0
