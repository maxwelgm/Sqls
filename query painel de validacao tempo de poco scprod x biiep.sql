select SCPROD.COD_CAMPO,
       SCPROD.SG_CAMPO,
       SCPROD.NM_CAMPO,
       SCPROD.COD_POCO_ANP,
       SCPROD.COD_POCO,
       SCPROD.SG_POCO,
       SCPROD.TEMPO_PROD_POCO,
       SCPROD.TOTAL_HORAS_MES,
       BIIEP.TEMPO_PROD_POCO TEMPO_PROD_POCO_BIIEP,
       case when SCPROD.TEMPO_PROD_POCO > SCPROD.TOTAL_HORAS_MES then 'S' else 'N' end IN_MAIOR_TOTAL_MES,
       decode(SCPROD.TEMPO_PROD_POCO, nvl(BIIEP.TEMPO_PROD_POCO, 0), 'N', 'S') IN_DIFERENTE_BIIEP

--select COUNT(1)
from   (SELECT mpm.mpmn_nr_ano_mes ANO_MES,
               mpm.pais_cd_pais COD_PAIS,
               mpm.unfe_cd_uf COD_UF,
               mpm.unop_cd_unid_oper COD_UN,
               ipc.inpa_cd_campo_anp COD_CAMPO_ANP,
               ipc.camp_cd_campo COD_CAMPO,
               c.camp_sg_campo SG_CAMPO,
               c.camp_nm_campo NM_CAMPO,
               nvl(ipp.inpp_cd_poco_anp, pp.prfp_cd_cadastro) COD_POCO_ANP,
               p.POCO_CD_POCO COD_POCO,
               p.poco_sg_pref_depex SG_POCO,
               nvl(round(max(mpm.mpmn_nr_tempo_producao_mensal), 5), 0) TEMPO_PROD_POCO,
               to_number(to_char(last_day(to_date(mpm.mpmn_nr_ano_mes, 'YYYYMM')), 'dd')) * 24 * 60 TOTAL_HORAS_MES
        
        FROM   cprod.medi_poco_mnsl mpm
        inner  join rst.campo c on c.camp_cd_campo = mpm.camp_cd_campo
        inner  join cprod.info_part_campo ipc on ipc.camp_cd_campo = mpm.camp_cd_campo
        inner  join eep.poco p on p.POCO_CD_POCO = mpm.poco_cd_poco
        left   join cprod.info_part_poco ipp on ipp.poco_cd_poco = mpm.poco_cd_poco
        left   join (select pp1.POCO_CD_POCO,
                           pp1.prfp_cd_cadastro
                    from   eep.prefixo_poco pp1
                    where  pp1.PRFP_NM_ORIGEM = 'ANP'
                           and pp1.PRFP_DT_CRIACAO =
                           (select max(pp2.PRFP_DT_CRIACAO)
                                from   eep.prefixo_poco pp2
                                where  pp2.POCO_CD_POCO = pp1.poco_cd_poco
                                       and pp2.PRFP_NM_ORIGEM = 'ANP')) pp on pp.poco_cd_poco = mpm.poco_cd_poco
        
        where  mpm.mpmn_nr_ano_mes = 201106
               and mpm.curv_cd_curv in (1, 2, 6, 7)
        group  by mpm.mpmn_nr_ano_mes,
                  mpm.unop_cd_unid_oper,
                  ipc.inpa_cd_campo_anp,
                  ipc.camp_cd_campo,
                  p.POCO_CD_POCO,
                  c.camp_sg_campo,
                  c.camp_nm_campo,
                  mpm.unfe_cd_uf,
                  nvl(ipp.inpp_cd_poco_anp, pp.prfp_cd_cadastro),
                  p.poco_sg_pref_depex,
                  mpm.pais_cd_pais
        
        ) SCPROD,
       
       (SELECT vw.ANO_MES_REF ano_mes,
               vw.COD_PAIS COD_PAIS,
               vw.COD_UF COD_UF,
               vw.COD_UN COD_UN,
               vw.CD_CONTR_CONC CD_CONTR_CONC,
               vw.COD_CAMPO COD_CAMPO,
               vw.COD_POCO COD_POCO,
               round(vw.TEMPO_PRODUCAO, 5) TEMPO_PROD_POCO
        FROM   biiep.vw_hora_poco_operacao_mes_anp@biiep vw
        WHERE  vw.ANO_MES_REF = 201106) BIIEP
where  SCPROD.ANO_MES = BIIEP.ANO_MES(+)
       and SCPROD.COD_PAIS = BIIEP.COD_PAIS(+)
       AND SCPROD.COD_UF = BIIEP.COD_UF(+)
       AND SCPROD.COD_UN = BIIEP.COD_UN(+)
       AND SCPROD.COD_CAMPO = BIIEP.COD_CAMPO(+)
       AND SCPROD.COD_POCO = BIIEP.COD_POCO(+)
       AND (SCPROD.TEMPO_PROD_POCO <> nvl(BIIEP.TEMPO_PROD_POCO, 0) OR SCPROD.TEMPO_PROD_POCO > SCPROD.TOTAL_HORAS_MES)
order by SCPROD.SG_CAMPO, SCPROD.NM_CAMPO, SCPROD.SG_POCO
