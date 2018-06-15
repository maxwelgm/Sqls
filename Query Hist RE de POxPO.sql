select * 
from
(
                                SELECT VW_UO.UNOP_SG_UNID_OPER UNID_OPER_P1,
                                       hrpp.pprp_sq_previsao_parada cd_parada_p1,                                       
                                       VW_UO.IPUO_NR_ORDENACAO_GEOGRAFICA ORDENACAO_GEOGRAFICA_P1,
                                       REPC.REPC_IN_SITUACAO SITUACAO_P1,
                                       nvl(to_char(hrpp.lpap_sq_localidade_parada), HRPP.LPAP_SG_LOCALIDADE_PARADA) COD_PLATA_LOCA_P1,
                                       HRPP.LPAP_SG_LOCALIDADE_PARADA || ' - ' || HRPP.LPAP_NM_LOCALIDADE_PARADA LOCALIDADE_PLATAFORMA_P1,
                                       HRPP.PPRP_DT_INICIO_PREV DT_INICIO_P1,
                                       HRPP.PPRP_DT_FIM_PREV DT_FIM_P1,
                                       HRPP.PPRP_MD_PERDA_DIARIA PERDA_DIARIA_P1,
                                       HRPP.TPDD_NM_TIPO_PARADA TIPO_PARADA_P1,
                                       HRPP.PPRP_DS_PREVISAO_PARADA DESCRICAO_PARADA_P1
                                FROM CPROD.HIST_PREVISAO_PARADA_PRODUCAO HRPP
                                LEFT JOIN CPROD.LOG_ACAO_REF_PREV_CORRENTE LARP ON HRPP.LARP_SQ_LOG_ACAO_REF_PREV = LARP.LARP_SQ_LOG_ACAO_REF_PREV
                                LEFT JOIN CPROD.REFERENCIA_PREVISAO_CORRENTE REPC ON LARP.REPC_SQ_REFERENCIA_PREVISAO = REPC.REPC_SQ_REFERENCIA_PREVISAO
                                LEFT JOIN CPROD.VW_UNIDADE_OPERATIVA_ORIGEM VW_UO ON REPC.UNOP_CD_UNID_OPER = VW_UO.UNOP_CD_UNID_OPER
                                WHERE REPC.REPC_DT_REFERENCIA = TO_DATE('10/08/2016', 'DD/MM/YYYY')
                                AND REPC.TMOC_CD_TIPO_MOV_CORRENTE = 1
                                AND UPPER(HRPP.TPDD_NM_TIPO_PARADA) IN ('PARADA PROGRAMADA', 'PARADA NÃO PROGRAMADA', 'INTERVENÇÃO PROGRAMADA', 'INTERVENÇÃO NÃO PROGRAMADA')
                                AND  REPC.UNOP_CD_UNID_OPER = 110 -- IN (169, 161, 120, 110, 162, 160, 191, 113, 172, 280, 114)
                                AND TO_NUMBER(TO_CHAR(HRPP.PPRP_DT_INICIO_PREV, 'YYYYMM')) <= 201612
                                AND TO_NUMBER(TO_CHAR(HRPP.PPRP_DT_FIM_PREV, 'YYYYMM')) >= 201601
) P1 full outer join 

(
                                SELECT VW_UO.UNOP_SG_UNID_OPER UNID_OPER_P2,
                                       VW_UO.IPUO_NR_ORDENACAO_GEOGRAFICA ORDENACAO_GEOGRAFICA_P2,
                                       hrpp.pprp_sq_previsao_parada cd_parada_p2,
                                       REPC.REPC_IN_SITUACAO SITUACAO_P2,
                                       nvl(to_char(hrpp.lpap_sq_localidade_parada), HRPP.LPAP_SG_LOCALIDADE_PARADA) COD_PLATA_LOCA_P2,
                                       HRPP.LPAP_SG_LOCALIDADE_PARADA || ' - ' || HRPP.LPAP_NM_LOCALIDADE_PARADA LOCALIDADE_PLATAFORMA_P2,
                                       HRPP.PPRP_DT_INICIO_PREV DT_INICIO_P2,
                                       HRPP.PPRP_DT_FIM_PREV DT_FIM_P2,
                                       HRPP.PPRP_MD_PERDA_DIARIA PERDA_DIARIA_P2,
                                       HRPP.TPDD_NM_TIPO_PARADA TIPO_PARADA_P2,
                                       HRPP.PPRP_DS_PREVISAO_PARADA DESCRICAO_PARADA_P2
                                FROM CPROD.HIST_PREVISAO_PARADA_PRODUCAO HRPP
                                LEFT JOIN CPROD.LOG_ACAO_REF_PREV_CORRENTE LARP ON HRPP.LARP_SQ_LOG_ACAO_REF_PREV = LARP.LARP_SQ_LOG_ACAO_REF_PREV
                                LEFT JOIN CPROD.REFERENCIA_PREVISAO_CORRENTE REPC ON LARP.REPC_SQ_REFERENCIA_PREVISAO = REPC.REPC_SQ_REFERENCIA_PREVISAO
                                LEFT JOIN CPROD.VW_UNIDADE_OPERATIVA_ORIGEM VW_UO ON REPC.UNOP_CD_UNID_OPER = VW_UO.UNOP_CD_UNID_OPER
                                WHERE REPC.REPC_DT_REFERENCIA = TO_DATE('10/01/2016', 'DD/MM/YYYY')
                                AND REPC.TMOC_CD_TIPO_MOV_CORRENTE = 1
                                AND UPPER(HRPP.TPDD_NM_TIPO_PARADA) IN ('PARADA PROGRAMADA', 'PARADA NÃO PROGRAMADA', 'INTERVENÇÃO PROGRAMADA', 'INTERVENÇÃO NÃO PROGRAMADA')
                                AND  REPC.UNOP_CD_UNID_OPER = 110 -- IN (169, 161, 120, 110, 162, 160, 191, 113, 172, 280, 114)
                                AND TO_NUMBER(TO_CHAR(HRPP.PPRP_DT_INICIO_PREV, 'YYYYMM')) <= 201612 
                                AND TO_NUMBER(TO_CHAR(HRPP.PPRP_DT_FIM_PREV, 'YYYYMM')) >= 201601
) P2 on p1.cd_parada_p1 = p2.cd_parada_p2
--on P1.UNID_OPER_P1 = P2.UNID_OPER_P2 and P1.COD_PLATA_LOCA_P1 = P2.COD_PLATA_LOCA_P2
--and P1.DT_INICIO_P1 = p2.DT_INICIO_P2 and P1.DT_FIM_P1 = P2.DT_FIM_P2 and P1.TIPO_PARADA_P1 = P2.TIPO_PARADA_P2
